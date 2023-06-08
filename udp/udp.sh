#!/bin/bash
#Script UdpCustom 2023
#Script By BRINGAS-family

cd
rm -rf /root/udp
mkdir -p /root/udp
# install udp-custom
echo ""
sleep 4
echo " Download UDP - custom........" | lolcat
sleep 4
clear
echo " Cecking Tool UDP - custom By : Bringas-family......." | lolcat
sleep 4
clear
echo " Succes Cecking Tool..........." | lolcat
sleep 4
clear
echo " Please Downloading Toll UdpCustom........" | lolcat
sleep 4
clear
wget -q --show-progress --load-cookies /tmp/cookies.txt "https://gitlab.com/Exe302/Tunnel/-/raw/main/udp-custom-linux-amd64" -O /root/udp/udp-custom && rm -rf /tmp/cookies.txt
chmod +x /root/udp/udp-custom
clear
# install Config Default Udp
echo ""
sleep 4
echo "\e[1;36mDownload Script UDP - custom........\033[0m"
sleep 4
clear
echo "\e[1;36mCecking UDP - custom By : Bringas-family.......\033[0m"
sleep 4
clear
echo "\e[1;36mSucces Cecking UDP - custom...........\033[0m"
sleep 4
clear
echo "\e[1;32mPROCCESIING UDP - custom........\033[0m"
sleep 4
clear
wget -q --show-progress --load-cookies /tmp/cookies.txt "https://gitlab.com/Exe302/Tunnel/-/raw/main/config.json" -O /root/udp/config.json && rm -rf /tmp/cookies.txt
chmod 644 /root/udp/config.json

if [ -z "$1" ]; then
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by Andyyuda

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
Description=UDP Custom by BRINGAS

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

