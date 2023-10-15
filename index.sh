#!/bin/bash
clear

# Get user information
USER_NAME=$(whoami)
HOST_NAME=$(hostname)
OS_NAME=$(lsb_release -ds)
TIMEZONE=$(timedatectl show --property=Timezone --value)
FOLLOW_US="FOLLOW US ON FACEBOOK: FB.COM/YOURPAGE OR YOUTUBE.COM/YOURCHANNEL"

# Display the banner
echo "==============================================================================="
echo "  USER: $USER_NAME | COMPUTERNAME: $HOST_NAME | NETFX4: ENABLE | TPM: NONE  | MD5: ENABLE"
echo "  CURRENT OS:  $OS_NAME"
echo "  TIME ZONE: $TIMEZONE"
echo "  $FOLLOW_US"
echo "==============================================================================="

# Your menu options can be placed here as before.
# ...

# Highly recommended to install
# ...

echo "==============================================================================="
