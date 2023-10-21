#!/bin/bash

BASE_DIR="$(dirname $0)/.."
CONFIG_DIR="${BASE_DIR}/config"
COMPONENTS_DIR="${BASE_DIR}/components"
SCRIPTS_DIR="${BASE_DIR}/scripts"
UTILS_DIR="${BASE_DIR}/utils"

source "${CONFIG_DIR}/constants.sh"
source "${COMPONENTS_DIR}/global.sh"
source "${UTILS_DIR}/utils.sh"
source "${SCRIPTS_DIR}/system/cmds.sh"
source "${SCRIPTS_DIR}/system/main.sh"
source "${SCRIPTS_DIR}/setup/packages.sh"
source "${SCRIPTS_DIR}/setup/main.sh"

declare -A index_menu
declare -A packages_menu
declare -A system_menu

extract_dict_from_yaml "${CONFIG_DIR}/index.yaml" index_menu
extract_dict_from_yaml "${CONFIG_DIR}/packages.yaml" packages_menu
extract_dict_from_yaml "${CONFIG_DIR}/system.yaml" system_menu

menu="index_menu"

handle_choice() {
    local selected_choice_index=$1
    if ! validate_is_number $selected_choice_index; then
        return
    fi

    declare -n local_list=$2
    local choice_found=false

    for selected_choice_key in "${!local_list[@]}"; do
        if [[ "$selected_choice_key" == "$selected_choice_index"* ]]; then
            choice_found=true
            local selected_choice_value="${local_list[$selected_choice_key]}"
            break
        fi
    done

    if ! validate_is_exists $choice_found; then
        return
    fi

    case $menu in
        "index_menu")
            if [[ $selected_choice_index -ne EXIT_CHOICE ]]; then
                menu="$selected_choice_value"
            else
                menu="exit"
            fi
            ;;
        "packages_menu")
            if [[ $selected_choice_index -ne EXIT_CHOICE ]]; then
                install_package $selected_choice_value $(check_version)
            else
                menu="index_menu"
            fi
            ;;
        "system_menu")
            if [[ $selected_choice_index -ne EXIT_CHOICE ]]; then
                exec_system_cmd $selected_choice_value
            else
                menu="index_menu"
            fi
            ;;
    esac
}

main() {
    render_menu $menu
    while true; do
        read -p " Enter your choice: " choice
        handle_choice $choice $menu

        if [[ $menu == "exit" ]]; then
            render_falldown
        fi

        render_menu $menu
    done
}

main
