#!/bin/bash
install_package() {
    local package=$1

    if declare -f "setup_$package" >/dev/null; then
        echo -e " ===== start installing $package... ====="
        "setup_$package"
        echo
        echo -e ${YELLOW}" ===== end installing $package... ====="
    else
        echo -e ${RED}"Package '$package' is not supported."
    fi
}
