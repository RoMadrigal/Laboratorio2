#!/bin/bash

directorio="/home/rodrigo/Tareas"

inotifywait -m -r -e create,modify,delete "$directorio" |

    while read -r directory event filename; do 

        echo "$(date +%Y/%m/%d %H:%M:%S) - $event: $directoty/$filename" >> /home/rodrigo/Documents/registro.txt
    done 


[Unit]
Description=Servicio de Monitoreo de Cambios en Directorios
After=network.target

[Service]
Type=simple
ExecStart=/home/rodrigo/Scripts/ejercicio4.sh
WorkingDirectory=/home/rodrigo/Tareas
Restart=always

[Install]
WantedBy=multi.user.target




