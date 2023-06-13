#!/bin/bash 
 # ========================================= 
 vlx=$(grep -c -E "^#& " "/etc/xray/config.json") 
 let vla=$vlx/2
 vmc=$(grep -c -E "^### " "/etc/xray/config.json") 
 let vma=$vmc/2 
 ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)" 
 trx=$(grep -c -E "^#! " "/etc/xray/config.json") 
 let tra=$trx/2 
 ssx=$(grep -c -E "^## " "/etc/xray/config.json") 
 let ssa=$ssx/2 
 COLOR1='\033[0;35m' 
 COLOR2='\033[0;39m' 
 clear

BURIQ () {
    curl -sS https://raw.githubusercontent.com/Bringas-tunnel/permission/main/ipmini > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/Bringas-tunnel/permission/main/ipmini | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/Bringas-tunnel/permission/main/ipmini | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/Bringas-tunnel/permission/main/ipmini | grep $MYIP | awk '{print $3}')
fi

# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Clear
clear

MYIP=$(curl -sS ipv4.icanhazip.com)
#########################

# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[1;36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
# VPS Information
#Domain
domain=$(cat /etc/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws-stunnel | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${GREEN}ON${NC}"
else
    status_ws_epro="${red}OFF${NC}"
fi
# // Trojan Proxy
ss=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ss == "running" ]]; then
    status_ss="${GREEN}ON${NC}"
else
    status_ss="${red}OFF${NC}"
fi
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${red}OFF${NC}"
fi
if [ "$Isadmin" = "Pro" ]; then
uis="${GREEN}Premium User$NC"
else
uis="${red}Free Version$NC"
fi
MYIP=$(curl -sS ipv4.icanhazip.com)
#########################

# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[1;5m'
yell='\e[13;3m'
red='\e[1;31m'
green='\e[1;32m'
blue='\e[1;34m'
ungu='\e[1;35m'
cyan='\e[1;36m'
Lred='\e[1;91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
RED='\033[1;31m'
NC='\033[0m'
yl='\e[32;1m'
green='\033[1;32m'
orange='\033[1;33m'
blue='\033[1;34m'
ungu='\033[1;35m'
cyan='\033[1;36m'
white='\033[0;37m'
# VPS Information
#Domain
domain=$(cat /etc/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
# warna valid 
green_background="\033[42;37m"
red_background="\033[41;37m"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
# // SSH Websocket Proxy 
#Warna Teks Background
Bhijau="\033[4;32m"
Bmerah="\033[4;31m"
Bkuning="\033[4;33m"
Bputih="\033[4;37m"
Bbiru="\033[4;34m"
Bungu="\033[4;35m"
Bcyan="\033[4;36m"
Bhitam="\033[4;30m"
#Warna Text 
kuning="\e[1;33m"
hijau="\e[1;32m"
cyan="\e[1;36m"
#Status running 
ssh_ws=$( systemctl status ws-stunnel | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${GREEN}ON${NC}"
else
    status_ws_epro="${red}OFF${NC}"
fi
# // Trojan Proxy
ss=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ss == "running" ]]; then
    status_ss="${GREEN}ON${NC}"
else
    status_ss="${red}OFF${NC}"
fi
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${red}OFF${NC}"
    fi
clear
echo -e "${white}╒━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╕${NC}"
echo -e "║${red_background}            ★ 𝐁𝐑𝐈𝐍𝐆𝐀𝐒 𝐓𝐔𝐍𝐍𝐄𝐋 ★              ${NC}"
echo -e "${white}╘━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╛${NC}"
echo -e "║ [ SSH : $status_ws_epro ] [ X-RAY : $status_ss ] [ NGINX : $status_nginx ]"
echo -e "║${white}╒━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╕${NC}"
echo -e "║${red_background}              SYSTEM OPERATING              ${NC}"
echo -e "║${white}╘━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╛${NC}"
echo -e "║${kuning} IP VPS        \e[0m★ \033[1;33m $IPVPS ${NC}"
echo -e "║${kuning} DOMAIN        \e[0m★ \033[1;33m $domain ${NC}"
echo -e "║${kuning} NS DOMAIN     \e[0m★ \033[1;33m $(cat /root/nsdomain) ${NC}"
echo -e "║${kuning} RAM           \e[0m★ \033[1;33m $tram MB ${NC}"
echo -e "║${kuning} CPU           \e[0m★ \033[1;36m $cpu_usage"
echo -e "║${kuning} CPU CORES     \e[0m★ \033[1;36m $cores"
echo -e "║${cyan}   WHATSAPP      \e[0m★ \033[1;36m 085955333616"
echo -e "║${white}╘━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╛${NC}" 
echo -e "║${red_background}            ACCOUNT INFORMATION             ${NC}"
echo -e "║${white}╒━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╕${NC}"
echo -e "║  ${green}SSH      VMESS       VLESS      TROJAN$NC  $COLOR1" 
echo -e "║  ${white} $ssh1        $vma           $vla          $tra                  $NC" 
echo -e "${white}╠════════════════════════════════════════════╣${NC}"
echo -e "║${cyan}          ┌────────────────────────┐${NC}"
echo -e "║${cyan}          │Client :$NC\033[1;35m$Name${NC}"
echo -e "║${cyan}          │Xpired :$NC\033[1;35m$Exp${NC}"
echo -e "║${cyan}          └────────────────────────┘${NC}"
echo -e "${white}╠════════════════════════════════════════════╣${NC}"
echo -e "║${white}[•1]${NC}║ ${kuming}ꜱꜱʜ${NC}        ""║\e[1;37m[•6]\e[0m║ \e[1;36mCheck Running${NC}"
echo -e "║${white}[•2]${NC}║ ${kuning}ᴠᴍᴇꜱꜱ${NC}      ""║\e[1;37m[•7]\e[0m║ \e[1;36mRestart Service${NC}"  
echo -e "║${white}[•3]${NC}║ ${kuning}ᴠʟᴇꜱꜱ${NC}      ""║\e[1;37m[•8]\e[0m║ \e[1;36mMenu Backup${NC}"
echo -e "║${white}[•4]${NC}║ ${kuning}ᴛʀᴏᴊᴀɴ-ɢᴏ${NC}  ""║\e[1;37m[•9]\e[0m║ \e[1;36mSet Pw Vps${NC}"
echo -e "║${white}[•5]${NC}║ ${kuning}ᴛʀᴏᴊᴀɴ-ᴡꜱ${NC}  ""║\e[1;37m[10]\e[0m║ \e[1;36mSet Reboot${NC}"
echo -e "${white}╠════════════════════════════════════════════╣${NC}"    
echo -e "║                 ${green}   0 ${NC}          "
echo -e "║                 ${white}𝙎𝙀𝙏𝙏𝙄𝙉𝙂𝙎 ${NC}"
echo -e "${white}╠════════════════════════════════════════════╣${NC}"
echo -e   ""
read -p " >>>  "  opt
echo -e   ""
case $opt in
1) clear ; menu-sshh ;;
2) clear ; menu-vmess ;;
3) clear ; menu-vless ;;
4) clear ; menu-trgo ;;
5) clear ; menu-trojan ;;
6) clear ; status ;;
7) clear ; restarts ;;
8) clear ; menu-backup ;;
9) clear ; passwd ;;
10) clear ; auto-reboot ;;
11) clear ; up ;;
0) clear ; menu-set ;;
x) exit ;;
esac
