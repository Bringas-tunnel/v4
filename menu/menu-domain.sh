#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip)
clear 
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[40;1;37m        • DOMAIN MENU •            \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " [\e[36m•1\e[0m] \e[36m𝗚𝗮𝗻𝘁𝗶 𝗗𝗼𝗺𝗮𝗶𝗻\033[0m"
echo -e " [\e[36m•2\e[0m] \e[36m𝗥𝗲𝗻𝗲𝘄 𝗰𝗲𝗿𝘁 𝗱𝗼𝗺𝗮𝗶𝗻\033[0m"
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-host ;;
2) clear ; certv2ray ;;
0) clear ; menu ;;
x) exit ;;
*) echo "salah pencet bro" ; sleep 1 ; menu-domain ;;
esac
