#!/bin/bash

# File structure constants: directories
BASE_DIR="$(dirname $0)/.."
CONFIG_DIR="${BASE_DIR}/configs"
COMPONENTS_DIR="${BASE_DIR}/components"
CONTROLLERS_DIR="${BASE_DIR}/controllers"
UTILS_DIR="${BASE_DIR}/utils"

# File structure constants: files
declare -A SOURCES
SOURCES[${UTILS_DIR}]="constants.sh utils.sh"
SOURCES[${COMPONENTS_DIR}]="global.sh"
SOURCES[${CONTROLLERS_DIR}/]="main.sh"
SOURCES[${CONTROLLERS_DIR}/system]="main.sh"
SOURCES[${CONTROLLERS_DIR}/network]="main.sh"
SOURCES[${CONTROLLERS_DIR}/installer]="main.sh"

# 3rd party configuration contansts
declare -A CONFIGS
CONFIGS["${CONFIG_DIR}/main.yaml"]="MAIN_MENU"
CONFIGS["${CONFIG_DIR}/system.yaml"]="SYSTEM_MENU"
CONFIGS["${CONFIG_DIR}/network.yaml"]="NETWORK_MENU"
CONFIGS["${CONFIG_DIR}/installer.yaml"]="INSTALLER_MENU"

# Regular expression constants
declare -A REGEX_DICT
REGEX_DICT[": "]="awk -F': ' '{if (NF==2) print \$1 \"=\" \$2}'"

# Styles constants
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
LANUCH="...🚀"

# Banner constants
USER_NAME=$(whoami)
HOST_NAME=$(hostname)
OS_NAME=$(lsb_release -ds)
TIMEZONE=$(timedatectl show --property=Timezone --value)
FOLLOW_ME="${CYAN}https://thejb.onrender.com"

BANNER="\n
${MAGENTA}=== ${RED}Linux Infrastructure Toolbox ${MAGENTA}=== \n
${MAGENTA}USER: ${DEFAULT}$USER_NAME \n
${MAGENTA}MACHINE: ${DEFAULT}$HOST_NAME \n
${MAGENTA}OS: ${DEFAULT}$OS_NAME \n
${MAGENTA}TIME ZONE: ${DEFAULT}$TIMEZONE \n
${MAGENTA}ABOUT ME: ${DEFAULT}$FOLLOW_ME \n
${MAGENTA}==================================== 
\n"

# Other Constants
EXIT_CHOICE=99
