#!/bin/bash

# Function to generate the configuration file with defaults if it doesn't exist
generate_config() {
    local config_file=".prettierrc.yaml"

    if [ -f "$config_file" ]; then
        echo "Configuration file already exists."
    else
        echo "Creating configuration file with default values..."
        cat <<EOF >"$config_file"
indent: 2
rules:
  - extensions: [yaml, yml]
    tabWidth: 2
    singleQuote: true
    trailingComma: all
  # Add more extension-specific rules as needed
EOF

        echo "Configuration file ($config_file) created with default settings."
    fi
}

# Function to format a single file
format_file() {
    local tabWidth="$1"
    local singleQuote="$2"
    local trailingComma="$3"
    local file="$4"

    echo "Formatting $file..."
    prettier --write --tab-width "$tabWidth" --single-quote "$singleQuote" --trailing-comma "$trailingComma" "$file"
}

# Function to apply formatting rules
apply_formatting_rules() {
    local config_file="$1"
    local extension="$2"

    while IFS= read -r rule; do
        local extensions=$(yq eval '.extensions[]' <<<"$rule")
        local tabWidth=$(yq eval '.tabWidth' <<<"$rule")
        local singleQuote=$(yq eval '.singleQuote' <<<"$rule")
        local trailingComma=$(yq eval '.trailingComma' <<<"$rule")

        for ext in ${extensions[@]}; do
            if [ "$ext" == "$extension" ]; then
                format_file "$tabWidth" "$singleQuote" "$trailingComma" "$file"
                return
            fi
        done
    done <<<"$rules"
}

# Function to format files based on the configuration
format_files() {
    local config_file=".prettierrc.yaml"

    if [ -f "$config_file" ]; then
        local rules=$(yq eval '.rules[]' "$config_file")

        find . -type f | while read -r file; do
            file_extension="${file##*.}"
            apply_formatting_rules "$config_file" "$file_extension"
        done
    else
        echo "No .prettierrc.yaml file found. Using default configuration."
    fi
}

# Main function
main() {
    generate_config
    format_files
}

# Run the main function
main
