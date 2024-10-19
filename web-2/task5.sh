#!/bin/bash
echo "Rename files in dirname: $1"
dirname=$1
FILES=$(pwd)"/${dirname}/*"
for filename in $FILES; do
    echo $filename
    lowercase_filename=$(pwd)/${dirname}/$(basename "$filename" | tr '[:upper:]' '[:lower:]')
    echo "$lowercase_filename";
    mv $filename $lowercase_filename
    # echo "put ${filename}";
done
