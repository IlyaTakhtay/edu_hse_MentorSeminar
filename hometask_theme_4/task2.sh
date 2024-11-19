#!/bin/bash

#1.	Напишите скрипт, который выводит текущее значение переменной PATH и добавляет в неё новую директорию, переданную в качестве аргумента.
#2.	Объясните, почему изменения переменной PATH, сделанные через терминал, временные, и предложите способ сделать их постоянными. 
#Добавьте команду в файл .bashrc и продемонстрируйте, как перезапустить терминал для применения изменений

if [ -z "$1" ]; then
    echo "Usage ./$0 <filename>"
    exit 1
fi

export PATH="$PATH/$1"

echo "$PATH"

# Изменения переменной PATH поскольку работают только для текущей сесси терминала, и не сохранятся для другого окна терминала или при перезанрузке.
# Для сохранения изменений навсегда требуется:
# nano ~/.bashrc
# добавить в конец файла команду export PATH=$PATH:/my_path
# таким образом она будет применяться для каждого открытого терминала
# для примения изменений можно использовать команду source ~/.bashrc, в таком слаче перезапуск терминала не потребуется.