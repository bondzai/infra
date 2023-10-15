#!/bin/bash

# Function to display a clean banner
display_banner() {
    local title="$1"
    local width=60
    local padding="$((($width - ${#title}) / 2))"
    local banner=""

    for ((i = 0; i < $padding; i++)); do
        banner+="="
    done

    banner+=" $title "

    for ((i = 0; i < $padding; i++)); do
        banner+="="
    done

    # Ensure the total width is always 60 characters
    echo "${banner:0:$width}"
}

# Function to get a YAML value by key
get_yaml_value() {
    local file="$1"
    local key="$2"
    grep -E "$key: " "$file" | sed -E "s/$key: (.+)/\1/"
}

# Function to install a package
install_package() {
    local package_name="$1"
    local install_script="$REPO_DIR/$package_name.sh"

    if [ -f "$install_script" ]; then
        echo "Installing $package_name..."
        # Execute the package install script
        bash "$install_script"
    else
        echo "Install script not found for package: $package_name"
    fi
}

# Main menu
display_banner "Package Management Tool"
echo "1. List available packages"
echo "2. Install packages"
echo "3. Quit"

read -p "Select an option (1/2/3): " option

case "$option" in
    1)
        # Parse the YAML file and list available packages
        REPO_DIR=$(get_yaml_value "config/common_config.yaml" "common.repository")
        PACKAGES=$(get_yaml_value "config/common_config.yaml" "common.packages")
        echo "Available packages: $PACKAGES"
        ;;
    2)
        # Parse the YAML file and install packages
        read -p "Enter the package names (comma-separated): " input_packages
        IFS=',' read -ra selected_packages <<< "$input_packages"
        
        for package in "${selected_packages[@]}"; do
            install_package "$package"
        done
        ;;
    3)
        echo "Exiting."
        exit 0
        ;;
    *)
        echo "Invalid option. Please select 1, 2, or 3."
        ;;
esac
