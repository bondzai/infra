#!/bin/bash

source "$(dirname $0)/utils/utils.sh"
source "$(dirname $0)/components/banner.sh"
CONFIG_PATH="$(dirname $0)/config/config.conf"

load_config() {
    declare -gA menu_items
    while IFS="=" read -r key value; do
        value="${value%\"}"
        value="${value#\"}"
        menu_items[$key]=$value
    done < "$CONFIG_PATH"
}

render_menu() {
    echo " TWEAK | FIXED | CLEANER | INSTALLER | OTHER "
    echo " ------------------------------------------- "
    for key in "${!menu_items[@]}"; do
        local desc="${menu_items[$key]%%:*}"
        echo " [$key] | $desc"
    done
}

handle_choice() {
    local choice=$1
    local script="${menu_items[$choice]#*:}"
    
    if [[ $script == "exit" ]]; then
        exit
    elif [[ -n $script ]]; then
        . "$script"
    else
        echo "Invalid choice. Press Enter to continue." && read -s
    fi
}

main() {
    load_config
    while true; do
        render_menu
        read -p "Enter your choice: " choice
        handle_choice "$choice"
    done
}

main
