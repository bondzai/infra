#!/bin/bash

read -p "Enter the repository URL: " repo_url

username="your-username"
password="your-password"

if [ -n "$username" ]; then
    clone_command="git clone https://$username:$password@${repo_url#https://}"
else
    clone_command="git clone $repo_url"
fi

$clone_command
