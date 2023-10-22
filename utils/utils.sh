#!/bin/bash

handle_error() {
    local err=$?
    echo "Error occurred in function ${FUNCNAME[1]} at line ${BASH_LINENO[0]} with exit code $err."
    exit $err
}

trap handle_error ERR

shutdown_service() {
    pprint -i "Keep calm & farming..."
    exit 0
}

setup_deps() {
    echo
    echo -e ${GREEN}"Installing $1 ..."${WHITE}
    command -v $1 &> /dev/null && {
        echo
        echo -e ${CYAN}"$1 already installed."${WHITE}
        echo
        return 0
    }
    echo
    echo -e ${GREEN}"$1 not found. Installing $1..."${WHITE}
    echo
    sudo apt-get update
    sudo apt-get install $1 -y
}

check_os() {
    echo -e "check distro..."
}

check_version() {
    local cmd_version_flag="--version"

    case $package in
        some_package_name) cmd_version_flag="-v";;
        another_package_name) cmd_version_flag="version";;
    esac

    package_version=$($package $cmd_version_flag 2>&1)

    if [ $? -eq 0 ]; then
        echo
        echo -e ${GREEN}"$package installed successfully. Version: $package_version"
        echo
    else
        echo -e ${RED}"Error checking version for $package using $cmd_version_flag"
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

load_configs() {
    local input_yaml_file=$1
    local -n result_dict=$2

    if [[ -n "${REGEX_DICT[": "]}" ]]; then
        while IFS="=" read -r yaml_key yaml_value
        do
            result_dict["$yaml_key"]="$yaml_value"
        done < <(eval "${REGEX_DICT[": "]}" "$input_yaml_file")
    else
        echo "Format not found"
        return 1
    fi
}

validate_is_number() {
    local input=$1
    if ! [[ "$input" =~ ^[0-9]+$ ]]; then
        pprint error "choice index is not numeric. Select a valid choice."
        echo " Press ENTER to continue..."
        read _
        return 1
    fi
}

validate_is_exists() {
    local input=$1
    if [[ "$input" == "false" ]]; then
        echo
        echo " Error: choice index not found in the list. Select a valid choice."
        echo
        echo " Press ENTER to continue..."
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
    -i)
        prefix="${DEFAULT} Info:"
        ;;

    -e)
        prefix="${RED} Error:"
        ;;

    -p | -f)
        prefix="${YELLOW} Process:"
        ;;

    -s)
        prefix="${GREEN} Process:"
        ;;

    *)
        prefix="${DEFAULT} "
        ;;
    esac

    sleep 0.25
    echo -e "$prefix $message \n $DEFAULT"
}
