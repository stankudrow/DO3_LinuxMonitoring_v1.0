#!/usr/bin/env bash


# bash main.sh
# The script will read the contents of the ./config.conf file.
# At least one colour for the name/parametre section must be specified.
# At least one colour for the values of the names/parametres section must be specified.
# The code for colours must be integer numbers inclusively from 1 to 6.


# shellcheck source=/dev/null
source ./statistician.sh


function _check_the_default_scheme()
{
    code_pattern="^[1-6]$"
    for idx in {0..3}
    do
        if ! [[ "${default_colour_scheme[$idx]}" =~ $code_pattern ]]
        then
            printf "The code %s at the index %d is out of the [1-6] segment.\n" "${default_colour_scheme[$idx]}" "$idx"
            exit 1
        fi
    done
    for idx in 0 2
    do
        if [ "${default_colour_scheme[$idx]}" -eq "${default_colour_scheme[$idx + 1]}" ]
        then
            printf "The codes[%d] = %d and codes[%d] = %d are the same.\n" "$idx" "${default_colour_scheme[$idx]}" $(( idx + 1 )) "${default_colour_scheme[$idx + 1]}"
            exit 2
        fi
    done
}


function configure()
{
    if (( $# != 0 ));
    then
        printf "[WARNING]: no parametres are needed.\n"
    fi
    for idx in {0..3}
    do
        arg="${colour_scheme[$idx]}"
        if [ -z "$arg" ] || { [ -n "$arg" ] && { [ "$arg" -lt 1 ] || [ "$arg" -gt 6 ]; } }
        then
            colour_scheme[idx]="${default_colour_scheme[$idx]}"
        fi
    done
}


function main()
{
    _check_the_default_scheme
    configure "$@"
    print_colourised_stats "${colour_scheme[0]}" "${colour_scheme[1]}" "${colour_scheme[2]}" "${colour_scheme[3]}"
    print_used_colour_scheme
}


main "$@"
