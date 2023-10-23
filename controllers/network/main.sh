#1/bin/bash

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

exec_view_external_network_info() {
    local external_iface=$(ip route | awk '/default/ {print $5}')
    local external_ip=$(ip addr show dev $external_iface | awk '/inet / {print $2}' | cut -d'/' -f1)
    local subnet_mask=$(ip addr show dev $external_iface | awk '/inet / {print $2}' | cut -d'/' -f2)
    local mac_address=$(ip link show dev $external_iface | awk '/link\/ether/ {print $2}')
    local gateway=$(ip route | awk '/default/ {print $3}')
    local dns_servers=$(nmcli dev show $external_iface | awk '/IP4.DNS/ {print $2}')

    echo " External Interface: $external_iface"
    echo " External IP Address: $external_ip"
    echo " Subnet Mask: $subnet_mask"
    echo " MAC Address: $mac_address"
    echo " Gateway: $gateway"
    echo " DNS Servers: $dns_servers"
    echo
}
