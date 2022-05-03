-- Création de la BDD
DROP DATABASE IF EXISTS greta91;
CREATE DATABASE greta91;
USE greta91;

-- Création des tables
-- Collées directement de Looping !
CREATE TABLE etudiant(
   code_etu SMALLINT AUTO_INCREMENT,
   nom_etudiant VARCHAR(30) NOT NULL,
   ddn_etudiant DATE,
   sexe ENUM('M','F','N'),
   tel VARCHAR(15),
   PRIMARY KEY(code_etu),
   UNIQUE(tel)
);

CREATE TABLE enseignant(
   code_ens SMALLINT AUTO_INCREMENT,
   nom_ens VARCHAR(30) NOT NULL,
   grade TINYINT,
   date_entree DATE,
   PRIMARY KEY(code_ens),
   CONSTRAINT ck_grade CHECK(grade BETWEEN 1 AND 4)
);

CREATE TABLE greta91.matiere(
   code_mat SMALLINT AUTO_INCREMENT,
   nom_matiere VARCHAR(50) NOT NULL,
   coeff TINYINT NOT NULL,
   code_ens SMALLINT NOT NULL,
   PRIMARY KEY(code_mat),
   FOREIGN KEY(code_ens) 
   REFERENCES greta91.enseignant(code_ens),
   CONSTRAINT ck_coeff CHECK(coeff BETWEEN 1 AND 7)
);

CREATE TABLE etudie(
   code_etu SMALLINT,
   code_mat SMALLINT,
   note DECIMAL(4,2),
   PRIMARY KEY(code_etu, code_mat),
   FOREIGN KEY(code_etu) REFERENCES etudiant(code_etu),
   FOREIGN KEY(code_mat) REFERENCES matiere(code_mat)
);

-- Ajout data dans ETUDIANT
INSERT INTO etudiant(nom_etudiant,ddn_etudiant,sexe)
VALUES
    ('Amani', '2000-12-06', 'F'),
    ('Mounib', '1983-11-12', 'M'),
    ('Marc', '1988-06-07', 'M'), -- Paie son coup
    ('Romain', '1987-05-10', 'M'), -- Paie son coup 2x
    ('Jérôme', '1980-07-06', 'M'),
    ('Manuel', '1976-11-21', 'M'),
    ('Edwin', '2000-01-15', 'M'),
    ('Michaël', '1978-10-31', 'M'),
    ('Amandine', '2000-05-08', 'F'), -- Paie son coup le 9
    ('Aurélien', '1990-05-03', 'M'), -- Poueeeeeet
    ('Stéphane', '2001-04-21', 'M'),
    ('Marie-Sylvie', '2000-03-04', 'F')
;

-- Ajoute data dans ENSEIGNANT
INSERT INTO enseignant(nom_ens, grade, date_entree)
VALUES
    ('Cédric', 2, '2019-10-14'),
    ('Boussad', 4, '1998-07-12'),
    ('Adrien', 3, '2007-05-15'),
    ('Viviane', 3, '2010-01-06'),
    ('Lesly', 4, '1994-04-20')
;

-- Ajoute data dans MATIERE
INSERT INTO matiere(nom_matiere, coeff, code_ens)
VALUES
    ('Les bases du Web', 2, 5),
    ('Maths et Algo', 3, 2),
    ('Conception/Programmation Python', 4, 1),
    ('TRE', 1, 4),
    ('Projet Python', 5, 1),
    ('Big Data', 3, 3),
    ('Bases de données SQL', 3, 5)
;

-- Importe la data dans ETUDIE 
-- à partir d'un fichier CSV
LOAD DATA INFILE 'D:/Apps/uwamp/www/massy/sgbd/MPD-Matiere.csv'
INTO TABLE greta91.etudie
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
;