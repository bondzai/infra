#!/bin/bash
source "$(dirname $0)/../../config/packages.sh"


for package in "${packages[@]}"; do
    if declare -f "setup_$package" >/dev/null; then
        echo -e "start setup $package."
        "setup_$package"
        echo -e "setup $package successfully."
    else
        echo "Package '$package' is not supported."
    fi
done
