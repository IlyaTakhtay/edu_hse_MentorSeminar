#!/bin/zsh

read -p "Введите имя директории для архивирования: " directory

current_datetime=$(date +"%Y-%m-%d_%H-%M-%S.%3N")
tar -czvf "backup_$current_datetime.tar.gz" "$directory"

echo "Архив успешно создан: backup_$current_datetime.tar.gz"