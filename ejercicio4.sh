#!/bin/bash

directorio="/home/rodrigo"

inotifywait -m -r -e create,modify,delete "$directorio" |

    while read -r directory event filename; do 

        echo "$(date +%Y/%m/%d %H:%M:%S) - $event: $directoty/$filename" >> /home/rodrigo/Documents/registro.txt
    done 




