#!/usr/bin/env bash


# A recommended way is to run the script as `sudo bash main.sh <dirpath>`.
# The dirpath must end with a slash (it is the requirement from the task).


# shellcheck source=/dev/null
source ./statistics.sh


function check_args()
{
    if [ "$#" -ne 1 ]
    then
        printf "Error: the script needs the path to the directory.\n"
        exit 1
    else
        if [ ! -d "$1" ]
        then
            printf 'Error: the directory "%s" does not exist.\n' "$1"
            exit 2
        fi
        if [[ "${1: -1}" != "/" ]]; then
            printf 'The directory "%s" does not end with a slash (/) character.\n' "$1"
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
