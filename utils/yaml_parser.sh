#!/bin/bash

extract_simple_value() {
    local file="$1"
    local key="$2"
    awk -F: "/^$key:/ {print \$2}" "$file" | tr -d ' '
}

extract_nested_value() {
    local file="$1"
    local parent="$2"
    local key="$3"
    awk -v parent="$parent" -v key="$key" '$1 == parent":" {flag=1; next} flag && $1 == key":" {print $2; next} $1 !~ /^  / {flag=0}' "$file" | tr -d ' '
}
