#!/bin/bash

source "$(dirname $0)/../utils/constants.sh"

init() {
    trap handle_error ERR

    for dir in "${!SOURCES[@]}"; do
        for file in ${SOURCES[$dir]}; do
            source "${dir}/${file}"
        done
    done

    for config_file in "${!CONFIGS[@]}"; do
        load_configs "${config_file}" "${CONFIGS[$config_file]}"
    done

    menu=MAIN_MENU
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
        MAIN_MENU)
            if [[ $choice_index -ne EXIT_CHOICE ]]; then
                menu="$choice_value"
            else
                shutdown_service
            fi
            ;;
        INSTALLER_MENU)
            if [[ $choice_index -ne EXIT_CHOICE ]]; then
                install_package $choice_value $(check_version)
            else
                menu=MAIN_MENU
            fi
            ;;
        SYSTEM_MENU | NETWORK_MENU)
            if [[ $choice_index -ne EXIT_CHOICE ]]; then
                execute_command $choice_value
            else
                menu=MAIN_MENU
            fi
            ;;
    esac
}

main() {
    init

    while true; do
        render_menu $menu

        read_choice

        handle_choice $choice
    done
}

main
