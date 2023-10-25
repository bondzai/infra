#!/bin/bash

handle_error() {
    local err=$?
    pprint -e "Error occurred in function ${FUNCNAME[1]} at line ${BASH_LINENO[0]} with exit code $err."
    exit $err
}

load_configs() {
    local input_yaml_file=$1
    local result_dict_name=$2

    if ! (declare -p $result_dict_name &>/dev/null); then
        declare -gA $result_dict_name
    fi

    local -n result_dict=$result_dict_name

    if [[ -n "${REGEX_DICT[": "]}" ]]; then
        while IFS="=" read -r yaml_key yaml_value
        do
            result_dict["$yaml_key"]="$yaml_value"
        done < <(eval "${REGEX_DICT[": "]}" "$input_yaml_file")
    else
        pprint -e "Format not found"
        return 1
    fi
}

shutdown_service() {
    pprint -i "Keep calm & farming..."
    exit 0
}

setup_deps() {
    pprint -p "Installing $1 ..."
    command -v $1 &> /dev/null && {
        pprint -p "$1 already installed."
        return 0
    }
    pprint -w "$1 not found. Installing $1..."
    sudo apt-get update && sudo apt-get install $1 -y
}

get_os_id() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "$ID"
    else
        echo "unknown"
    fi
}
get_os_detail() {
    OS_ID=$(get_os_id)
    if [ "$OS_ID" != "unknown" ]; then
        . /etc/os-release
        echo "Detected OS: $NAME"
        echo "Version: $VERSION"
    else
        echo "Unable to detect OS"
    fi
}

detect_os() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "Detected OS: $NAME"
        echo "Version: $VERSION"
    elif [ -f /etc/arch-release ]; then
        echo "Detected OS: Arch Linux"
    elif [ -f /etc/redhat-release ]; then
        echo "Detected OS: $(cat /etc/redhat-release)"
    elif [ -f /etc/debian_version ]; then
        echo "Detected OS: Debian $(cat /etc/debian_version)"
    elif [ -f /etc/fedora-release ]; then
        echo "Detected OS: Fedora"
    elif [ -f /etc/SuSE-release ]; then
        echo "Detected OS: SuSE"
    elif [ -f /etc/centos-release ]; then
        echo "Detected OS: CentOS"
    elif [ -f /etc/gentoo-release ]; then
        echo "Detected OS: Gentoo"
    elif [ -f /etc/slackware-version ]; then
        echo "Detected OS: Slackware"
    else
        echo "Unable to detect OS"
    fi
}

check_version() {
    local cmd_version_flag="--version"

    case $package in
        some_package_name) cmd_version_flag="-v";;
        another_package_name) cmd_version_flag="version";;
    esac

    package_version=$($package $cmd_version_flag 2>&1)

    if [ $? -eq 0 ]; then
        pprint -s "$package installed successfully. Version: $package_version"
    else
        pprint -e "Error checking version for $package using $cmd_version_flag"
    fi
}

extract_digits() {
    local str="$1"
    echo "$str" | grep -o -E '[0-9]+' | tr -d '\n'
}

extract_key_digits() {
    local str="$1"
    echo "$str" | grep -o -E '[0-9]+' | head -1
}

exclude_digits() {
    local str="$1"
    echo "$str" | sed 's/[0-9]//g'
}

exclude_key_digits() {
    local str="$1"
    echo "$str" | sed 's/[0-9]\+//'
}

validate_is_number() {
    local input=$1
    if ! [[ "$input" =~ ^[0-9]+$ ]]; then
        pprint -e "Choice index is not numeric. Select a valid choice."
        pprint -i "Press ENTER to continue..."
        read _
        return 1
    fi
}

validate_is_exists() {
    local input=$1
    if [[ "$input" == "false" ]]; then
        pprint -e "Choice index not found in the list. Select a valid choice."
        pprint -i "Press ENTER to continue..."
        read _
        return 1
    fi
}

pprint() {
    local type=$1
    local message=$2
    local prefix=""
    local suffix=""

    case $type in
    -e)
        prefix="${RED}Error:"
        ;;

    -w)
        prefix="${Yellow}Warning:"
        ;;

    -s)
        prefix="${GREEN}"
        ;;

    -i)
        prefix="${DEFAULT}"
        ;;

    -p | -f)
        prefix="${CYAN}"
        ;;

    *)
        prefix="${DEFAULT}"
        ;;
    esac

    sleep 0.25
    echo -e "$prefix $message \n $DEFAULT"
}
