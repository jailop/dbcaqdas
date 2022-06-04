# Utilidades de la base de datos

El script `init.sql` inicializa la base de datos:

* Crea la base de datos
* Crea un usuario y le asigna privilegios para administrar la base de datos
* Crea las tablas que conforman la base de datos

Si la base de datos existe, al ejecutar este script todo el contenido previo será eliminado.

Para inicializar la base de datos, ejecute el siguiente comando:

    $ mariadb -u root -p < init.sql
