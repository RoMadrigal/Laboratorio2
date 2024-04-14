#!/bin/bash

ejecutable=$1

registro="log_$ejecutable.txt"

./$ejecutable &

exepid=$!

echo "Hora ConsumoCPU ConsumoMemoria" > "$registro"

while ps -p "$exepid" >/dev/null; do
   
    hora=$(date +%Y/%m/%d %H:%M:%S)
 
    usoCPU=$(ps -p "$exepid" -o %cpu | tail -n 1)
    
    usoMemo=$(ps -p "$exepid" -o %mem | tail -n 1)

    echo "$hora $usoCPU $usoMemo" >> "$registro"

    sleep 5

done 


