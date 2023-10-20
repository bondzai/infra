#!/bin/bash

source "$(dirname $0)/utils/utils.sh"
source "$(dirname $0)/components/banner.sh"
source "$(dirname $0)/components/styles.sh"

INDEX_LIST="$(dirname $0)/config/index.conf"
PACKAGES_LIST="$(dirname $0)/config/packages.conf"

SCRIPTS_PATH="$(dirname $0)/scripts"

render_menu() {
    declare -n local_list=$1

    render_banner

    for key in "${!local_list[@]}"; do
        local desc="${local_list[$key]%%:*}"
        echo " [$key] | $desc"
    done
    echo -e "${message}${YELLOW}"
}

handle_choice() {
    local choice=$1
    declare -n local_list=$2

    local value="${local_list[$choice]#*:}"
    local current_page="${local_list[0]#*:}"
    
    case "$current_page" in
        "index.conf")
            if [[ $value == "exit" ]]; then
                exit
            elif [[ $value == "packages.conf" ]]; then
                return 1
            fi
        ;;
        "packages.conf")
            if [[ $value == "exit" ]]; then
                return 0
            fi
        ;;
    esac
    return -1
}


main() {
    declare -A index_list
    declare -A packages_list
    load_config $INDEX_LIST index_list
    load_config $PACKAGES_LIST packages_list

    current_menu="index_list"
    render_menu $current_menu

    while true; do
        read -p " Enter your choice: " choice
        
        handle_choice "$choice" $current_menu        
        case $? in
            0 | 255)
                current_menu="index_list"
                ;;
            1)
                current_menu="packages_list"
                ;;
        esac
        
        render_menu $current_menu
    done
}

main
