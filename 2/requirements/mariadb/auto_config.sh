#!/bin/sh

# Start the MariaDB service
service mysql start
sleep 5  # Give time for the service to initialize

# Set up the root password and create a user and database if they don't exist
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"

# Stop the MariaDB service before the container exits
service mysql stop

# Run the MariaDB server with custom configuration
exec mysqld --bind-address=0.0.0.0
