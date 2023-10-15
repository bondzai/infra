#!/bin/bash

# Set the current working directory as the root directory.
root_directory="$(pwd)"

# Set the path to the .prettierrc.json configuration file in the current directory.
prettier_config="$root_directory/.prettierrc.json"

# Check if the .prettierrc.json file exists; if not, create it.
if [ ! -f "$prettier_config" ]; then
    echo '{
        "tabWidth": 2,
        "singleQuote": true,
        "trailingComma": "all"
    }' > "$prettier_config"
fi

# Run Prettier to format both .yaml and .yml files in the current directory and its subdirectories.
find "$root_directory" -type f \( -name "*.yaml" -o -name "*.yml" \) -exec prettier --write --config "$prettier_config" {} \;

# Change file extensions from .yml to .yaml
find "$root_directory" -type f -name "*.yml" -exec rename 's/\.yml$/.yaml/' {} \;

# Add a newline character to the end of each file if it doesn't already have one.
find "$root_directory" -type f \( -name "*.yaml" -o -name "*.yml" \) -exec sh -c '[[ $(tail -c 1 "$0" | wc -c) -ne 1 ]] && echo >> "$0"' {} \;
