#!/bin/bash
echo "Введите длину"
read count

result=$(openssl rand -base64 "$count" | tr -dc A-Za-z0-9 | head -c "$count")


echo "$result"