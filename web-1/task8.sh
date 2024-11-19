#!/bin/bash

# Пороговое значение в процентах
THRESHOLD=80

# Получаем использование корневого раздела
USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')

# Проверяем, превышает ли использование порог
if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "Внимание: Использование диска достигло ${USAGE}%."
fi