#!/bin/bash

echo "." > readme.md
echo "├── .gitignore" >> readme.md

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
      echo "${prefix}├── $name" >> readme.md
      scan_folder "$item" "$prefix│   "
    elif [ -f "$item" ]; then
      echo "${prefix}├── $name" >> readme.md
    fi
  done
}

# Scan the current folder recursively
scan_folder "." "│   "

echo "Readme created successfully."
