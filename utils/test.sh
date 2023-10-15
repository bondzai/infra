#!/bin/bash

# Source the yaml_parser.sh
source ./yaml_parser.sh

# Execute the function
value=$(extract_nested_value sample.yaml user name)
echo "$value"
