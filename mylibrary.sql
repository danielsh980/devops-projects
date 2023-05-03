CREATE DATABASE mylibrary;

USE mylibrary;

CREATE TABLE books (
    id INT(11) NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);