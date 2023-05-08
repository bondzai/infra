#!/bin/bash

# Find the ZeroTier interface name
interface=$(ip addr show | awk '/^4:/ {print $2}' | sed 's/.$//')

# Create the ZeroTier DNS configuration file
sudo tee /etc/systemd/network/90-zerotier-dns.network > /dev/null << EOT
[Match]
Name=${interface}

[Network]
DNS=1.1.1.1
EOT

# Restart the systemd-networkd service to apply the new configuration
sudo systemctl restart systemd-networkd

# Print the current DNS configuration to verify the change
sudo resolvectl status
