#!/bin/bash

typewriter_effect() {
    local text="$1"
    local delay="$2"

    for ((i = 0; i < ${#text}; i++)); do
        printf '%s' "${text:$i:1}"
        sleep "$delay"
    done
    printf '\n'
}

input=$(cat prompt.txt | tr -d '\n')
output=$(tgpt "$input")

typewriter_effect "$output" 0.03
