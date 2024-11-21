# Servidor Docker con Angular y Apache

Este proyecto utiliza Docker para servir una aplicación Angular con Apache sobre Debian.

# Requisitos

- Docker instalado en tu máquina.

# Construir la Imagen Docker

1. Clona este repositorio:
    `git clone https://github.com/Fantasm4no/Examen_Zhigue_Erick.git`

    cd angular-app

2. Bajar la imagen de Docker:
    `docker build -t angular-docker-image .`

3. Ejecuta el contenedor mapeando el puerto 80:
    `docker run -p 80:80 angular-apache-image`

4.  Acceder a la siguiente dirección en el navegador:
    `http://localhost:80`