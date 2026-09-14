FROM nginx:alpine

# Устанавливаем netcat для отправки сигналов
RUN apk add --no-cache netcat-openbsd

# Копируем файлы
COPY index.html *.mp3 /usr/share/nginx/html/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Настраиваем Nginx так, чтобы он писал лог только для /solved
RUN echo 'server { \
    listen 80; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html; \
    } \
    location /solved { \
        access_log /var/log/nginx/solved.log; \
        return 200 "OK"; \
    } \
    access_log off; \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
