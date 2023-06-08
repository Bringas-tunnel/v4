#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
clear 
echo -e "\e[1;37mSYSTEM MENU\033[0m"
echo -e " "
echo -e "         [\e[1;37m•1\e[0m] \e[1;36mUbah Domain vps\033[0m"
echo -e "         [\e[1;37m•2\e[0m] \e[1;36mUbah Port\033[0m"
echo -e "         [\e[1;37m•3\e[0m] \e[1;36mUbah banner\033[0m"
echo -e "         [\e[1;37m•4\e[0m] \e[1;36mRestart service\033[0m"
echo -e "         [\e[1;37m•5\e[0m] \e[1;36mCek bandwith\033[0m"
echo -e "         [\e[1;37m•6\e[0m] \e[1;36mAtur waktu riset\033[0m"
echo -e "         [\e[1;37m•7\e[0m] \e[1;36mSpeedtest vps\033[0m"
echo -e "         [\e[1;37m•8\e[0m] \e[1;36mWebmin menu\033[0m"
echo -e "         [\e[1;37m•9\e[0m] \e[1;36mTentang Script\033[0m"
echo -e "         [\e[1;33m•0\e[0m] \e[1;33mBack To Menu\033[0m"
echo -e "         ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e ""
read -p " >>>   " opt
echo -e ""
case $opt in
1) clear ; menu-domain ; exit ;;
2) clear ; port-change ; exit ;;
3) clear ; nano /etc/issue.net ; exit ;;  #ssh-vpn banner.conf
4) clear ; restarts ; exit ;;
5) clear ; bw ; exit ;;
6) clear ; auto-reboot ; exit ;;
7) clear ; speedtest ; exit ;;
8) clear ; menu-webmin ; exit ;; 
9) clear ; about ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "salah pencet taiii" ; sleep 1 ; menu-set ;;
esac
