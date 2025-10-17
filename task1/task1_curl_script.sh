#!/bin/bash

#оголошуємо масив з URL вебсайтів, які потрібно перевірити
urls=("https://www.google.com" "https://facebook.com" "https://twitter.com" "https://www.google.com/nonexistent-page")

#проходимося по кожному URL в масиві
for url in "${urls[@]}"
do
  # виконуємо curl запит і отримуємо HTTP статус-код, -L слідує за редиректами, -s робить запит тихим, -o /dev/null відкидає вивід
  http_status=$(curl -s -L -o /dev/null -w "%{http_code}" "$url")

  # перевірка HTTP статус-коду, результат перевірки записаний у файл логів website_status.log
  if [ "$http_status" -eq 200 ]; then
    echo "$(date): $url is UP" >> website_status.log
  else
    echo "$(date): $url is DOWN (HTTP $http_status)" >> website_status.log
  fi
done

# вивід інформації про завершення скрипту
echo "Результати перевірки доступності вебсайтів записано у файл website_status.log"