#!/bin/bash

if [ $# -ne 2]; then 
    echo "Se usan: $0 <process_name> <command>"
    exit 1
fi

process_name=$1

command=$2

while True; do 
    if pgrep -x "$process_name" >/dev/null; then
        echo "El proceso esta corriendo"
    else
        echo "El proceso no esta corriendo, se levantara"
        $command &
    fi 

    sleep 10

done 


