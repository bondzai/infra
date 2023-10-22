#!/bin/bash

installer=""

# Read and install packages from deps.yaml
while IFS= read -r line; do
    if [[ $line == \#* ]]; then
        continue
    fi

    if [[ $line == apt:* ]]; then
        pprint -p "Updating apt package manager..."
        sudo apt update
        installer="sudo apt install -y"

    elif [[ $line == snap:* ]]; then
        installer="sudo snap install"

    elif [[ -n $installer ]]; then
        package_name=${line#- }
        pprint -p "Installing $package_name..."
        $installer "$package_name"
    fi
done < deps.yaml

pprint -s "All dependencies installed!"
