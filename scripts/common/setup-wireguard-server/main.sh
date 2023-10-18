#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Update and install WireGuard
apt update
apt install -y wireguard

# Generate server keys
umask 077
wg genkey | tee /etc/wireguard/privatekey | wg pubkey > /etc/wireguard/publickey

# Create WireGuard configuration file
cat <<EOL > /etc/wireguard/wg0.conf
[Interface]
Address = 10.0.0.1/24
SaveConfig = true
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
ListenPort = 51820
PrivateKey = $(cat /etc/wireguard/privatekey)

[Peer]
PublicKey = <Client_Public_Key>
AllowedIPs = 10.0.0.2/32
EOL

# Start WireGuard
systemctl enable wg-quick@wg0
systemctl start wg-quick@wg0

# Display server public key
echo "Server Public Key:"
cat /etc/wireguard/publickey

echo "WireGuard server setup complete."
