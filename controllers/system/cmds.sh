#!/bin/bash

exec_update() {
    sudo apt update && sudo apt upgrade -y
    pprint -s "System is up to date!"
}

exec_cleanup() {
    trash-empty
    pprint -s "Trash empty!"
}

exec_check_network_status() {
    local host="www.google.com"
    local speedtest_command="speedtest-cli"

    if ping -c 3 "$host" &> /dev/null; then
        pprint -s "Network status: Online"

        if command -v "$speedtest_command" &> /dev/null; then
            echo "Checking network speed$LANUCH"
            $speedtest_command
            echo
        else
            pprint -w "Speedtest-cli is not installed. You can install it for speed testing."
        fi
    else
        pprint -e "Network status: Offline"
    fi
}
