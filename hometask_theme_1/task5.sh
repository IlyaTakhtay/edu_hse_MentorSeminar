#!/bin/bash
echo input dirname:
read DIRECTORY
if [ -d "$DIRECTORY"/backup ]; then
    echo "Well, backup dir exists"
else
    mkdir "$DIRECTORY"/backup
fi

for filename in "$DIRECTORY"/*; do
    if [ -f "$filename" ]; then
        cp -p $filename $(pwd)/$DIRECTORY/backup
        echo "Backup created for $filename"
    fi
done

# echo "Backup complete for $filename"