#!/usr/bin/env bash


HOSTNAME_=$(hostname)
TIMEZONE_=$(date +"%Z UTC %z")
USER_=$(whoami)
OS_=$(uname -sv)
DATE_=$(date +"%d %b %Y %H:%M:%S")
UPTIME_=$(uptime -p)
UPTIME_SEC_=$(awk '{print $1}' < /proc/uptime)
IPs_=$(ip address | grep "inet\b" | awk '{print $2}' | tr '\n' ';')
MASKs_=$(ifconfig | grep "inet\b" | awk -F' ' '{print $1, $2, $3, $4}' | tr '\n' ';')
GATEWAY_=$(ip route | grep "default" | awk '{print $3}')
RAM_TOTAL_=$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')
RAM_USED_=$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')
RAM_FREE_=$(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')
SPACE_ROOT_=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')
SPACE_ROOT_USED_=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')
SPACE_ROOT_FREE_=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')


function print_stats
{
    echo "HOSTNAME = $HOSTNAME_"
    echo "TIMEZONE = $TIMEZONE_"
    echo "USER = $USER_"
    echo "OS = $OS_"
    echo "DATE = $DATE_"
    echo "UPTIME = $UPTIME_"
    echo "UPTIME_SEC = $UPTIME_SEC_"
    echo "IP[s] = $IPs_"
    echo "MASK[s] = $MASKs_"
    echo "GATEWAY = $GATEWAY_"
    echo "RAM_TOTAL = $RAM_TOTAL_"
    echo "RAM_USED = $RAM_USED_"
    echo "RAM_FREE = $RAM_FREE_"
    echo "SPACE_ROOT = $SPACE_ROOT_"
    echo "SPACE_ROOT_USED = $SPACE_ROOT_USED_"
    echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE_"
}
