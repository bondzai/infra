#!/bin/sh
sudo systemctl start xrdp
sudo systemctl enable xrdp
sudo systemctl status xrdp

sudo adduser xrdp ssl-cert

# allow firewall status