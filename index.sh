#!/bin/bash

# Get the directory of the currently executing script
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Define variables for file paths based on the script's directory
components_dir="$CURRENT_DIR/components"
banner_script="$components_dir/banner.sh"

# # Change to the directory of banner_script, source it, and then go back
pushd "$components_dir" > /dev/null
source "./banner.sh"
popd > /dev/null

menu() {
    while true; do
        render
        echo " TWEAK | FIXED | CLEANER | OTHER                            INSTALLER"
        echo " --------------------------------                           ---------"
        echo " [1] | Action Center & Notification | A | B     [101] | Brave (browser)"
        
        echo " [99] | exit "

        read -p "Enter your choice: " choice

        case $choice in
            1) ./update_system.sh ;;
            2) ./backup_data.sh ;;
            3) ./monitor_system.sh ;;
            4) ./install_app.sh ;;
            5) ./cleanup_system.sh ;;
            99) exit ;;
            *) echo "Invalid choice. Press Enter to continue." && read -s ;;
        esac
    done
}

menu
