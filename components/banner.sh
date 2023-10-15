#!/bin/bash

USER_NAME=$(whoami)
HOST_NAME=$(hostname)
OS_NAME=$(lsb_release -ds)
TIMEZONE=$(timedatectl show --property=Timezone --value)
FOLLOW_ME="https://thejb.onrender.com"

render() {
    echo "==============================================================================="
    echo "  USER: $USER_NAME | COMPUTERNAME: $HOST_NAME"
    echo "  CURRENT OS:  $OS_NAME"
    echo "  TIME ZONE: $TIMEZONE"
    echo "  $FOLLOW_ME"
    echo "==============================================================================="
}
