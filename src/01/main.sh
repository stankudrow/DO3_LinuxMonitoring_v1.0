#!/usr/bin/env bash


# bash main.sh <arg>
# Where the argument is in the decimal number system.


if [ $# -ne 1 ]
then
    printf "A single argument is required."
else
    # this pattern is likely to be non-complete
    decimal="^[[:space:]]*[+-]?([0-9]+|[0-9]+\.[0-9]*|[0-9]*\.[0-9]+|[0]*[1-9]\.[0-9]*[eE][+-]?[0-9]+)[[:space:]]*$"
    if [[ "$1" =~ $decimal ]]
    then
        printf "Error: %s is a number." "$1"
    else
        printf "%s" "$1"
    fi
fi

printf "\n"
