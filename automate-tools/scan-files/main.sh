#!/bin/bash

echo "." > readme.md
echo "├── .gitignore" >> readme.md

# Read the targets to ignore into an array
mapfile -t targets < .scanignore

# Function to check if a target should be ignored
should_ignore() {
  local target="$1"
  for ignore_target in "${targets[@]}"; do
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

  # Iterate through files and folders in the current directory
  for item in "$folder"/*; do
    # Extract the item name
    local name=$(basename "$item")

    # Check if the item is a directory
    if [ -d "$item" ]; then
      if should_ignore "$item"; then
        continue
      fi
      echo "${prefix}├── $name" >> readme.md
      scan_folder "$item" "$prefix│   "
    elif [ -f "$item" ]; then
      if should_ignore "$item"; then
        continue
      fi
      echo "${prefix}├── $name" >> readme.md
    fi
  done
}

# Scan the current folder recursively
scan_folder "." "│   "

echo "Readme created successfully."
