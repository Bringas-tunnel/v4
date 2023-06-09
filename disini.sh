#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] Downloading Update File"
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Bringas-tunnel/v4/main/menu/menu.sh" && chmod +x /usr/bin/menu
