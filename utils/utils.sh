#!/bin/bash

source_scripts() {
    local target_dir="$1"
    local script_name="$2"

    # Check if the script exists in the target directory before attempting to source it.
    if [[ -f "$target_dir/$script_name" ]]; then
        pushd "$target_dir" > /dev/null
        source "./$script_name"
        popd > /dev/null
    else
        echo "Error: Script $script_name not found in directory $target_dir."
    fi
}
