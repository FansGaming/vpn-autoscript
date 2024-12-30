#!/bin/bash

# Update system package list
sudo apt-get update

# Install necessary packages
sudo apt-get install -y openssh-server dropbear openvpn easy-rsa nodejs npm python3-pip screen curl wget

# Install gdown
pip install gdown

# Disable IPv6
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1

# Configure firewall
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 109/tcp
sudo ufw allow 143/tcp
sudo ufw allow 1194/tcp
sudo ufw allow 2200/udp
sudo ufw enable

# OpenSSH configuration
sudo systemctl start ssh
sudo systemctl enable ssh

# Dropbear configuration
sudo systemctl start dropbear
sudo systemctl enable dropbear

# OpenVPN configuration
make-cadir ~/openvpn-ca
cd ~/openvpn-ca
source vars
./clean-all
./build-ca
./build-key-server server
./build-dh
openvpn --genkey --secret keys/ta.key
sudo cp keys/ca.crt keys/server.crt keys/server.key keys/ta.key keys/dh2048.pem /etc/openvpn
sudo nano /etc/openvpn/server.conf
sudo systemctl start openvpn@server
sudo systemctl enable openvpn@server

# Enable IP forwarding
sudo nano /etc/sysctl.conf
# Uncomment the following line:
# net.ipv4.ip_forward=1
sudo sysctl -p

# Install XRAY
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)"
sudo nano /usr/local/etc/xray/config.json
sudo systemctl start xray
sudo systemctl enable xray

# Install Trojan
bash -c "$(curl -L https://github.com/trojan-gfw/trojan/releases/latest/download/trojan-linux-amd64.tar.xz)"
tar -xJf trojan-linux-amd64.tar.xz
sudo mv trojan /usr/local/bin/
sudo mv example/trojan.service /etc/systemd/system/
sudo nano /usr/local/etc/trojan/config.json
sudo systemctl start trojan
sudo systemctl enable trojan

# Install Shadowsocks
sudo apt-get install -y shadowsocks-libev
sudo nano /etc/shadowsocks-libev/config.json
sudo systemctl start shadowsocks-libev
sudo systemctl enable shadowsocks-libev

# Install WebSocket server
mkdir ~/ws_server
cd ~/ws_server
npm init -y
npm install ws
cat << EOF > server.js
const WebSocket = require('ws');
const wss = new WebSocket.Server({ port: 8080 });

wss.on('connection', (ws) => {
  console.log('Client connected');
  ws.on('message', (message) => {
    console.log('Received:', message);
    ws.send('Hello, you sent -> ' + message);
  });
  ws.send('Hi there, I am a WebSocket server');
});

console.log('WebSocket server is running on ws://localhost:8080');
EOF
node server.js &

echo "Installation and configuration of services completed."
