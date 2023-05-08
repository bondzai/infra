#!/bin/sh

R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
W="$(printf '\033[1;37m')"
C="$(printf '\033[1;36m')"

start () {
    echo
    printf ${Y}" Start local DNS (systemd-resolved service) ..."${W}
    echo
    sudo systemctl enable systemd-resolved
    sudo systemctl start systemd-resolved
    echo
    printf ${G}" Local DNS running at port 53. "${W}
    echo
}

config () {
    echo
    printf ${Y}" Config local DNS (systemd-resolved service) ..."${W}
    echo
    sudo sed -i 's/nameserver 127\.0\.1\.1/nameserver 1.1.1.1/' /etc/resolv.conf
    cat /etc/resolv.conf
    echo
    printf ${G}" Config local DNS successfully. "${W}
    echo
}

start
config