# Unduh dan instal XRAY
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)"
# Buat konfigurasi XRAY
sudo nano /usr/local/etc/xray/config.json

# Contoh konfigurasi XRAY untuk Vmess
{
    "inbounds": [
        {
            "port": 443,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "YOUR_UUID",
                        "alterId": 0
                    }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "security": "tls",
                "tlsSettings": {
                    "certificates": [
                        {
                            "certificateFile": "/path/to/your/certificate.crt",
                            "keyFile": "/path/to/your/key.key"
                        }
                    ]
                }
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom",
            "settings": {}
        }
    ]
}
# Mulai dan aktifkan XRAY
sudo systemctl start xray
sudo systemctl enable xray
# Unduh dan instal Trojan
bash -c "$(curl -L https://github.com/trojan-gfw/trojan/releases/latest/download/trojan-linux-amd64.tar.xz)"
tar -xJf trojan-linux-amd64.tar.xz
sudo mv trojan /usr/local/bin/
sudo mv example/trojan.service /etc/systemd/system/
# Buat konfigurasi Trojan
sudo nano /usr/local/etc/trojan/config.json

# Contoh konfigurasi Trojan
{
    "run_type": "server",
    "local_addr": "0.0.0.0",
    "local_port": 443,
    "remote_addr": "127.0.0.1",
    "remote_port": 80,
    "password": [
        "your_password"
    ],
    "ssl": {
        "cert": "/path/to/your/certificate.crt",
        "key": "/path/to/your/key.key",
        "sni": "your_domain.com"
    }
}
# Mulai dan aktifkan Trojan
sudo systemctl start trojan
sudo systemctl enable trojan
# Instal Shadowsocks
sudo apt-get install -y shadowsocks-libev
# Buat konfigurasi Shadowsocks
sudo nano /etc/shadowsocks-libev/config.json

# Contoh konfigurasi Shadowsocks
{
    "server": "0.0.0.0",
    "server_port": 443,
    "local_port": 1080,
    "password": "your_password",
    "timeout": 300,
    "method": "aes-256-gcm"
}
# Mulai dan aktifkan Shadowsocks
sudo systemctl start shadowsocks-libev
sudo systemctl enable shadowsocks-libev
