#!/bin/bash

sudo apt update && sudo apt install git 
git submodule update --init --recursive
git submodule update --recursive --remote
