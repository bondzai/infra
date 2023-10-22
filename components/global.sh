#!/bin/bash

render_banner() {
    echo -e $BANNER
}

render_menu() {
    declare -n current_menu=$menu

    clear
    render_banner

    keys=("${!current_menu[@]}")
    IFS=$'\n' sorted_keys=($(sort -n <<< "${keys[*]}"))

    for key in "${sorted_keys[@]}"; do
        index=$(extract_key_digits "$key")
        desc=$(exclude_key_digits "$key")

        if [[ $index == 0 ]]; then
            echo -e "$CYAN$desc:"
            echo -e "$CYAN ------------------------------------"
        elif [[ $index -ne EXIT_CHOICE ]]; then
            echo -e " $CYAN[$index]  | ${DEFAULT}$desc"
        else
            echo -e " $CYAN[$index] | ${DEFAULT}$desc"
        fi
    done
}

read_choice() {
    local prompt_message=${CYAN}" Enter your choice: "${DEFAULT}
    
    echo -e "$CYAN ------------------------------------"
    echo -n -e $prompt_message
    read choice
    echo -e $DEFAULT
}
