#!/usr/bin/env bash


# bash main.sh <arg>
# Where the argument is in the decimal number system.


if [ $# -ne 1 ]
then
    printf "A single argument is required."
else
    decimal="^\s*[+-]?[0]*([0-9]+|[0-9]+\.[0-9]*|[0-9]*\.[0-9]+|[1-9]\.[0-9]*[eE][+-]?[0-9]+)\s*$"
    if [[ "$1" =~ $decimal ]]
    then
        printf "Error: %s is a number." "$1"
    else
        printf "%s" "$1"
    fi
fi

printf "\n"
