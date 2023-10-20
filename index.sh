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
        if [[ $key != "0" ]]; then
            echo " [$key] | $desc"
        fi
    done
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
                echo "exit"
            elif [[ $value == "packages.conf" ]]; then
                echo "packages_list"
            fi
        ;;
        "packages.conf")
            if [[ $value == "exit" ]]; then
                echo "index_list"
            fi
        ;;
    esac
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
        current_menu=$(handle_choice "$choice" $current_menu)
        if [[ $current_menu == "exit" ]]; then
            exit
        fi
        render_menu $current_menu
    done
}

main
