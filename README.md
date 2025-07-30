
# Configuración de Contenedores para Odoo 18 y PostgreSQL

Este repositorio contiene la configuración para levantar contenedores de **Odoo 18** y **PostgreSQL** usando Docker. Sigue las instrucciones a continuación para configurar el entorno y ejecutar los contenedores.

## Requisitos

Para ejecutar los contenedores, asegúrate de tener instalados los siguientes programas:

1. **Docker**: Herramienta para ejecutar contenedores. Descárgala e instálala desde [Docker](https://www.docker.com/get-started).
2. **Docker Compose**: Herramienta para definir y ejecutar aplicaciones multicontenedor. En la mayoría de instalaciones modernas, Docker Compose viene incluido con Docker Desktop, pero también se puede instalar por separado si usas Docker en Linux.

### Instalación de Docker y Docker Compose

#### En Windows o macOS
1. Descarga **Docker Desktop** desde la página oficial de Docker: [Docker Desktop](https://www.docker.com/products/docker-desktop).
2. Sigue las instrucciones de instalación en la página de Docker. Asegúrate de habilitar **Docker Compose** durante la instalación.

#### En distribuciones Linux
1. Sigue las instrucciones de instalación en la página de Docker. Acuerdate de elegir primero el repositorio en base a tu distribución: [Docker Compose](https://docs.docker.com/compose/install/linux/)

## Uso

### 1. Clona el Repositorio actual
Clona este repositorio en tu máquina local e ingresa a la carpeta del proyecto:

```bash
git clone https://github.com/acostamatt/odoo-docker.git
cd odoo-docker
```

### 2. Clona el Repositorio odoo de la versión 18
Clona en tu máquina local el repositorio oficial de Odoo para poder tener ecceso a su código fuente.
En éste momento la que está por defecto la versión 18.

```bash
git clone https://github.com/odoo/odoo.git
```

### 3. Levanta los Contenedores

Para iniciar los contenedores de Odoo y PostgreSQL, ejecuta:

```bash
./run.sh
```

Esto iniciará los contenedores en segundo plano.

### 3. Acceso a Odoo

Una vez que los contenedores estén levantados, puedes acceder a Odoo desde tu navegador web en la siguiente dirección:

```plaintext
http://localhost:8069
```
### 4. Dar de baja los contenedores

```bash
docker compose down -v
```
Esto eliminará los contenedores de Odoo y PostgreSQL, pero conservará la base de datos, configuraciones de Odoo, módulos y logs.

## Solución de Problemas Comunes

1. **Permisos de Docker en Linux**: Si recibes un error de permisos al ejecutar Docker, intenta agregar tu usuario al grupo `docker`:

   ```bash
   sudo usermod -aG docker $USER
   ```

   Luego cierra sesión y vuelve a iniciar sesión para que los cambios surtan efecto.

2. **Problemas con el puerto 8069**: Si el puerto 8069 está en uso, puedes cambiarlo en el archivo `docker-compose.yml`.
