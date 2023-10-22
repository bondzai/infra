#!/bin/bash

exec_check_installed_packages() {
    dpkg --get-selections | grep -v deinstall | cut -f1
}

exec_update() {
    sudo apt update && sudo apt upgrade -y
    pprint -s "System is up to date!"
}

exec_cleanup() {
    trash-empty
    pprint -s "Trash empty!"
}

exec_check_network_status() {
    local host="www.google.com"
    local speedtest_command="speedtest-cli"

    if ping -c 3 "$host" &> /dev/null; then
        pprint -s "Network status: Online"

        if command -v "$speedtest_command" &> /dev/null; then
            echo "Checking network speed$LANUCH"
            $speedtest_command
            echo
        else
            pprint -w "Speedtest-cli is not installed. You can install it for speed testing."
        fi
    else
        pprint -e "Network status: Offline"
    fi
}

exec_check_external_ip() {
    external_iface=$(ip route | awk '/default/ {print $5}')
    external_ip=$(ip addr show dev $external_iface | awk '/inet / {print $2}' | cut -d'/' -f1)
    echo "External IP address on interface $external_iface: $external_ip"
}

exec_view_external_network_info() {
    external_iface=$(ip route | awk '/default/ {print $5}')
    external_ip=$(ip addr show dev $external_iface | awk '/inet / {print $2}' | cut -d'/' -f1)
    subnet_mask=$(ip addr show dev $external_iface | awk '/inet / {print $2}' | cut -d'/' -f2)
    mac_address=$(ip link show dev $external_iface | awk '/link\/ether/ {print $2}')
    gateway=$(ip route | awk '/default/ {print $3}')
    dns_servers=$(nmcli dev show $external_iface | awk '/IP4.DNS/ {print $2}')

    echo "External Interface: $external_iface"
    echo "External IP Address: $external_ip"
    echo "Subnet Mask: $subnet_mask"
    echo "MAC Address: $mac_address"
    echo "Gateway: $gateway"
    echo "DNS Servers: $dns_servers"
}
