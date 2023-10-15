#!/bin/sh
prerequisite() {
    sudo apt-get install curl git mercurial make binutils bison gcc build-essential -y
}

install() {
    zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
}

prerequisite
install
