#!/bin/bash

exec_update() {
    sudo apt update && sudo apt upgrade -y
}

exec_cleanup() {
    trash-empty
    sleep 1
    echo -e $GREEN"Trash empty!"
}

exec_check_network_status() {
    local host="www.google.com"
    local speedtest_command="speedtest-cli"

    if ping -c 3 "$host" &> /dev/null; then
        echo "Network status: Online"

        if command -v "$speedtest_command" &> /dev/null; then
            echo "Checking network speed..."
            $speedtest_command
        else
            echo "Speedtest-cli is not installed. You can install it for speed testing."
        fi
    else
        echo "Network status: Offline"
    fi
}
