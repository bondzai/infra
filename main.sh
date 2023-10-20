#!/bin/bash

source "$(dirname $0)/utils/utils.sh"
source "$(dirname $0)/components/banner.sh"
source "$(dirname $0)/components/styles.sh"

source "$(dirname $0)/scripts/setup/setup_packages.sh"
source "$(dirname $0)/scripts/setup/main.sh"

source "$(dirname $0)/scripts/system/main.sh"
source "$(dirname $0)/scripts/system/cmds.sh"

declare -A index_list
declare -A packages_list
declare -A systems_list

load_config "$(dirname $0)/config/index.conf" index_list
load_config "$(dirname $0)/config/packages.conf" packages_list
load_config "$(dirname $0)/config/system.conf" systems_list

current_menu="index_list"

render_menu() {
    declare -n local_list=$1

    clear
    render_banner

    keys=("${!local_list[@]}")
    IFS=$'\n' sorted_keys=($(sort -n <<< "${keys[*]}"))

    for key in "${sorted_keys[@]}"; do
        if [[ "$key" != "0" ]] && [[ "$key" != "99" ]]; then
            local desc="${local_list[$key]%%:*}"
            echo " [$key] | $desc"
        fi
    done

    if [[ -n "${local_list[99]}" ]]; then
        echo " ===================================="
        local desc="${local_list[99]%%:*}"
        echo " [99]| $desc"
    fi

    echo -e "${YELLOW}"
}


handle_choice() {
    local choice=$1
    declare -n local_list=$2

    local value="${local_list[$choice]#*:}"
    local current_page="${local_list[0]#*:}"

    case "$current_page" in
        "index.conf")
            if [[ $value == "exit" ]]; then
                current_menu="exit"
            elif [[ $value == "packages.conf" ]]; then
                current_menu="packages_list"
            elif [[ $value == "system.conf" ]]; then
                current_menu="systems_list"
            fi
        ;;
        "packages.conf")
            if [[ $value == "exit" ]]; then
                current_menu="index_list"
            else
                install_package $value $(check_version)
                current_menu="packages_list"
            fi
        ;;
        "system.conf")
            if [[ $value == "exit" ]]; then
                current_menu="index_list"
            else
                exec_system_cmd $value
                current_menu="systems_list"
            fi
        ;;
    esac
}

main() {
    render_menu $current_menu

    while true; do
        read -p " Enter your choice: " choice
        handle_choice "$choice" $current_menu

        if [[ $current_menu == "exit" ]]; then
            exit
        fi

        render_menu $current_menu
    done
}

main
