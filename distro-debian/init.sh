#!/bin/sh

sudo apt update -y && sudo apt upgrade -y
eval "$(ssh-agent -s)"