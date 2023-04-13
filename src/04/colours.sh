#!/usr/bin/env bash


# shellcheck source=/dev/null
source ./config.conf


default_colour_scheme=(1 6 1 6)

# the codes come from the ./config.conf file
colour_scheme=(
    "$column1_background"
    "$column1_font_color"
    "$column2_background"
    "$column2_font_color"
)


function get_random_colour_code()
{
    printf "%d" $(( 1 + "$RANDOM" % 6 ))
}


function get_colour_name()
{
    case "$1" in
        1) printf "white";;
        2) printf "red";;
        3) printf "green";;
        4) printf "blue";;
        5) printf "purple";;
        6) printf "black";;
    esac
}


function get_colour_type()
{
    # colour name
    cname=$(get_colour_name "$1")
    # default colour name
    dcname=$(get_colour_name "${default_colour_scheme[$2]}")
    if [[ "$cname" == "$dcname" ]]
    then
        printf "default (%s)" "$cname"
    else
        printf "%d (%s)" "$1" "$cname"
    fi
}


function print_used_colour_scheme()
{
    ctype=$(get_colour_type "${colour_scheme[0]}" 0)
    printf "Column 1 background = %s\n" "$ctype"

    ctype=$(get_colour_type "${colour_scheme[1]}" 1)
    printf "Column 1 font colour = %s\n" "$ctype"

    ctype=$(get_colour_type "${colour_scheme[2]}" 2)
    printf "Column 3 background = %s\n" "$ctype"

    ctype=$(get_colour_type "${colour_scheme[3]}" 3)
    printf "Column 2 font colour = %s\n" "$ctype"
}

### The section with colours to set in the output text

DEFAULT_COLOUR='\033[0m'

# background colours
BG_BLACK_COLOUR='\033[40m'
BG_RED_COLOUR='\033[41m'
BG_GREEN_COLOUR='\033[42m'
BG_PURPLE_COLOUR='\033[45m'
BG_BLUE_COLOUR='\033[46m'
BG_WHITE_COLOUR='\033[47m'

# foreground colours
FG_BLACK_COLOUR='\033[30m'
FG_RED_COLOUR='\033[31m'
FG_GREEN_COLOUR='\033[32m'
FG_PURPLE_COLOUR='\033[35m'
FG_BLUE_COLOUR='\033[36m'
FG_WHITE_COLOUR='\033[37m'


function get_bg()
{
    case "$1" in
        1) printf "%s" "$BG_WHITE_COLOUR";;
        2) printf "%s" "$BG_RED_COLOUR";;
        3) printf "%s" "$BG_GREEN_COLOUR";;
        4) printf "%s" "$BG_BLUE_COLOUR";;
        5) printf "%s" "$BG_PURPLE_COLOUR";;
        6) printf "%s" "$BG_BLACK_COLOUR";;
        *) printf "%s" "$DEFAULT_COLOUR";;
    esac
}

function get_fg()
{
    case "$1" in
        1) printf "%s" "$FG_WHITE_COLOUR";;
        2) printf "%s" "$FG_RED_COLOUR";;
        3) printf "%s" "$FG_GREEN_COLOUR";;
        4) printf "%s" "$FG_BLUE_COLOUR";;
        5) printf "%s" "$FG_PURPLE_COLOUR";;
        6) printf "%s" "$FG_BLACK_COLOUR";;
        *) printf "%s" "$DEFAULT_COLOUR";;
    esac
}
