#!/bin/bash

if [ $# -ne 2]; then 
    echo "Se usan: $0 <process_name> <command>"
    exit 1
fi

process_name=$1

command=$2


