#!/bin/bash

source "$(dirname $0)/utils/utils.sh"
source "$(dirname $0)/components/banner.sh"
source "$(dirname $0)/components/styles.sh"

CONFIG_FILE="$(dirname $0)/config/index.conf"
SCRIPTS_PATH="$(dirname $0)/scripts"

render_menu() {
    render_banner
    echo " DEV | OPS | INSTALLER & OTHER "
    echo " ----------------------------- "
    for key in "${!menu_items[@]}"; do
        local desc="${menu_items[$key]%%:*}"
        echo " [$key] | $desc"
    done
    echo -e ${YELLOW}    
}

handle_choice() {
    local choice=$1
    local script="${menu_items[$choice]#*:}"
    
    if [[ $script == "exit" ]]; then
        exit
    elif [[ -n $script && -f "$SCRIPTS_PATH/$script" ]]; then
        . "$SCRIPTS_PATH/$script"
    else
        echo "Invalid choice or script not found. Press Enter to continue." && read -s
    fi
}

main() {
    declare -A menu_items

    load_config "$CONFIG_FILE" menu_items

    while true; do
        render_menu
        read -p " Enter your choice: " choice
        echo
        handle_choice "$choice"
    done
}

main
