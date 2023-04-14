#!/usr/bin/env bash


# shellcheck source=/dev/null
source ./statistics.sh


# Consider running the script as follows: `sudo bash main <dirpath>`
# Executing the script with `sudo` privileges is a recommended way.


function check_args()
{
    if [ "$#" -ne 1 ]
    then
        printf "Error: the script needs the path to the directory.\n"
        exit 1
    else
        if [ ! -a "$1" ]
        then
            printf 'Error: "%s" does not exist.\n' "$1"
            exit 2
        fi
        if [ ! -d "$1" ]
        then
            printf 'Error: "%s" is not a directory.\n' "$1"
            exit 3
        fi
    fi
}


function main()
{
    check_args "$@"
    print_statistics "$1"
}


main "$@"
