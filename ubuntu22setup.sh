#!/bin/bash
# from minimal install
## RUN AS ROOT
apt update && apt full-upgrade -y

#install useful stuff
apt install snapd psmisc neofetch htop ufw nano bash-completion docker.io -y

#set up livepatch
apt install ubuntu-advantage-tools
ua attach <TOKEN>

#passwordless sudo
echo 'motch ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

#set up docker
systemctl enable --now docker
usermod -aG docker <USER>

#set up ssh
ssh-keygen
ufw allow ssh

#free port 53 for pihole
systemctl disable systemd-resolved
echo 'nameserver 8.8.8.8' >> /etc/resolv.conf
cat /etc/resolv.conf > /etc/resolve.temp
rm /etc/resolv.conf
mv /etc/resolve.temp /etc/resolv.conf

#upload ssh-key of management machine
#set password authentification to no in /etc/ssh/sshd_config
