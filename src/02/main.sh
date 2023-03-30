#!/usr/bin/env bash

# shellcheck source=./statician.sh
source ./statician.sh


function main()
{
    read -r -p "Saving data? " to_save
    if [[ $to_save =~ ^[Yy]$ ]];
    then
        printf "YES\n"
        read -r -p "Into a file? " save_to_file
        if [[ $save_to_file =~ ^[Yy]$ ]];
        then
            printf "FILE YES\n"
            file_name=$(date +"%d_%m_%y_%H_%M_%S")
            print_stats > "${file_name}.status"
        else
            read -r -p "Into a standard input? " save_to_stdin
            if [[ $save_to_stdin =~ ^[Yy]$ ]];
            then
                printf "STDIN YES\n"
                print_stats
            fi
        fi
    fi
}


main