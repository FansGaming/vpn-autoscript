# Instal Langsung Tanpa Perlu Mendaftarkan IP VPS

# Baca Dahulu Sebelum Install

</p> 
<h2 align="center"> Supported Linux Distribution</h2>
<p align="center"><img src="https://d33wubrfki0l68.cloudfront.net/5911c43be3b1da526ed609e9c55783d9d0f6b066/9858b/assets/img/debian-ubuntu-hover.png"></p> 
<p align="center"><img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%209&message=Stretch&color=purple"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%2010&message=Buster&color=purple">  <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2018&message=Lts&color=red"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2020&message=Lts&color=red">
</p>

<p align="center"><img src="https://img.shields.io/badge/Service-SSH_Over_Websocket-success.svg"> <img src="https://img.shields.io/badge/Service-SSH_UDP_Custom-success.svg"> <img src="https://img.shields.io/badge/Service-SSH_Dropbear-success.svg">  <img src="https://img.shields.io/badge/Service-Stunnel4-success.svg">  <img src="https://img.shields.io/badge/Service-Fail2Ban-brightgreen">  
<p align="center"><img src="https://img.shields.io/badge/Service-XRAY_VLESS-success.svg">  <img src="https://img.shields.io/badge/Service-XRAY_VMESS-success.svg">  <img src="https://img.shields.io/badge/Service-XRAY_TROJAN-success.svg"> <img src= "https://img.shields.io/badge/Service-Websocket-success.svg"> <img src= "https://img.shields.io/badge/Service-GRPC-success.svg"> <img src= "https://img.shields.io/badge/Service-Shadowsocks-success.svg">  
<p <p align="center"><img src="https://img.shields.io/badge/Service-Webmin-success.svg"> <img src="https://img.shields.io/badge/Service-Helium-success.svg">
<p <p align="center"><img src="https://wangchujiang.com/sb/status/stable.svg">
  
# VPS yang diperlukan harus masih baru (WAJIB) / belum pernah menginstal apa pun.
<br>
- Jika Anda menginstal script dua kali, Anda harus mereset VPS ke pengaturan pabrik di panel penyedia VPS.<br>
- DOMAIN: Wajib, dapat menggunakan domain acak.<br>
- DEBIAN 9/10<br>
- Ubuntu 18/20 LTS<br>
- CPU MIN 1 CORE<br>
- RAM 1GB<br>
- (Rekomendasi: Gunakan Ubuntu 18/20 LTS untuk stabilitas yang lebih baik.)
<br>

# Pengaturan Cloudflare untuk yang memiliki Domain Sendiri
<br>
- SSL/TLS : FULL<br>
- SSL/TLS Recommender : OFF<br>
- GRPC : ON<br>
- WEBSOCKET : ON<br>
- Always Use HTTPS : OFF<br>
- UNDER ATTACK MODE : OFF<br>
<br>

## Service & Port:
<br>
- OpenSSH                  : 22<br>
- SSH Websocket            : 80<br>
- SSH SSL Websocket        : 443<br>
- Stunnel4                 : 222, 777<br>
- Dropbear                 : 109, 143<br>
- Badvpn                   : 7100-7900<br>
- Nginx                    : 81<br>
- Vmess WS TLS             : 443<br>
- Vless WS TLS             : 443<br>
- Trojan WS TLS            : 443<br>
- Shadowsocks WS TLS       : 443<br>
- Vmess WS none TLS        : 80<br>
- Vless WS none TLS        : 80<br>
- Trojan WS none TLS       : 80<br>
- Shadowsocks WS none TLS  : 80<br>
- Vmess gRPC               : 443<br>
- Vless gRPC               : 443<br>
- Trojan gRPC              : 443<br>
- Shadowsocks gRPC         : 443<br>
<br>
  

# Fitur
- Speedtest oleh Ookla
- Pengaturan Reboot Otomatis
- Restart Semua Layanan
- Penghapusan Akun yang Kadaluarsa Secara Otomatis
- Pemeriksaan Bandwidth
- BBRPLUS versi 1.4.0 oleh Chikage0o0
- Pengubah DNS
- Tidak ada fitur backup otomatis
- Fitur tambahan dapat ditambahkan secara manual
- Fitur Tambahan (Opsional)
- OpenVPN + SlowDNS + UDP-Custom oleh Exe302
- Panel Webmin + Blokir Iklan (Helium versi 3.0) oleh Abi Darwish
- Bot Telegram Xolpanel oleh XolvaID
- Catatan: Fitur tambahan diinstal setelah proses instalasi selesai.

# [Installasi]
- Step 1 Update Vps
```
apt update && apt upgrade -y && reboot
```
- Step 2 Install
```
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/FansGaming/vpn-autoscript/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
```
# Step 3 usage
```
menu
```


<!-- <a href="https://www.digitalocean.com/?refcode=8a474003bf18&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge"><img src="https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg" alt="DigitalOcean Referral Badge" /></a> -->

# PERHATIAN (HARUS DIBACA) DENGAN SAKSAMA
- DILARANG UNTUK DIJUAL KARENA SAYA MENDAPATKANNYA SECARA GRATIS DARI INTERNET.
- KEAMANAN DATA/PENGUNAAAN INTERNET ANDA BUKAN TANGGUNG JAWAB SAYA SEBAGAI PENYEDIA SCRIPT.
- SEMUA DATA/PENGUNAAAN INTERNET ANDA HANYA DIKONTROL OLEH PENYEDIA JARINGAN VPS DAN MUNGKIN PIHAK BERWENANG (FBI).
- GUNAKAN DENGAN BIJAK UNTUK MENGHINDARI MASALAH.
- MENONTON FILM DEWASA ADALAH TANGGUNG JAWAB ANDA SENDIRI.

# PESAN AKHIR
- TERIMA KASIH ATAS PERHATIAN DAN KESABARAN ANDA MEMBACA.
- MOHON MAAF JIKA ADA KATA-KATA YANG KURANG TEPAT, KARENA SAYA JUGA MANUSIA YANG TIDAK SEMPURNA.

<p align="center">
<a href="https://opensource.org/licenses/MIT"> <img src="https://img.shields.io/badge/License-MIT-yellow.svg" style="max-width:200%;">


  
