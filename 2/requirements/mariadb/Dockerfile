FROM debian:buster

# Install MariaDB server
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the custom MariaDB configuration file
COPY mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the initialization script and make it executable
COPY auto_config.sh /auto_config.sh
RUN chmod +x /auto_config.sh

RUN rm -f /var/lib/mysql/ib*

# Expose the MySQL port
EXPOSE 3306

# Use the initialization script as the entrypoint
ENTRYPOINT ["/auto_config.sh"]
