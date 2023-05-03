#!/bin/bash

sudo yum update -y
sudo yum install mariadb-server -y

sudo systemctl start mariadb
sudo systemctl enable mariadb