#! /usr/bin/bash

# first argument - expression, second destination file
function append_to_file_if_not_exist {
    expression1=$1
    dest_file1=$2
    if ! grep "$expression1" "$dest_file1"; then
    	echo "${expression1}" >> "${dest_file1}"
    fi
}