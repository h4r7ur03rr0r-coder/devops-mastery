# Usamos la imagen base oficial de Nginx
FROM nginx:alpine

# Copiamos nuestro archivo html personalizado a la carpeta por defecto de Nginx
COPY index.html /usr/share/nginx/html/index.html

# Exponemos el puerto 80 (documentación, no hace nada por sí solo, pero es buena práctica)
EXPOSE 80