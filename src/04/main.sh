#!/usr/bin/env bash


# shellcheck source=/dev/null
source ./statistician.sh


function are_valid_args()
{
    if (( $# != 0 ));
    then
        printf "[WARNING]: no parametres are needed.\n"
    fi
    for idx in {0..3}
    do
        arg="${colour_scheme[$idx]}"
        if [ -n "$arg" ] && { [ "$arg" -lt 1 ] || [ "$arg" -gt 6 ]; };
        then
            printf "%s is an invalid colour code.\n" "$arg"
            exit 1
        fi
    done
    if [[ "${colour_scheme[0]}" -eq "${colour_scheme[1]}" ]];
    then
        if [ -z "${colour_scheme[0]}" ]
        then
            reason="empty (please refer to the <./config.conf> file"
        else
            reason="the same"
        fi
        printf "The colours for the names are %s.\n" "$reason"
        exit 2
    fi
    if [[ "${colour_scheme[2]}" -eq "${colour_scheme[3]}" ]];
    then
        if [ -z "${colour_scheme[2]}" ]
        then
            reason="empty (please refer to the <./config.conf> file"
        else
            reason="the same"
        fi
        printf "The colours for the values are %s.\n" "$reason"
        exit 3
    fi
}


function get_paired_colour()
{
    colour_code=$(get_random_colour_code)
    while [ "$colour_code" == "$1" ]
    do
        colour_code=$(get_random_colour_code)
    done
    printf "%s" "$colour_code"
}


function customise_colour_scheme()
{
    for idx in 0 2
    do
        if [ -z "${colour_scheme[$idx]}" ]
        then
            if [ -z "${colour_scheme[$idx + 1]}" ]
            then
                colour_scheme["$idx"]=$(get_random_colour_code)
                colour_scheme["$idx" + 1]=$(get_paired_colour "${colour_scheme[$idx]}")
            else
                colour_scheme["$idx"]=$(get_paired_colour "${colour_scheme[$idx + 1]}")
            fi
        fi
        if [ -z "${colour_scheme[$idx + 1]}" ]
        then
            colour_scheme["$idx" + 1]=$(get_paired_colour "${colour_scheme[$idx]}")
        fi
    done
}


function main()
{
    are_valid_args "$@"
    customise_colour_scheme
    for i in {0..3}
    do
        echo "${colour_scheme[$i]}"
    done
    print_colourised_stats "${colour_scheme[0]}" "${colour_scheme[1]}" "${colour_scheme[2]}" "${colour_scheme[3]}"
    print_used_colour_scheme
}


main "$@"
