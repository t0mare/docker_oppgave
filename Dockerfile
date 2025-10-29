# Steg 1: Start med et "base image"
# Vi bruker Nginx (en lett og rask webserver) som grunnlag.
FROM nginx:latest

# Steg 2: Kopier filene våre inn i imaget
# Vi kopierer vår lokale 'index.html' til mappen der Nginx ser etter filer.
COPY index.html /usr/share/nginx/html/index.html
