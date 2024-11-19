#!/bin/bash

# Создайте скрипт с функцией, которая принимает в качестве аргумента строку и выводит её с префиксом "Hello, ". 
#Напишите ещё одну функцию, которая принимает два числа и возвращает их сумму. Вызовите обе функции в скрипте и продемонстрируйте результат.
# if [ -z $1 ]; then
#     echo "Usage ./$0 <filename>"
#     exit 1
# if
prefix_hello () {
    echo "Hello $1"
}

add_two_num(){
    local sum=$(($1+$2))
    echo sum of $1 and $2 is $sum
}

prefix_hello "Yolo man" 

add_two_num '2' '3'