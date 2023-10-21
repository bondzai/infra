#!/bin/bash

source "$(dirname $0)/components/styles.sh"

USER_NAME=$(whoami)
HOST_NAME=$(hostname)
OS_NAME=$(lsb_release -ds)
TIMEZONE=$(timedatectl show --property=Timezone --value)
FOLLOW_ME="${CYAN}https://thejb.onrender.com"

banner="\n
${RED}=== Linux Infrastructure Toolbox === \n
${RED}USER: ${DEFAULT}$USER_NAME \n
${RED}MACHINE: ${DEFAULT}$HOST_NAME \n
${RED}OS: ${DEFAULT}$OS_NAME \n
${RED}TIME ZONE: ${DEFAULT}$TIMEZONE \n
${RED}ABOUT ME: ${DEFAULT}$FOLLOW_ME \n

${RED}==================================== \n
"

render_banner() {
    echo -e $banner
}

render_falldown() {
    sleep 0.5
    echo
    echo -e $WHITE" Keep calm & farming..."
    echo
    exit
}
