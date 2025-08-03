# Docker compose de ejemplo #
- Contiene una imagen de Mysql para la produccion y ademas una de PhpMyAdmin para el desarrollo.
- Contiene 2 archivos con bases de datos ya inicializadas y con algunos usuarios de ejemplo.

## Como hacerlo funcionar ##
Una vez clonado, basta con construir y levantar el contenedor con 

Desarrollo
> sudo docker compose up --build -d 

se agrega -d para tenerlo de fondo
Con eso deberia de iniciarse y crearse las bases de datos si es que el archivo .env esta bien configurado. Este comando por defecto levanta el contenedor de desarrollo.


Produccion
> sudo docker compose -f docker-compose-prod.yml up --build -d 

se agrega -d para tenerlo de fondo y el -f para especificar el .yml
Con eso deberia de iniciarse y crearse las bases de datos, si bien la imagen de PhpMyAdmin no se carga, para aligerar.

### Estructura del archivo para la variables de entorno .ENV ###

---------------------------------------------------------------------------
#Al realizar cambios en el .env el Docker debera reiniciarse 

#Puerto que expone la base de datos
MYSQL_PORT=XXXX

#Puerto que expone PhpMyAdmin si es que levantamos el yml de desarrllo
PHPMYADMIN_PORT=XXXX

#Red docker en la que se comunican los contenedores
DOCKER_NETWORK=docker_network

#A que servidor apunta PhpMyAdmin
PMA_HOST=mysqlsoria

#Apunta al sql server
SQL_SERVER=mysqlsoria

#Creo la contraseña del root de la BD al iniciar el contenedor
#(No creo que sea buena practica dejar la pass, pero al ser un entorno de desarrollo no pasa nada)
#Ademas ahora mismo no conozco otra mejor forma, cualquier cosa me sugiere
MYSQL_ROOT_PASSWORD=contraseñaSegura123

#Fijo la zona horaria
TZ=America/Argentina/Buenos_Aires
---------------------------------------------------------------------------
Evidentemente son modificables, pero asi de primeras deberia de funcionar


Este es un repositorio con fines unicamente educativos y que sirve como auxiliar al desarrollo principal.