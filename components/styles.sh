#!/bin/bash

DEFAULT="\033[0m"
RED="\033[1;31m"
PINK="\033[38;5;213m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
WHITE="\033[1;37m"
MAGENTA="\033[1;35m"
GRAY="\033[1;30m"
PURPLE="\033[1;35m"

use_style() {
    echo -e "${1}${2}${DEFAULT}"
}
