#!/bin/bash

number1=$1
number2=$2

add() {
    result=$((number1 + number2))
    echo $result
}

add