#!/bin/bash

# Update the system packages
sudo apt-get update

# Install MySQL Server
sudo apt-get install -y mysql-server

# Secure the MySQL installation
sudo mysql_secure_installation

# Log in to MySQL and create a database 
sudo mysql -e "CREATE DATABASE flask_test;"

# Create a new user for remote access 
sudo mysql -e "CREATE USER 'flask_admin'@'%' IDENTIFIED BY 'Password&1';"
sudo mysql -e "GRANT ALL PRIVILEGES ON flask_test.* TO 'flask_admin'@'%' WITH GRANT OPTION;"
sudo mysql -e "FLUSH PRIVILEGES;"

# Allow remote access to the MySQL server 
sudo sed -i 's/10.10.20.11/bind_address/g' /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart MySQL service
sudo service mysql restart

# Log in to MySQL with the new user
mysql -u flask_admin -p'Password&1' -e "flask_test"

# Create a table and insert some data
mysql -u flask_admin -p'Password&1' -e "USE flask_test; \
                                       CREATE TABLE test (id INT PRIMARY KEY, name VARCHAR(255)); \
                                       INSERT INTO test (id, name) VALUES (1, 'John'), (2, 'Jane'), (3, 'Bob');"
