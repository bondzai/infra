#!/bin/bash

# Function to check if a target should be ignored
should_ignore_target() {
  local target="$1"
  for ignore_target in "${ignore_targets[@]}"; do
    if [[ "$target" =~ ^"$ignore_target" ]]; then
      return 0
    fi
  done
  return 1
}

# Function to scan sub-folders recursively
scan_folder() {
  local folder="$1"
  local prefix="$2"
  local result=""

  for item in "$folder"/*; do
    local name=$(basename "$item")

    if [ -d "$item" ] && ! should_ignore_target "$item"; then
      result+="\n${prefix}├── $name"
      result+=$(scan_folder "$item" "$prefix│   ")
    elif [ -f "$item" ] && ! should_ignore_target "$item"; then
      result+="\n${prefix}├── $name"
    fi
  done

  echo "$result"
}

# Main script
ignore_targets=()
structure_content=$(scan_folder "." ".")
echo -e "$structure_content" >structure.md

folder_name=$(basename "$(pwd)")
readme_content="Write readme.md file with simple and meaningful content for the project $folder_name. $(cat structure.md | tr -d '\n')"

tgpt_output=$(tgpt "$readme_content")
echo "$tgpt_output" >readme.md
