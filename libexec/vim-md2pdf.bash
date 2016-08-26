#!/bin/bash

######################################
#
# doc: http://unix.stackexchange.com/questions/43520/how-can-i-print-well-formatted-code
#
######################################

function vim_md2pdf {
    local file=$1
    local PS_FILE=${file}.ps
    if [ -n "${2}" ]; then
        local PDF_FILE=${2}
    else
        local PDF_FILE=${file}.pdf
    fi  

    vim -c 'set filetype=markdown' -c 'hardcopy > '"$PS_FILE" -c quit ${file} \
    && ps2pdf $PS_FILE $PDF_FILE \
    && rm $PS_FILE \
    && echo "Output file: "$PDF_FILE
}

function usage {
    echo "Usage::" $0 "/path/of/input_file.md [ /path/of/output_file.pdf  ]"
}

if [ -z "${1}" ]; then
    usage
    exit 1
fi

vim_md2pdf $1 $2