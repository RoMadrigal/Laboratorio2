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



