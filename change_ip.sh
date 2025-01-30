#!/bin/bash

# Set the new IP address
NEW_IP="192.168.1.1"
INTERFACE="lan"  # The interface to change (usually 'lan' or 'wan')

# Check if the current IP is 192.168.1.1
CURRENT_IP=$(uci get network.$INTERFACE.ipaddr)

if [ "$CURRENT_IP" != "$NEW_IP" ]; then
    # Change the IP address in UCI
    uci set network.$INTERFACE.ipaddr="$NEW_IP"
    uci commit network
    
    # Apply the changes by restarting the network
    /etc/init.d/network restart
    
    echo "IP address changed to $NEW_IP"
else
    echo "IP address is already set to $NEW_IP"
fi
