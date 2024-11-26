#!/bin/sh

# Validar que las variables no estén vacías
if [ -z "$MYSQL_DATABASE" ] || [ -z "$MYSQL_USER" ] || [ -z "$MYSQL_PASSWORD" ] || [ -z "$MYSQL_ROOT_PASSWORD" ]; then
    echo "Error: Algunas variables de entorno están vacías."
    exit 1
fi

# Esperar a que MariaDB esté listo
until mysqladmin ping -h localhost --silent; do
    echo "Esperando a que MariaDB esté listo..."
    sleep 2
done

# Crear el archivo SQL
cat << EOF > /tmp/config.sql
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

# Mostrar el contenido del archivo SQL para depuración
echo "Contenido de /tmp/config.sql:"
cat /tmp/config.sql

# Ejecutar el archivo SQL
mysql -u root -p"$MYSQL_ROOT_PASSWORD" < /tmp/config.sql
