#!/bin/bash

BASE_DIR="$(dirname $0)/.."
CONFIG_DIR="${BASE_DIR}/configs"
COMPONENTS_DIR="${BASE_DIR}/components"
CONTROLLERS_DIR="${BASE_DIR}/controllers"
UTILS_DIR="${BASE_DIR}/utils"

source "${CONFIG_DIR}/constants.sh"
source "${COMPONENTS_DIR}/global.sh"
source "${UTILS_DIR}/utils.sh"
source "${CONTROLLERS_DIR}/system/cmds.sh"
source "${CONTROLLERS_DIR}/system/main.sh"
source "${CONTROLLERS_DIR}/setup/packages.sh"
source "${CONTROLLERS_DIR}/setup/main.sh"

declare -A index_menu packages_menu system_menu

init() {
    load_configs "${CONFIG_DIR}/index.yaml" index_menu
    load_configs "${CONFIG_DIR}/packages.yaml" packages_menu
    load_configs "${CONFIG_DIR}/system.yaml" system_menu
    menu="index_menu"
}

handle_choice() {
    local choice_index=$1
    local choice_found=false
    declare -n current_menu=$menu

    if ! validate_is_number $choice_index; then
        return
    fi

    for choice_key in "${!current_menu[@]}"; do
        if [[ "$choice_key" == "$choice_index"* ]]; then
            choice_found=true
            local choice_value="${current_menu[$choice_key]}"
            break
        fi
    done

    if ! validate_is_exists $choice_found; then
        return
    fi

    case $menu in
        "index_menu")
            if [[ $choice_index -ne EXIT_CHOICE ]]; then
                menu="$choice_value"
            else
                menu="exit"
            fi
            ;;
        "packages_menu")
            if [[ $choice_index -ne EXIT_CHOICE ]]; then
                install_package $choice_value $(check_version)
            else
                menu="index_menu"
            fi
            ;;
        "system_menu")
            if [[ $choice_index -ne EXIT_CHOICE ]]; then
                exec_system_cmd $choice_value
            else
                menu="index_menu"
            fi
            ;;
    esac
}

main() {
    init

    while true; do
        render_menu $menu

        read -p " Enter your choice: " choice
        handle_choice $choice

        if [[ $menu == "exit" ]]; then
            shutdown_service
        fi

    done
}

main
