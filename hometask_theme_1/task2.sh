#!/bin/bash
read -p "Input file name: " filename

echo "$filename"
if [ -f "$filename" ]; then
	echo "Файл найден!"
else 
	echo "Файл не найден."
fi
