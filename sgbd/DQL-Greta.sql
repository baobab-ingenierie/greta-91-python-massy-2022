-- Les fondamentaux du langage de requête
-- SQL (Structured Query Language)

-- Projection : toutes les lignes et les colonnes
SELECT *
FROM greta91.etudiant
;

-- Projection : toutes les lignes et quelques colonnes
SELECT nom_etudiant, sexe
FROM greta91.etudiant
;

SELECT nom_etudiant, 
        ddn_etudiant, 
        FLOOR(DATEDIFF(NOW(), ddn_etudiant)/365.25) AS age
FROM greta91.etudiant
;

-- Sélection : lignes choisie selon critère
SELECT *
FROM greta91.matiere
WHERE (coeff >= 1) AND (coeff =< 4)
;
-- Equivaut à
SELECT *
FROM greta91.matiere
WHERE coeff BETWEEN 1 AND 4 -- inclus
;

SELECT *
FROM greta91.matiere
WHERE (coeff = 1) OR (coeff = 3) OR (coeff = 5)
;
-- Equivaut à
SELECT *
FROM greta91.matiere
WHERE coeff IN (1,3,5)
;

-- % = 0 à n caractères
-- _ = 1 et 1 seul caractère
SELECT *
FROM greta91.matiere
WHERE nom_matiere LIKE '%es%' -- contient
;

SELECT *
FROM greta91.etudiant
WHERE nom_etudiant LIKE '%e%e%'
;

SELECT *
FROM greta91.etudiant
WHERE nom_etudiant LIKE '__e%'
;

-- Jointure interne : SQL universel
SELECT nom_ens, nom_matiere, coeff
FROM greta91.matiere JOIN greta91.enseignant 
    ON enseignant.code_ens = matiere.code_ens
;
-- 
SELECT nom_ens, nom_matiere, coeff
FROM greta91.matiere JOIN greta91.enseignant 
    USING(code_ens) -- PK et FK même nom
;
-- 
SELECT nom_ens, nom_matiere, coeff
FROM greta91.matiere NATURAL JOIN greta91.enseignant 
;