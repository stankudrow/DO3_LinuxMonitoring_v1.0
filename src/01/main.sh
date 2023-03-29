#!/usr/bin/env bash


if [ $# -ne 1 ]
then
    printf "A single argument required."
else
    numpat="^[+-]?([0-9]+|([0-9]*\.([0-9]+([eE][0-9]+)?)?))$"
    if [[ $1 =~ $numpat ]]
    then
        printf "%s is number-like." "$1"
    else
        printf "%s" "$1"
    fi
fi

printf "\n"
