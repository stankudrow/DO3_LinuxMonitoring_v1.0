#!/usr/bin/env bash


# `sudo apt install net-tools` for the ifconfig command


# Artifacts
#TIMEZONE_=$(date +"%Z UTC %z")
#IPs_=$(ip address | grep "inet\b" | awk '{print $2}' | tr '\n' ';')
#MASKs_=$(ifconfig | grep "inet\b" | awk -F' ' '{print $1, $2, $3, $4}' | tr '\n' ';')


HOSTNAME_=$(hostname)
TIMEZONE_=$(printf "%s UTC %s" "$(cat /etc/timezone)" "$(date +"%z")")
USER_=$(whoami)
OS_=$(awk -F' ' '{print $1, $2, $3}' < /etc/issue | xargs)  # xargs trims
DATE_=$(date +"%d %b %Y %H:%M:%S")
UPTIME_=$(uptime -p)
UPTIME_SEC_=$(awk '{print $1}' < /proc/uptime)
IP_=$(hostname -I | awk '{print $1}')  # there may be several IPs
MASK_=$(ifconfig | grep "$IP_" | awk '{print $4}')
GATEWAY_=$(ip route | grep "default" | awk '{print $3}')
RAM_TOTAL_=$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')
RAM_USED_=$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')
RAM_FREE_=$(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')
SPACE_ROOT_=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')
SPACE_ROOT_USED_=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')
SPACE_ROOT_FREE_=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')


function print_stats
{
    printf "HOSTNAME = %s\n" "$HOSTNAME_"
    printf "TIMEZONE = %s\n" "$TIMEZONE_"
    printf "USER = %s\n" "$USER_"
    printf "OS = %s\n" "$OS_"
    printf "DATE = %s\n" "$DATE_"
    printf "UPTIME = %s\n" "$UPTIME_"
    printf "UPTIME_SEC = %s\n" "$UPTIME_SEC_"
    printf "IP[s] = %s\n" "$IP_"
    printf "MASK[s] = %s\n" "$MASK_"
    printf "GATEWAY = %s\n" "$GATEWAY_"
    printf "RAM_TOTAL = %s\n" "$RAM_TOTAL_"
    printf "RAM_USED = %s\n" "$RAM_USED_"
    printf "RAM_FREE = %s\n" "$RAM_FREE_"
    printf "SPACE_ROOT = %s\n" "$SPACE_ROOT_"
    printf "SPACE_ROOT_USED = %s\n" "$SPACE_ROOT_USED_"
    printf "SPACE_ROOT_FREE = %s\n" "$SPACE_ROOT_FREE_"
}
