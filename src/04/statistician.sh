#!/usr/bin/env bash


# shellcheck source=/dev/null
source ./colours.sh


# `sudo apt install ipcalc` - a replacement for `ifconfig` solution


HOSTNAME_=$(hostname)
TIMEZONE_=$(printf "%s UTC %s" "$(cat /etc/timezone)" "$(date +"%z")")
USER_=$(whoami)
OS_=$(awk -F' ' '{print $1, $2, $3}' < /etc/issue | xargs)  # xargs trims
DATE_=$(date +"%d %b %Y %H:%M:%S")
UPTIME_=$(uptime -p)
UPTIME_SEC_=$(awk '{print $1}' < /proc/uptime)
IP_=$(hostname -I | awk '{print $1}')  # there may be several IPs
MASK_=$(ip address | ipcalc "$IP_" | grep "^Netmask" | awk '{print $2}')
GATEWAY_=$(ip route | grep "default" | awk '{print $3}')
RAM_TOTAL_=$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')
RAM_USED_=$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')
RAM_FREE_=$(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')
SPACE_ROOT_=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')
SPACE_ROOT_USED_=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')
SPACE_ROOT_FREE_=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')


# https://stackoverflow.com/questions/5412761/using-colors-with-printf
function print_colourised_stats
{
    bg_name=$(get_bg "$1")
    fg_name=$(get_fg "$2")
    bg_value=$(get_bg "$3")
    fg_value=$(get_fg "$4")
    bg_def=$(get_bg 0)
    fg_def=$(get_fg 0)

    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$fg_name" "HOSTNAME" "$bg_def" "$fg_def" "$bg_value" "$fg_value" "$HOSTNAME_" "$bg_def" "$fg_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$fg_name" "TIMEZONE" "$bg_def" "$fg_def" "$bg_value" "$fg_value" "$TIMEZONE_" "$bg_def" "$fg_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$fg_name" "USER" "$bg_def" "$fg_def" "$bg_value" "$fg_value" "$USER_" "$bg_def" "$fg_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$fg_name" "OS" "$bg_def" "$fg_def" "$bg_value" "$fg_value" "$OS_" "$bg_def" "$fg_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$fg_name" "DATE" "$bg_def" "$fg_def" "$bg_value" "$fg_value" "$DATE_" "$bg_def" "$fg_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$fg_name" "UPTIME" "$bg_def" "$fg_def" "$bg_value" "$fg_value" "$UPTIME_" "$bg_def" "$fg_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$fg_name" "UPTIME_SEC" "$bg_def" "$fg_def" "$bg_value" "$fg_value" "$UPTIME_SEC_" "$bg_def" "$fg_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$fg_name" "IP[s]" "$bg_def" "$fg_def" "$bg_value" "$fg_value" "$IP_" "$bg_def" "$fg_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$fg_name" "MASK[s]" "$bg_def" "$fg_def" "$bg_value" "$fg_value" "$MASK_" "$bg_def" "$fg_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$fg_name" "GATEWAY" "$bg_def" "$fg_def" "$bg_value" "$fg_value" "$GATEWAY_" "$bg_def" "$fg_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$fg_name" "RAM_TOTAL" "$bg_def" "$fg_def" "$bg_value" "$fg_value" "$RAM_TOTAL_" "$bg_def" "$fg_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$fg_name" "RAM_USED" "$bg_def" "$fg_def" "$bg_value" "$fg_value" "$RAM_USED_" "$bg_def" "$fg_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$fg_name" "RAM_FREE" "$bg_def" "$fg_def" "$bg_value" "$fg_value" "$RAM_FREE_" "$bg_def" "$fg_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$fg_name" "SPACE_ROOT" "$bg_def" "$fg_def" "$bg_value" "$fg_value" "$SPACE_ROOT_" "$bg_def" "$fg_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$fg_name" "SPACE_ROOT_USED" "$bg_def" "$fg_def" "$bg_value" "$fg_value" "$SPACE_ROOT_USED_" "$bg_def" "$fg_def"
    printf "%b%b%s%b%b = %b%b%s%b%b\n" "$bg_name" "$fg_name" "SPACE_ROOT_FREE" "$bg_def" "$fg_def" "$bg_value" "$fg_value" "$SPACE_ROOT_FREE_" "$bg_def" "$fg_def"
}
