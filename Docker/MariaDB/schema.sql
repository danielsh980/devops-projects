CREATE USER `admin`@`localhost` IDENTIFIED BY `admin123`;
CREATE USER `admin`@`%` IDENTIFIED BY `admin123`;

DROP DATABASE IF EXISTS `mylibrary`;
CREATE DATABASE `mylibrary`;

GRANT ALL ON *.* TO `admin`@`localhost` IDENTIFIED BY `admin123`;
GRANT ALL ON *.* TO `admin`@`%` IDENTIFIED BY `admin123`;
FLUSH PRIVILEGES;

USE mylibrary;

DROP TABLE IF EXISTS `books`;
CREATE TABLE books (
    id INT(11) NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
