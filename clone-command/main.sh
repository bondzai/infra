#!/bin/bash

read -p "Enter the repository name: " repo_name

username="username"

pat="token"

clone_command="git clone https://$username:$pat@github.com/swift-dynamics/$repo_name.git"

$clone_command
