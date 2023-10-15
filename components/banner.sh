#!/bin/bash

source "$(dirname $0)/components/styles.sh"

USER_NAME=$(whoami)
HOST_NAME=$(hostname)
OS_NAME=$(lsb_release -ds)
TIMEZONE=$(timedatectl show --property=Timezone --value)
FOLLOW_ME="${GREEN}ABOUT ME: ${WHITE}https://thejb.onrender.com${RESET}"

render_banner() {
    echo "==============================================="
    echo "USER: $(use_style $WHITE $USER_NAME) | MACHINE NAME: $(use_style $WHITE $HOST_NAME)"
    echo "  OS: $(use_style $WHITE "$OS_NAME")"
    echo "  TIME ZONE: $(use_style $WHITE "$TIMEZONE")"
    echo "  $(use_style "$FOLLOW_ME")"
    echo "==============================================="
    echo ""
}
