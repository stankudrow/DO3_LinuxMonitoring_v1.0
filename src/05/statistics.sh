#!/usr/bin/env bash


# `sudo apt install tree` if needed


function print_statistics()
{
    dirpath="$1"
    # an unnecessary double check if you know about the main function
    if [ ! -d "$dirpath" ]
    then
        printf '"%s" is not a directory.\n' "$dirpath"
        exit 1
    fi

    # when the script has started to process data
    start_time=$(date +%s)

    dirs_count=$(find "$dirpath" ! -path "$dirpath" -type d | wc -l)
    printf "Total number of folders (including all nested ones) = %s\n" "$dirs_count"

    top5_dirs=$(find "$dirpath" ! -path "$dirpath" -type d -exec du -hs {} + | sort -hr -k 1 | head -n 5 | awk 'BEGIN{i=1}{printf "%d - %s, %s\n", i, $2, $1; i++}')
    printf "TOP 5 folders of maximum size arranged in descending order (path and size):\n%s\n" "$top5_dirs"

    files_count="$(find "$dirpath" -type f | wc -l)"
    printf "Total number of files = %d\n" "$files_count"

    printf "Number of:\n"

    conf_files_count="$(find "$dirpath" -type f -name "*.conf" | wc -l)"
    printf "Configuration files (with the .conf extension) = %d\n" "$conf_files_count"

    txt_files_count="$(find "$dirpath" -type f -name "*.txt" | wc -l)"
    printf "Text files = %d\n" "$txt_files_count"

    exec_files_count="$(find "$dirpath" -type f -executable | wc -l)"
    printf "Executable files = %d\n" "$exec_files_count"

    log_files_count="$(find "$dirpath" -type f -name "*.log" | wc -l)"
    printf "Log files (with the extension .log) = %d\n" "$log_files_count"

    arch_files_count="$(find "$dirpath" -type f -exec sh -c 'file -zb "$1" | grep "archive\|compress*"' sh {} \; | wc -l)"
    printf "Archive files = %d\n" "$arch_files_count"

    symlink_files_count="$(find "$dirpath" -type l | wc -l)"
    printf "Symbolic links = %d\n" "$symlink_files_count"

    top10_files=$(find "$dirpath" -type f -exec du -hs {} + | sort -hr -k 1 | head -n 10 | awk 'BEGIN{i=1}{idx=split($2, a, "."); printf "%d - %s, %s, %s\n", i, $2, $1, a[idx]; i++}')
    printf "TOP 10 files of maximum size arranged in descending order (path, size and type):\n%s\n" "$top10_files"

    top10_execs=$(find "$dirpath" -type f -executable -exec du -hs {} + | sort -hr -k 1 | head -n 10 | awk 'BEGIN{i=1}{"md5sum " $2 | getline m5s; close("md5sum"); idx=split(m5s, a, " "); printf "%d - %s, %s, %s\n", i, $2, $1, a[1]; i++}')
    printf "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):\n%s\n" "$top10_execs"

    # time for the total time of being run
    end_time=$(date +%s)
    printf "Script execution time (in seconds) = %s\n" $(( "$end_time" - "$start_time" ))
}
