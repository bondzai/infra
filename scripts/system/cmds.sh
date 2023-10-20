#!/bin/bash

exec_update() {
    sudo apt update && sudo apt upgrade -y
}

exec_cleanup() {
    trash-empty
    sleep 1
    echo -e $GREEN"Trash empty!"
}
