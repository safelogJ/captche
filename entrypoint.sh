#!/bin/sh

# Создаем файл для логов решения
touch /var/log/nginx/solved.log
chmod 666 /var/log/nginx/solved.log

# Запускаем Nginx в фоне
nginx

# Запускаем мониторинг лога
# Как только в solved.log появляется запись, отправляем "стук" на роутер
echo "Starting log monitor..."
tail -f /var/log/nginx/solved.log | while read line; do
    echo "Captcha solved! Signaling router..."
    # Используем порт 9999, чтобы избежать конфликта с NAT порта 443
    nc -z -w 1 192.168.88.101 9999
done
