#!/usr/bin/env bash


# bash main.sh
# The script will read the contents of the ./config.conf file.
# At least one colour for the name/parametre section must be specified.
# At least one colour for the values of the names/parametres section must be specified.
# The code for colours must be integer numbers inclusively from 1 to 6.


# shellcheck source=/dev/null
source ./statistician.sh


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
    configure "$@"
    print_colourised_stats "${colour_scheme[0]}" "${colour_scheme[1]}" "${colour_scheme[2]}" "${colour_scheme[3]}"
    print_used_colour_scheme
}


main "$@"
