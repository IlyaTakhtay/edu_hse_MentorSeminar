#!/bin/bash
echo "Enter filename:"
read filename

# Check if the file exists and is readable
if [ -f "$filename" ]; then
    echo "Number of lines: $(wc -l < "$filename")"
else
    echo "Error: File does not exist or cannot be read."
fi