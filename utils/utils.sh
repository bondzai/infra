#!/bin/bash

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
    package_version=$(packge --version)
    if [ $? -eq 0 ]; then
        echo
        echo -e ${GREEN}"$package installed successfully. Version: $packge_version"
        echo
    fi
}

load_config() {
    local config_file="$1"
    local -n config_dict="$2"

    declare -gA config_dict

    while IFS="=" read -r key value; do
        value="${value%\"}"
        value="${value#\"}"
        config_dict[$key]=$value
    done < "$config_file"
}

# yaml parser
extract_yaml_simple_value() {
    local file="$1"
    local key="$2"
    awk -F: "/^$key:/ {print \$2}" "$file" | tr -d ' '
}

# yaml parser
extract_yaml_nested_value() {
    local file="$1"
    local parent="$2"
    local key="$3"
    awk -v parent="$parent" -v key="$key" '$1 == parent":" {flag=1; next} flag && $1 == key":" {print $2; next} $1 !~ /^  / {flag=0}' "$file" | tr -d ' '
}

extract_dict_from_yaml() {
    local input_yaml_file=$1
    local -n result_dict=$2

    while IFS=": " read -r yaml_key yaml_value
    do
        result_dict["$yaml_key"]="$yaml_value"
    done < "$input_yaml_file"
}

declare -A yaml_contents

extract_dict_from_yaml "input.yaml" yaml_contents

echo "${yaml_contents[@]}"
echo "${!yaml_contents[@]}"
echo "${yaml_contents[index]}"
echo "${yaml_contents[-1]}"