#!/usr/bin/env bash


# shellcheck source=/dev/null
source ./statistician.sh


function main()
{
    read -r -p "Saving data? [yY] " to_save
    if [[ $to_save =~ ^[Yy]$ ]];
    then
        read -r -p "Into a file? [yY] " save_to_file
        if [[ $save_to_file =~ ^[Yy]$ ]];
        then
            file_name=$(date +"%d_%m_%y_%H_%M_%S")
            print_stats > "${file_name}.status"
        else
            read -r -p "Into a standard input? [yY] " save_to_stdin
            if [[ $save_to_stdin =~ ^[Yy]$ ]];
            then
                print_stats
            fi
        fi
    fi
}


main
