#!/usr/bin/env bash


# `sudo apt install tree` if needed


function print_statistics()
{
    dirpath="$1"
    # an unnecessary double check if you know about the main function
    if [ ! -d "$dirpath" ]
    then
        printf '"%s" is not a directory.\n' "$dirpath"
        exit 1
    fi

    # when the script has started to process data
    start_time=$(date +%s)

    # this will include the hidden directories without following the symbolic links
    dirs=$(find "$dirpath" -type d)
    dirs_count=$(printf "%s\n" "$dirs" | wc -l)  # without \n you can get 
    printf "The total number of directories (including the nested ones) = %s\n" "$dirs_count"

    end_time=$(date +%s)
    printf "%s - %s\n" "$end_time" "$start_time"
    printf "Script execution time (in seconds) = %s\n" $(( "$end_time" - "$start_time" ))
}
