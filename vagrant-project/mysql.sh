#!/bin/bash
DATABASE_PASS='admin123'
sudo yum update -y
sudo yum install epel-release -y
sudo yum install git zip unzip -y
sudo yum install mariadb-server -y

# Starting & enabling mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb
cd /tmp
git clone https://github.com/danielsh980/devops-projects.git

# Create the necessary database + tables using the SQL Script
sudo mysql -u root -p"$DATABASE_PASS" mylibrary < /tmp/devops-projects/mylibrary.sql

# Starting the firewall and allowing the mariadb to access from port 3306
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --get-active-zones
sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent
sudo firewall-cmd --reload
sudo systemctl restart mariadb
