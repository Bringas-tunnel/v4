#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip)
clear 
echo -e "\e[1;37mDOMAIN MENU\033[0m"
echo -e ""
echo -e "      \e[1;37m[•1]\e[0m] \e[1;36m𝗚𝗮𝗻𝘁𝗶 𝗗𝗼𝗺𝗮𝗶𝗻\033[0m"
echo -e "      \e[1;37m[•2]\e[0m] \e[1;36m𝗥𝗲𝗻𝗲𝘄 𝗰𝗲𝗿𝘁 𝗱𝗼𝗺𝗮𝗶𝗻\033[0m"
echo -e "      \e[1;33m[•0]\e[0m] \e[1;33mBack To Menu\033[0m"
echo -e "     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e ""
read -p " >>>   " opt
echo -e ""
case $opt in
1) clear ; add-host ;;
2) clear ; certv2ray ;;
0) clear ; menu ;;
x) exit ;;
*) echo "salah pencet bro" ; sleep 1 ; menu-domain ;;
esac
