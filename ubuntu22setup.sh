#!/bin/bash
# from minimal install
## RUN AS ROOT
apt update && apt full-upgrade -y
apt install snapd psmisc neofetch htop ufw nano bash-completion docker.io -y
apt install ubuntu-advantage-tools
ua attach <TOKEN>
echo 'motch ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
systemctl enable --now docker
usermod -aG docker <USER>
ssh-keygen
ufw allow ssh
systemctl disable systemd-resolved
echo 'nameserver 8.8.8.8' >> /etc/resolv.conf
cat /etc/resolv.conf > /etc/resolve.temp
rm /etc/resolv.conf
mv /etc/resolve.temp /etc/resolv.conf
#upload ssh-key of management machine
#set password authentification to no in /etc/ssh/sshd_config
