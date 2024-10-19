#!/bin/bash
echo "input your word to search:"
read word
echo "input your file to search in"
read file
if [ -f "$file" ]; then
	count=$(grep -o "$word" "$file" | wc -l)
	echo "Слово '$word' найдено $count раз в файле '$file'."
else
	echo "not found or err"
fi
