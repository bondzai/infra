#!/bin/bash

exec_check_installed_packages() {
    dpkg --get-selections | grep -v deinstall | cut -f1
}

exec_update() {
    sudo apt update && sudo apt upgrade -y
    pprint -s "System is up to date!"
}

exec_cleanup() {
    trash-empty
    pprint -s "Trash empty!"
}
