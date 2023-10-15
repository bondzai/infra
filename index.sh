#!/bin/bash

source "$(dirname $0)/utils/utils.sh"
source "$(dirname $0)/components/banner.sh"

render_menu() {
    render
    echo " TWEAK | FIXED | CLEANER | INSTALLER | OTHER "
    echo " ------------------------------------------- "
    for key in "${!menu_items[@]}"; do
        echo " [$key] | ${menu_items[$key]}"
    done
}

handle_choice() {
    local choice=$1
    case $choice in
        1) ./update_system.sh ;;
        2) ./backup_data.sh ;;
        3) ./monitor_system.sh ;;
        4) ./install_app.sh ;;
        5) ./cleanup_system.sh ;;
        99) exit ;;
        *) echo "Invalid choice. Press Enter to continue." && read -s ;;
    esac
}

main() {
    declare -A menu_items
    menu_items=(
        [1]="Action Center & Notification"
        [2]="Backup Data"
        [3]="Monitor System"
        [4]="Install App"
        [5]="Cleanup System"
        [101]="Brave (browser)"
        [99]="Exit"
    )

    while true; do
        render_menu
        read -p "Enter your choice: " choice
        handle_choice "$choice"
    done
}

main
