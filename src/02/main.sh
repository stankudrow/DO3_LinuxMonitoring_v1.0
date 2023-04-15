#!/usr/bin/env bash


# bash main.sh <arg>

# shellcheck source=/dev/null
source ./statistician.sh


function main()
{
    read -r -p "Saving data? [yY] " to_save
    if [[ $to_save =~ ^\s*[Yy]\s*$ ]];
    then
        read -r -p "Into a file? [yY] " save_to_file
        if [[ $save_to_file =~ ^\s*[Yy]\s*$ ]];
        then
            file_name=$(date +"%d_%m_%y_%H_%M_%S")
            print_stats > "${file_name}.status"
        else
            print_stats
        fi
    fi
}


main
