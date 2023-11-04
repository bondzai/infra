#!/bin/bash

source "$(dirname $0)/../utils/constants.sh"

init() {
    trap handle_error ERR

    for dir in "${!SOURCES[@]}"; do
        for file in ${SOURCES[$dir]}; do
            source "${dir}/${file}"
        done
    done

    for config_file in "${!CONFIGS[@]}"; do
        load_configs "${config_file}" "${CONFIGS[$config_file]}"
    done

}

init

installer=""

# Read and install packages from dependencies.yaml
while IFS= read -r line; do
    if [[ $line == \#* ]]; then
        continue
    fi

    if [[ $line == apt:* ]]; then
        pprint -p "Updating apt package manager$LAUNCH"
        sudo apt update
        installer="sudo apt install -y"

    elif [[ $line == snap:* ]]; then
        installer="sudo snap install"

    elif [[ -n $installer ]]; then
        package_name=${line#- }
        pprint -p "Installing $package_name$LAUNCH"
        $installer "$package_name"
    fi
done < dependencies.yaml

pprint -s "All dependencies installed!"
