#!/bin/sh

sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved
npx kill-port 53