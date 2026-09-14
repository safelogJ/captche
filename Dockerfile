FROM nginx:alpine

# Silence the entrypoint scripts
ENV NGINX_ENTRYPOINT_QUIET_LOGS=1

# Copy all web files
COPY index.html *.mp3 /usr/share/nginx/html/

EXPOSE 80

# Start nginx with access logs disabled and minimal error logging
CMD ["nginx", "-g", "daemon off; access_log off; error_log /dev/null crit;"]
