#!/bin/bash

echo Привет, как тебя зовут?
read NAME
echo Сколько тебе лет?
read AGE

echo Привет, $NAME! Через год тебе будет $((AGE + 1)) лет.
