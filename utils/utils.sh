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
    pprint -p "Installing $1 ..."
    command -v $1 &> /dev/null && {
        pprint -p "$1 already installed."
        return 0
    }
    pprint -w "$1 not found. Installing $1..."
    sudo apt-get update && sudo apt-get install $1 -y
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

load_configs() {
    local input_yaml_file=$1
    local -n result_dict=$2

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

validate_is_number() {
    local input=$1
    if ! [[ "$input" =~ ^[0-9]+$ ]]; then
        pprint -e "choice index is not numeric. Select a valid choice."
        pprint -i " Press ENTER to continue..."
        read _
        return 1
    fi
}

validate_is_exists() {
    local input=$1
    if [[ "$input" == "false" ]]; then
        pprint -e "choice index not found in the list. Select a valid choice."
        pprint -i " Press ENTER to continue..."
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
        prefix="${RED} Error:"
        ;;

    -w)
        prefix="${Yellow} Warning:"
        ;;

    -s)
        prefix="${GREEN} Process:"
        ;;

    -i)
        prefix="${DEFAULT} Info:"
        ;;

    -p | -f)
        prefix="${CYAN} Process:"
        ;;

    *)
        prefix="${DEFAULT} "
        ;;
    esac

    sleep 0.25
    echo -e "$prefix $message \n $DEFAULT"
}
