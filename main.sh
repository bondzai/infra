#!/bin/bash

source "$(dirname $0)/utils/utils.sh"
source "$(dirname $0)/components/global.sh"
source "$(dirname $0)/components/styles.sh"

source "$(dirname $0)/scripts/setup/setup_packages.sh"
source "$(dirname $0)/scripts/setup/main.sh"

source "$(dirname $0)/scripts/system/main.sh"
source "$(dirname $0)/scripts/system/cmds.sh"

source "$(dirname $0)/config/constants.sh"

declare -A index_menu
declare -A packages_menu
declare -A system_menu

extract_dict_from_yaml "$(dirname $0)/config/index.yaml" index_menu
extract_dict_from_yaml "$(dirname $0)/config/packages.yaml" packages_menu
extract_dict_from_yaml "$(dirname $0)/config/system.yaml" system_menu

menu="index_menu"

render_menu() {
    declare -n local_list=$1

    clear
    render_banner

    keys=("${!local_list[@]}")
    IFS=$'\n' sorted_keys=($(sort -n <<< "${keys[*]}"))

    for key in "${sorted_keys[@]}"; do
        index=$(extract_key_digits "$key")
        desc=$(exclude_key_digits "$key")

        if [[ $index == 0 ]]; then
            echo -e " $BLUE========= $desc ========="
        else
            echo -e " $BLUE[$index] | $DEFAULT$desc"
        fi
    done

    echo -e "${BLUE}"
}

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
            if [[ $selected_choice_index -ne 99 ]]; then
                menu="$selected_choice_value"
            else
                menu="exit"
            fi
            ;;
        "packages_menu")
            if [[ $selected_choice_index -ne 99 ]]; then
                install_package $selected_choice_value $(check_version)
            else
                menu="index_menu"
            fi
            ;;
        "system_menu")
            if [[ $selected_choice_index -ne 99 ]]; then
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
