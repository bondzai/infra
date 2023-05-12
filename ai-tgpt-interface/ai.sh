#!/bin/bash

string=$(cat prompt.txt)

output=$(tgpt "$string")

echo "$output"
