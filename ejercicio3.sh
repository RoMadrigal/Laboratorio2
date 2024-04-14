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


gnuplot << EOF 

set terminal png

set output "grafica_$ejecutable.png"

set xlabel "Tiempo"

set ylabel "Consumo"

set title "Grafica de CPU y Memoria de $ejecutable"

plot "$registro" using 1:2 with lines title "CPU", \
     
     "$registro" using 1:3 with lines title "Memoria" 
EOF

echo "Se ha generado la grafica: grafica_$ejecutable.png"












