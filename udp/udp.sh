#!/bin/bash
#Script UdpCustom 2023
#Script By MARDHEX
#https://t.me/mdxdev
cd
rm -rf /root/udp
mkdir -p /root/udp
# install udp-custom
echo ""
sleep 4
echo " Proses Download Script UdpCustom........"
sleep 4
clear
echo " Cecking Tool UdpCustom By Mardhex......."
sleep 4
clear
echo " Succes Cecking Tool..........."
sleep 4
clear
echo " Please Waiting Proses Downloading Toll UdpCustom........"
sleep 4
clear
wget -q --show-progress --load-cookies /tmp/cookies.txt "https://gitlab.com/Exe302/Tunnel/-/raw/main/udp-custom-linux-amd64" -O /root/udp/udp-custom && rm -rf /tmp/cookies.txt
chmod +x /root/udp/udp-custom
clear
# install Config Default Udp
echo ""
sleep 4
echo " Proses Download Script Config Default........"
sleep 4
clear
echo " Cecking Config Default By Mardhex......."
sleep 4
clear
echo " Succes Cecking Config Default Tool..........."
sleep 4
clear
echo " Please Waiting Proses Downloading Default Config UdpCustom........"
sleep 4
clear
wget -q --show-progress --load-cookies /tmp/cookies.txt "https://gitlab.com/Exe302/Tunnel/-/raw/main/config.json" -O /root/udp/config.json && rm -rf /tmp/cookies.txt
chmod 644 /root/udp/config.json

if [ -z "$1" ]; then
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by MARDHEX

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
else
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by MARDHEX

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server -exclude $1
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
fi

echo start service udp-custom
systemctl start udp-custom &>/dev/null

echo enable service udp-custom
systemctl enable udp-custom &>/dev/null

echo ""
sleep 0,5
clear

