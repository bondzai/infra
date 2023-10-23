#!/bin/bash

# system controller
exec_system_cmd() {
    local cmd=$1

    if declare -f "exec_$cmd" >/dev/null; then
        pprint -f "Start executing $cmd command$LANUCH"
        "exec_$cmd"
        pprint -f "End executing $cmd command"
    else
        pprint -e "Command '$cmd' is not supported."
    fi

    pprint -f "Press ENTER to continue..."
    read _
}

# package-installer controller
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

# network controller
