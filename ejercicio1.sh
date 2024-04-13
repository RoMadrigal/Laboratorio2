#!/bin/bash

process_pid=$1

process_name=$(ps -p "$process_pid" -o comm)

process_id=$(ps -p "$process_pid" -o pid)

process_parent=$(ps -p "$process_pid" -o ppid)

process_user=$(ps -p "$process_pid" -o user)

process_CPU=$(ps -p "$process_pid" -o %cpu) 

process_memo=$(ps -p "$process_pid" -o %mem)

process_status=$(ps -p "$process_pid" -o stat)

process_path=$(readlink -f "/proc/$process_pid/exe")

echo "El nombre del proceso es: $process_name"

echo "El ID del proceso es: $process_id"

echo "El Parent Process ID es: $process_parent"

echo "El propietario del proceso es: $process_user"

echo "El consumo de CPU es de: $process_CPU"

echo "El consumo en memoria es: $process_memo"

echo "El estado del proceso es: $process_status"

echo "El path del ejecutable es: $process_path"

