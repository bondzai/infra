#!/bin/bash

exec_system_cmd() {
    local cmd=$1

    if declare -f "exec_$cmd" >/dev/null; then
        echo -e " ===== start executing $cmd... ====="
        echo
        "exec_$cmd"
        echo
        echo -e ${YELLOW}" ===== end executing $cmd... ====="
    else
        echo -e ${RED}"Command '$cmd' is not supported."
    fi

    sleep 0.5
    echo "Press ENTER to continue..."
    read _
}
