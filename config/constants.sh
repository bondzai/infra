#!/bin/bash

declare -A REGEX_DICT

# Store the awk logic for extracting key=value format from YAML in the dictionary
REGEX_DICT[": "]="awk -F': ' '{if (NF==2) print \$1 \"=\" \$2}'"

# Other Constants
EXIT_CHOICE=99
