#!/usr/bin/env bash


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
