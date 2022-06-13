#/bin/bash
# from minimal install
## RUN AS ROOT

echo "Welcome to the best nextcloud setup ever!"
echo "Sit back and enjoy the show :)"

apt update && apt full-upgrade -y

#install useful stuff
apt install snapd ufw nano bash-completion docker.io -y

#set up livepatch
apt install ubuntu-advantage-tools -y
ua attach <TOKEN>

#passwordless sudo
echo '<USER> ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

#set up docker
systemctl enable --now docker
usermod -aG docker <USER>

#set up firewall
ufw allow ssh
ufw allow https
ufw enable

#configure container
mkdir -p /cont/ncconf /cont/ncdata
chown -R <USER>:<USER> /cont
runuser -l  <USER> -c 'docker run -d \
  --name=nextcloud \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Berlin \
  -p 443:443 \
  -v /cont/ncconf:/config \
  -v /cont/ncdata:/data \
  --restart unless-stopped \
  lscr.io/linuxserver/nextcloud:latest'

ip a
echo "You can now access your nextcloud instance ^^"
