#!/bin/bash

input=$(cat prompt.txt | tr -d '\n')
output=$(tgpt "$input")

echo "$output"
