#!/bin/bash
#Создайте скрипт, который выполняет следующие действия:
# 1.	Читает данные из файла input.txt.
# 2.	Перенаправляет вывод команды wc -l (подсчет строк) в файл output.txt.
# 3.	Перенаправляет ошибки выполнения команды ls для несуществующего файла в файл error.log.

exec 2>> error.log

cat < $1 >&2 
if [[ -f $1 ]]; then
    wc -l < $1 > output.txt
    echo "Результат подсчета строк записан в output.txt."
else
    echo "Файл $1 не найден, подсчет строк невозможен."
fi