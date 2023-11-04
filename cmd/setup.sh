#!/bin/bash

# Set the path to constants.sh based on the script's location
source "$(dirname "$0")/../utils/constants.sh"

# Initialize the script
init() {
    # Set up error handling
    trap 'handle_error' ERR

    # Load source files from the SOURCES array
    for dir in "${!SOURCES[@]}"; do
        for file in "${SOURCES[$dir]}"; do
            source "${dir}/${file}"
        done
    done

    # Load configuration files from the CONFIGS array
    for config_file in "${!CONFIGS[@]}"; do
        load_configs "${config_file}" "${CONFIGS[$config_file]}"
    done
}

# Call the initialization function
init

# Define the installer variable
installer=""

# Read and install packages from dependencies.yaml
while IFS= read -r line; do
    # Skip lines starting with a hash (#)
    if [[ $line == \#* ]]; then
        continue
    fi

    # Check if the line starts with "apt:"
    if [[ $line == apt:* ]]; then
        pprint -p "Updating apt package manager$LAUNCH"
        sudo apt update
        installer="sudo apt install -y"

    # Check if the line starts with "snap:"
    elif [[ $line == snap:* ]]; then
        installer="sudo snap install"

    # If the installer is defined, install the package
    elif [[ -n $installer ]]; then
        package_name=${line#- }
        pprint -p "Installing $package_name$LAUNCH"
        $installer "$package_name"
    fi
done < ../configs/dependencies.yaml

pprint -s "All dependencies installed!"
