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
   PRIMARY KEY(code_ens)
);

CREATE TABLE matiere(
   code_mat SMALLINT AUTO_INCREMENT,
   nom_matiere VARCHAR(50) NOT NULL,
   coeff TINYINT NOT NULL,
   code_ens SMALLINT NOT NULL,
   PRIMARY KEY(code_mat),
   FOREIGN KEY(code_ens) REFERENCES enseignant(code_ens)
);

CREATE TABLE etudie(
   code_etu SMALLINT,
   code_mat SMALLINT,
   note DECIMAL(4,2),
   PRIMARY KEY(code_etu, code_mat),
   FOREIGN KEY(code_etu) REFERENCES etudiant(code_etu),
   FOREIGN KEY(code_mat) REFERENCES matiere(code_mat)
);