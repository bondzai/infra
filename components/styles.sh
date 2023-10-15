#!/bin/bash

# Define text styles
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
WHITE="\033[1;37m"
CYAN="\033[1;36m"
RESET="\033[0m"

use_style() {
    echo -e "${1}${2}${RESET}"
}
