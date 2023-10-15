#!/bin/sh

echo " ===== start install app ===== "

packages=("curl" "wget")

for package in "${packages[@]}"; do
    setup_deps "$package"
done
