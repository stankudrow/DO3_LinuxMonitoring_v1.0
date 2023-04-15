#!/usr/bin/env bash


# bash main.sh <arg>

# shellcheck source=/dev/null
source ./statistician.sh


function main()
{
    result=$(print_stats)
    printf "%s\n" "$result"
    read -r -p "Saving data? [yY] " to_save
    if [[ $to_save =~ ^\s*[Yy]\s*$ ]];
    then
        file_name=$(date +"%d_%m_%y_%H_%M_%S")
        printf "%s" "$result" > "${file_name}.status"
    fi
}


main
