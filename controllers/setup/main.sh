#!/bin/bash

install_package() {
    local package=$1
    local check_version=$2

    if declare -f "setup_$package" >/dev/null; then
        pprint -f "Start installing $package$LANUCH"
        "setup_$package"
        pprint -f "End installing $package"
    else
        pprint -e "Package '$package' is not supported."
    fi

    check_version $package
    pprint -f "Press ENTER to continue..."
    read _
}

list_installed_packages() {
    dpkg --get-selections | grep -v deinstall | cut -f1
}
