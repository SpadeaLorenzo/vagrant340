#!/bin/bash

# Update the system packages
sudo apt-get update

# Install MariaDB Server
sudo apt-get install -y mariadb-server

# Secure the MariaDB installation
sudo mysql_secure_installation

# Log in to MariaDB and create a database
sudo mysql -e "CREATE DATABASE flask_test;"

# Create a new user for remote access
sudo mysql -e "CREATE USER 'flask_admin'@'%' IDENTIFIED BY 'Password&1';"
sudo mysql -e "GRANT ALL PRIVILEGES ON flask_test.* TO 'flask_admin'@'%' WITH GRANT OPTION;"
sudo mysql -e "FLUSH PRIVILEGES;"

# Allow remote access to the MariaDB server
sudo sed -i "s/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo sed -i "s/mysqlx-bind-address\s*=\s*127.0.0.1/mysqlx-bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
# Restart MariaDB service
sudo service mariadb restart

# Execute the SQL script
sudo mysql -u flask_admin -p'Password&1' < /home/vagrant/myapp/setup_db.sql
