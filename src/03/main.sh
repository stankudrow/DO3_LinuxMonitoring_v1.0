#!/usr/bin/env bash


# bash main.sh <name_bg> <name_fg> <value_bg> <value_fg>
# The arguments are integer numbers inclusively from 1 to 6.


# shellcheck source=/dev/null
source ./statistician.sh


function are_valid_args()
{
    if (( $# != 4 ));
    then
        printf "The script expects 4 integer colour codes.\n"
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
        printf "The colours for the parametres are the same.\n"
        exit 3
    fi
    if [[ $3 -eq $4 ]];
    then
        printf "The colours for the values of the parametres are the same.\n"
        exit 4
    fi
}


function main()
{
    are_valid_args "$@"
    print_colourised_stats "$@"
}


main "$@"
