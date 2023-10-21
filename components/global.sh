#!/bin/bash

source "$(dirname $0)/components/styles.sh"

USER_NAME=$(whoami)
HOST_NAME=$(hostname)
OS_NAME=$(lsb_release -ds)
TIMEZONE=$(timedatectl show --property=Timezone --value)
FOLLOW_ME="${CYAN}https://thejb.onrender.com"

banner="\n
${WHITE}=== Linux Infrastructure Toolbox === \n

USER: $USER_NAME | MACHINE: $HOST_NAME \n
OS: $OS_NAME \n
TIME ZONE: $TIMEZONE \n
ABOUT ME: $FOLLOW_ME \n

${WHITE}==================================== \n
${CYAN}"

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
