# Instal OpenSSH
sudo apt-get install -y openssh-server

# Instal Dropbear
sudo apt-get install -y dropbear

# Instal OpenVPN
sudo apt-get install -y openvpn
# Mengizinkan port OpenSSH
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Mengizinkan port Dropbear
sudo ufw allow 109/tcp
sudo ufw allow 143/tcp

# Mengizinkan port OpenVPN
sudo ufw allow 1194/tcp
sudo ufw allow 2200/udp

# Menyederhanakan izin untuk semua port yang diinginkan
sudo ufw allow 443/tcp
sudo ufw allow 80/tcp
# Set up the CA directory
make-cadir ~/openvpn-ca
cd ~/openvpn-ca

# Customize the variables (edit 'vars' file)
nano vars

# Source the variables and build the certificate authority
source vars
./clean-all
./build-ca

# Build the server certificate
./build-key-server server

# Generate Diffie-Hellman keys
./build-dh

# Generate HMAC key for TLS authentication
openvpn --genkey --secret keys/ta.key

# Copy the necessary files to the OpenVPN directory
sudo cp keys/ca.crt keys/server.crt keys/server.key keys/ta.key keys/dh2048.pem /etc/openvpn

# Configure the OpenVPN server
sudo nano /etc/openvpn/server.conf
# Enable IP forwarding
sudo nano /etc/sysctl.conf
# Uncomment the following line:
# net.ipv4.ip_forward=1

# Apply the new setting
sudo sysctl -p
# Start and enable OpenVPN
sudo systemctl start openvpn@server
sudo systemctl enable openvpn@server

# Start Dropbear
sudo systemctl start dropbear
sudo systemctl enable dropbear
