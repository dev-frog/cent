#!/usr/bin/bash

echo "[*] IP static Mode"
sudo hostnamectl set-hostname lab.com

nmcli connection modify enp0s3 ipv4.addresses 192.168.0.240/24 gw4 192.168.0.1
nmcli connection modify enp0s3 ipv4.dns 1.1.1.1
nmcli connection modify enp0s3 ipv4.method manual
nmcli connection down enp0s3; nmcli connection up enp0s3


echo "[*] Start Firewall"
sudo systemctl start firewalld
sudo systemctl enable firewalld



echo "[*] Add cent/cent user"

sudo adduser cent 
echo "cent" | passwd --stdin cent