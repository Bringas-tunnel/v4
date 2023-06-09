#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] Downloading Update File"
wget https://raw.githubusercontent.com/Andyyuda/ver3/main/backup/set-br.sh &&  chmod +x set-br.sh && ./set-br.sh
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Bringas-tunnel/v4/main/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/Andyyuda/ver3/main/backup/menu-backup.sh" && chmod +x /usr/bin/menu-backup
wget -q -O /usr/bin/backup "https://raw.githubusercontent.com/Andyyuda/ver3/main/backup/backup.sh" && chmod +x /usr/bin/backup
wget -q -O /usr/bin/restore "https://raw.githubusercontent.com/Andyyuda/ver3/main/backup/restore.sh" && chmod +x /usr/bin/restore
echo -e " [INFO] Update Successfully"
sleep 2
exit
