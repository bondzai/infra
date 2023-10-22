#!/bin/bash

exec_system_cmd() {
    local cmd=$1

    if declare -f "exec_$cmd" >/dev/null; then
        pprint -f "===== start executing $cmd... ====="
        "exec_$cmd"
        pprint -f "===== end executing $cmd... ====="
    else
        pprint -e "Command '$cmd' is not supported."
    fi

    pprint -f "Press ENTER to continue..."
    read _
}
