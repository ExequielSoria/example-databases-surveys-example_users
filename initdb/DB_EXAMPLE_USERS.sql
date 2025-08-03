DROP DATABASE IF EXISTS DB_EXAMPLE_USERS;
CREATE DATABASE DB_EXAMPLE_USERS
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_unicode_ci;

USE DB_EXAMPLE_USERS;

-- Aseguramos que la conexión use utf8mb4 (para que lea bien el script)
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- Tabla de carreras
CREATE TABLE CAREERS (
    ID_CAREER INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL UNIQUE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Tabla de años de cursada
CREATE TABLE YEARS (
    ID_YEAR INT PRIMARY KEY,
    DESCRIPTION VARCHAR(20) NOT NULL UNIQUE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Tabla de usuarios
CREATE TABLE USERS (
    ID_USER INT AUTO_INCREMENT PRIMARY KEY,
    FIRST_NAME VARCHAR(50) NOT NULL,
    LAST_NAME VARCHAR(50) NOT NULL,
    LEGAJO VARCHAR(10) NOT NULL UNIQUE,
    DNI VARCHAR(15) NOT NULL UNIQUE,
    ID_YEAR INT NOT NULL,
    ID_CAREER INT NOT NULL,
    FOREIGN KEY (ID_YEAR) REFERENCES YEARS(ID_YEAR),
    FOREIGN KEY (ID_CAREER) REFERENCES CAREERS(ID_CAREER)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Insertar carreras
INSERT INTO CAREERS (NAME) VALUES 
('SISTEMAS'), 
('LABORATORIO'), 
('AMBIENTAL'), 
('CONTABLE');

-- Insertar años
INSERT INTO YEARS (ID_YEAR, DESCRIPTION) VALUES 
(1, 'Primer Año'), 
(2, 'Segundo Año'), 
(3, 'Tercer Año');

-- Insertar usuarios
INSERT INTO USERS (FIRST_NAME, LAST_NAME, LEGAJO, DNI, ID_YEAR, ID_CAREER) VALUES
('Ezequiel', 'Osorio', 'A001', '40123123', 1, 1),
('Omar', 'De la Sierra', 'A002', '40123124', 2, 1),
('Edith', 'Salzalar', 'A003', '40123125', 3, 1),
('Leia', 'Guarrido', 'B001', '43001989', 1, 2),
('Candelaria', 'Marceló', 'B002', '40123127', 2, 2),
('Sofía', 'Díaz', 'B003', '40123128', 3, 2),
('Augusto', 'Rathenford', 'C001', '40123129', 1, 3),
('Julián', 'Ramírez', 'C002', '40123130', 2, 3),
('Jacinthia', 'De la Sierra', 'C003', '40123131', 3, 1),
('Federico', 'Molina', 'D001', '40123132', 1, 4),
('Agustina', 'Rojas', 'D002', '40123133', 2, 4),
('Emilia', 'Sosa', 'D003', '40123134', 3, 4),
('Ivu', 'Ibarra', 'A004', '40123135', 1, 1),
('Tarama', 'Osoria', 'B004', '40123136', 2, 2),
('Ignacio', 'Cabrera', 'C004', '40123137', 3, 3);

