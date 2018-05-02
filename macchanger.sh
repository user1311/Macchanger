#!/bin/bash

if [ "$1" == "wlan0" ];
then
ifconfig wlan0 down
service networking stop
service network-manager stop
echo "[*]Services stoped..."

echo "[*] Macchanger initialized..."

macchanger -r wlan0
echo "Bringing up interface and services"

service networking start
service network-manager start
ifconfig wlan0 up
elif [ "$1" == "eth0" ];
then
echo "[*] Macchanger initialized... "
macchanger -a eth0
ifconfig eth0 down
sleep 3 
ifconfig eth0 up

else
echo "Usage: ./macchanger eth0/wlan0"
fi
