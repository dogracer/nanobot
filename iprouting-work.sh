#!/bin/bash

# iptables saved via netfilter-persistent service and applied on reboot
# setup the NAT access
# sudo iptables -t nat -A POSTROUTING -o ens18 -j MASQUERADE
# set up the iptable rules to protect the intranet, but allow access to ai-gpu
# sudo iptables -I DOCKER-USER -s 10.99.99.0/24 -d 192.168.0.0/16 -j REJECT
# sudo iptables -I DOCKER-USER -s 10.99.99.0/24 -d 10.0.0.0/8 -j REJECT
# sudo iptables -I DOCKER-USER -s 10.99.99.0/24 -d 172.16.0.0/12 -j REJECT
# sudo iptables -I DOCKER-USER 1 -s 10.99.99.0/24 -d 192.168.86.39 -j ACCEPT

# these commands need to be done manually to set up the shim to expose public internet
sudo ip link add nanobot-shim link ens19 type macvlan mode bridge
sudo ip addr add 10.99.99.100/24 dev nanobot-shim
sudo ip link set nanobot-shim up

# not needed: always errors?
# sudo ip route add 10.99.99.0/24 dev nanobot-shim
