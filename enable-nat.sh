#!/bin/bash
# Program Name: enable-nat.sh
# Description : The script will enable NAT on Ubuntu 18.04 Host System
# Usage       : ./enable-nat.sh
# Author      : acd
# Ref.        : The ff commands were provided by Andrey of Canonical
# Revision    : v1.0
# Build Date  : 7/23/2019

sudo apt update
sudo apt upgrade -y

echo "Showing all the network devices discovered in the system ..."
ip a s

printf "\n"
printf "\n"
echo "***********************************************"

echo "Enter external interface [ex. eno]: "; read EXT
echo "Enter internal interface [ex. br1]: "; read INT

echo "***********************************************"

iptables -t nat -A POSTROUTING -o $EXT -j MASQUERADE
iptables -A FORWARD -i $EXT -o $INT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $EXT -o $INT -j ACCEPT

echo "NAT enablement is now complete, thank you !!!"
exit
