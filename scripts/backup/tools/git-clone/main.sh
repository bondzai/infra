#!/bin/bash
source .env

read -p "Enter the repository name: " repo_name

clone_command="git clone https://$USERNAME:$PAT@github.com/swift-dynamics/$repo_name.git"

$clone_command