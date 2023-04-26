-- Get user password
SELECT user,authentication_string,plugin,host FROM mysql.user;

-- List table column names
SHOW COLUMNS FROM table_name;

-- Change user password
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

-- Create database
CREATE DATABASE itsp;

-- Create table
CREATE TABLE `itsp`.`alumnos` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(45) NOT NULL,
    `apellido` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
);
