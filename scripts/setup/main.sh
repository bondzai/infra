#!/bin/bash

install_package() {
    local package=$1
    local check_version=$2

    if declare -f "setup_$package" >/dev/null; then
        echo -e " ===== start installing $package... ====="
        echo
        "setup_$package"
        echo
        echo -e ${GREEN}" ===== end installing $package... ====="
    else
        echo -e ${RED}"Package '$package' is not supported."
    fi

    sleep 0.5
    check_version $package
    sleep 0.5
    echo
    echo "Press ENTER to continue..."
    read _
}
