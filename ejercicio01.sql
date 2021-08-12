CREATE DATABASE IF NOT EXISTS pizzeria;

USE pizzeria;

CREATE TABLE IF NOT EXISTS ingredient (
    id BINARY(16) PRIMARY KEY,
    name varchar(255) NOT NULL UNIQUE,
    price DOUBLE NOT NULL
);

CREATE TABLE IF NOT EXISTS user (
    id BINARY(16) PRIMARY KEY,
    email varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    lastname varchar(255) NOT NULL,
    password varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pizza (
    id BINARY(16) PRIMARY KEY,
    name varchar(255) NOT NULL UNIQUE,
    url varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS comment (
    id BINARY(16) PRIMARY KEY,
    text varchar(255) NOT NULL,
    score int NOT NULL,
    date DATE NOT NULL,
    id_user BINARY(16) NOT NULL,
    id_pizza BINARY(16) NOT NULL,
    CONSTRAINT FK_user_comment FOREIGN KEY (id_user)
    REFERENCES user(id) ON DELETE CASCADE,
    CONSTRAINT FK_pizza_comment FOREIGN KEY (id_pizza)
    REFERENCES pizza(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS pizza_ingredient (
    id BINARY(16) PRIMARY KEY,
    id_pizza BINARY(16) NOT NULL,
    id_ingredient BINARY(16) NOT NULL,
    amount TINYINT DEFAULT 1,
    FOREIGN KEY (id_pizza) REFERENCES pizza(id) ON DELETE CASCADE,
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id) ON DELETE CASCADE,
    UNIQUE(id_pizza, id_ingredient)
);