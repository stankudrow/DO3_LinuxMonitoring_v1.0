#!/usr/bin/env bash

# shellcheck source=./statician.sh
source ./statician.sh


function are_valid_args()
{
    if (( $# != 4 ));
    then
        printf "Invalid number of arguments.\n"
        exit 1
    fi
    for arg in "$@"
    do
        if [[ $arg -lt 1 || $arg -gt 6 ]];
        then
            printf "%s is an invalid argument.\n" "$arg"
            exit 2
        fi
    done
    if [[ $1 -eq $2 ]];
    then
        printf "The colours for the names are the same.\n"
        exit 3
    fi
    if [[ $3 -eq $4 ]];
    then
        printf "The colours for the values are the same.\n"
        exit 4
    fi
}


function main()
{
    are_valid_args "$@"
    print_colourised_stats "$@"
}


main "$@"
