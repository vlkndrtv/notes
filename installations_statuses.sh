#!/bin/bash

MYSQL_HOST="${MYSQL_HOST}"
MYSQL_DATABASE="${MYSQL_DATABASE}"
MYSQL_USER="${MYSQL_USER}"
MYSQL_PASSWORD="${MYSQL_PASSWORD}"

LOG_FILE="./installations_statuses.log"

QUERY="UPDATE installations SET status = 3 WHERE date_expire < CURDATE();"

mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" -e "$QUERY"

if [ $? -ne 0 ]; then
  echo "$(date) - Ошибка выполнения SQL-запроса!" >> "$LOG_FILE"
  exit 1
else
  echo "$(date) - Успешно обновлено!" >> "$LOG_FILE"
fi

exit 0