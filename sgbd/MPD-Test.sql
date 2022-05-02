-- Lister les BDD
SHOW databases;

-- Utilise (entre dans) la BDD
USE mysql;
SHOW tables;

-- Supprime la BDD si elle existe 
-- (en phase de test SEULEMENT)
DROP DATABASE IF EXISTS massy;

-- Crée une BDD utilisateur
CREATE DATABASE massy;

-- Crée les tables
CREATE TABLE massy.clients(
    siret CHAR(14) PRIMARY KEY,
    raison VARCHAR(100) NOT NULL,
    creation DATE
);

CREATE TABLE massy.contacts(
    id_c INT(3) AUTO_INCREMENT PRIMARY KEY,
    prenom VARCHAR(30) NOT NULL,
    tel VARCHAR(20) UNIQUE,
    photo MEDIUMBLOB,
    siret CHAR(14),
    CONSTRAINT fk_clients 
        FOREIGN KEY (siret) 
        REFERENCES massy.clients(siret)
);

-- Insère quelques clients (SQL standard)
INSERT INTO massy.clients(siret, raison)
VALUES('11111', 'Fafa la frite SARL');

INSERT INTO massy.clients(siret, raison)
VALUES('22222', 'Bobo le Choco SAS');

-- Insère quelques contacts (MySQL seulement)
INSERT INTO massy.contacts(prenom, tel, siret)
VALUES
    ('Pierre', '01 41 42 43 44', '11111'),
    ('Marie', null, '11111'),
    ('Paul', '06 44 22 33 55', '22222'),
    ('Maddy', null, null)
;

-- Check
SELECT * 
FROM massy.clients;

SELECT * 
FROM massy.contacts;