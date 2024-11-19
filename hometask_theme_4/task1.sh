#!/bin/bash

#1.	Создаёт список всех файлов в текущей директории, указывая их тип (файл, каталог и т.д.).
#2.	Проверяет наличие определённого файла, переданного как аргумент скрипта, и выводит сообщение о его наличии или отсутствии.
#3.	Использует цикл for для вывода информации о каждом файле: его имя и права доступа.


if [ -z "$1" ]; then
  echo "Usage: ./$0 <имя_файла_для_проверки>"
  exit 1
fi

file_to_check="$1"
if [ -e "$file_to_check" ]; then
  echo "Файл '$file_to_check' существует."
else
  echo "Файл '$file_to_check' не найден."
fi

echo "Информация о каждом файле:"
for file in *; do
  permissions=$(stat -c "%A" "$file")
  if [ -f "$file" ]; then
    echo "$file - файл, доступ - $permissions"
  elif [ -d "$file" ]; then
    echo "$file - каталог, доступ - $permissions"
  elif [ -L "$file" ]; then
    echo "$file - символическая ссылка, доступ - $permissions"
  else
    echo "$file - другой тип файла, доступ - $permissions"
  fi
done