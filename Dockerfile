# Usar Debian como imagen base
FROM debian:latest

# Instalar dependencias
RUN apt-get update && apt-get install -y \
    apache2 \
    curl \
    git \
    build-essential \
    && apt-get clean

# Instalar Node.js (versión 18.x compatible con Angular CLI)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g @angular/cli

# Crear el directorio de trabajo para Angular
WORKDIR /var/www/angular-app

# Copiar todo el contenido del proyecto Angular al contenedor
COPY . /var/www/angular-app/

# Construir la aplicación Angular
RUN npm install && ng build --configuration production --output-path=/var/www/html

# Configurar Apache para servir Angular
RUN echo '<VirtualHost *:80>\n\
    DocumentRoot /var/www/html\n\
    <Directory /var/www/html>\n\
        Options Indexes FollowSymLinks\n\
        AllowOverride All\n\
        Require all granted\n\
    </Directory>\n\
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

# Exponer el puerto 80
EXPOSE 80

# Comando para iniciar Apache
CMD ["apache2ctl", "-D", "FOREGROUND"]
