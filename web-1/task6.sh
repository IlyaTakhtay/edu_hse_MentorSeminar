#!/bin/bash

echo "Input directory name:"
read DIRECTORY

if [ ! -d "$DIRECTORY" ]; then
  echo "Error: Directory '$DIRECTORY' does not exist."
  exit 1
fi

find "$DIRECTORY" -type f -mtime +7 -delete