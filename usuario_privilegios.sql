-- Antes de crear un usuario, debemos crear un espacio en el que se guardará todo lo que ese usuario haga:
CREATE TABLESPACE <NAME_T>
DATAFILE '<PATH>/<NAME>.dbf'
SIZE <SIZE>;
    -- NAME_T: Nombre del TABLESPACE
    -- PATH: Direccion donde se creara el archivo TABLESPACE
    -- NAME: Nombre del archivo TABLESPACE (es el archivo que vamos a ver)
    -- SIZE: Tamaño del archivo TABLESPACE (en bytes).

-- Para crear a un usuario, la forma de hacerlo es la siguiente:
CREATE USER <NAME_USER> IDENTIFIED BY <PASSWORD>
DEFAULT TABLESPACE <TABLESPACE>;
    -- NAME: Nombre del usuario
    -- PASSWORD: Contraseña del usuario
    -- TABLESPACE: Nombre del TABLESPACE que se le asignará al usuario. Si no se le asigna ningún TABLESPACE, se le asignará el TABLESPACE por defecto.

-- Sin embargo, hasta este momento nuestro nuevo usuario no podrá iniciar sesión. Para permitirlo, debemos hacer lo siguiente:
GRANT CREATE SESSION TO <NAME_USER>;
    -- NAME_USER: Nombre del usuario que queremos permitir iniciar sesión.

-- Para eliminar a un usuario, debemos hacer lo siguiente:
DROP USER <NAME_USER>;
    -- NAME_USER: Nombre del usuario que queremos eliminar.

-- Ahora el usuario puede iniciar sesión, pero no puede ver, crear tablas o hacer cualquier cosa dentro de la base de datos. Debemos otorgarle privilegios:
GRANT CREATE TABLE TO <NAME_USER>; -- Permite al usuario crear tablas.
GRANT CREATE SEQUENCE TO <NAME_USER>; -- Permite al usuario crear secuencias.
GRANT CREATE TRIGGER TO <NAME_USER>; -- Permite al usuario crear triggers.
GRANT CREATE VIEW TO <NAME_USER>; -- Permite al usuario crear vistas.
GRANT CREATE INDEX TO <NAME_USER>; -- Permite al usuario crear índices.
GRANT CREATE PROCEDURE TO <NAME_USER>; -- Permite al usuario crear procedimientos.
GRANT CREATE PACKAGE TO <NAME_USER>; -- Permite al usuario crear paquetes.
GRANT CREATE PACKAGE BODY TO <NAME_USER>; -- Permite al usuario crear paquetes.
GRANT CREATE SEQUENCE TO <NAME_USER>; -- Permite al usuario crear secuencias.
GRANT CREATE SYNONYM TO <NAME_USER>; -- Permite al usuario crear sinonimos.
GRANT CREATE TABLE TO <NAME_USER>; -- Permite al usuario crear tablas.

-- Si quisieramos asignarle todos (darle privilegios de administrador, que son más que los presentados anteriormente), usamos la siguiente instrucción:
GRANT ALL PRIVILEGES TO <NAME_USER>;
    
-- En caso de querer quitar privilegios a un usuario, utilizamos la siguiente instruccion:
REVOKE <PRIVILEGE> TO <NAME_USER>;
    -- PRIVILEGE: Privilegio que queremos quitarle al usuario. Puede ser 'CREATE TABLE', 'CREATE SEQUENCE', 'CREATE TRIGGER', 'CREATE VIEW', 'CREATE INDEX', 'CREATE PROCEDURE', 'CREATE PACKAGE', 'CREATE PACKAGE BODY', 'CREATE SYNONYM', 'CREATE TABLE' o 'CREATE SESSION'.

-- Aunque la manera de asignar privilegios es correcta, no es la mejor, una forma más eficiente es por medio de roles.
-- Los roles son un conjunto de privilegios que se le asignan a un usuario. De esta forma solo debemos darle el rol a un usuario y no asignar uno por uno cada privilegio.
-- Para crear un rol, debemos hacer lo siguiente:
CREATE ROLE <NAME_ROLE>;
    -- NAME_ROLE: Nombre del rol que queremos crear.

-- De la misma forma en la que le damos privilegios a un usuario, debemos darle privilegios a un rol:
GRANT <PRIVILEGE> TO <NAME_ROLE>;

-- Para quitar privilegios a un rol, debemos hacer lo siguiente:
REVOKE <PRIVILEGE> FROM <NAME_ROLE>;
    -- PRIVILEGE: Privilegio que queremos quitarle al rol. Puede ser 'CREATE TABLE', 'CREATE SEQUENCE', 'CREATE TRIGGER', 'CREATE VIEW', 'CREATE INDEX', 'CREATE PROCEDURE', 'CREATE PACKAGE', 'CREATE PACKAGE BODY', 'CREATE SYNONYM', 'CREATE TABLE' o 'CREATE SESSION'.

-- Para asignarle un rol a un usuario, debemos hacer lo siguiente:
GRANT <NAME_ROLE> TO <NAME_USER>;
    -- NAME_USER: Nombre del usuario que queremos darle un rol.
    -- NAME_ROLE: Nombre del rol que vamos a asignar.

-- Podemos eliminar a un rol:
DROP ROLE <NAME_ROLE>;

-- Todas las instrucciones anteriores deben ser realizadas en el usuario administrador (por ejemplo, SYSTEM). 