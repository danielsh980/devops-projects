#!/bin/bash

sudo apt-get update -y
sudo apt-get install python3
sudo apt-get install python3-pip -y
sudo pip3 install flask
sudo pip3 install mysql-connector-python
sudo apt-get install apache2 -y
sudo apt-get install libapache2-mod-wsgi-py3

sudo mkdir /var/www/webApp
cd /tmp
git clone -b apache-setup https://github.com/danielsh980/devops-projects.git
sudo cp -R /tmp/devops-projects/templates /var/www/webApp
sudo cp /tmp/devops-projects/app.py /var/www/webApp/app.py
sudo cp /tmp/devops-projects/app.wsgi /var/www/webApp/app/wsgi
sudo cp /tmp/devops-projects/webApp.conf /etc/apache2/sites-available/webApp.conf
sudo a2ensite webApp.conf
sudo systemctl reload apache2
