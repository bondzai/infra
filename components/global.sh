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

# render_menu() {
#     declare -n local_list=$1

#     # clear
#     render_banner

#     keys=("${!local_list[@]}")
#     IFS=$'\n' sorted_keys=($(sort -n <<< "${keys[*]}"))

#     for key in "${sorted_keys[@]}"; do
#         if [[ "$key" != "0" ]] && [[ "$key" != "99" ]]; then
#             local desc="${local_list[$key]%%:*}"
#             echo " [$key] | $desc"
#         fi
#     done

#     if [[ -n "${local_list[99]}" ]]; then
#         echo " ===================================="
#         local desc="${local_list[99]%%:*}"
#         echo " [99]| $desc"
#     fi

#     echo -e "${YELLOW}"
# }
