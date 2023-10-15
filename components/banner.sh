#!/bin/bash

source "$(dirname $0)/components/styles.sh"

USER_NAME=$(whoami)
HOST_NAME=$(hostname)
OS_NAME=$(lsb_release -ds)
TIMEZONE=$(timedatectl show --property=Timezone --value)
FOLLOW_ME="${WHITE}https://thejb.onrender.com${RESET}"


banner="\n
$(use_style $WHITE ====================================) \n
USER: $(use_style $WHITE $USER_NAME) | MACHINE NAME: $(use_style $WHITE $HOST_NAME) \n
OS: $(use_style $WHITE "$OS_NAME") \n
TIME ZONE: $(use_style $WHITE "$TIMEZONE") \n
OS: $(use_style $WHITE "$OS_NAME") \n
ABOUT ME: $(use_style "$FOLLOW_ME") \n
$(use_style $WHITE ====================================) \n"

render_banner() {
    echo -e $banner
}
