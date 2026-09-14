FROM nginx:alpine

# Copy all web files in one layer to minimize storage operations
COPY index.html *.mp3 /usr/share/nginx/html/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
