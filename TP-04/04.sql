DROP DATABASE IF EXISTS invitation;
CREATE DATABASE invitation CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE invitation;
CREATE TABLE personnes(
                          id INTEGER NOT NULL AUTO_INCREMENT,
                          prenom VARCHAR(255) NOT NULL,
                          nom VARCHAR(255) NOT NULL,
                          age INT NOT NULL,
                          inscription DATE NOT NULL,
                          etat TINYINT NOT NULL,
                          status ENUM("non membre", "membre") NOT NULL,
                          cv TEXT,
                          salaire INT NOT NULL,
                          CONSTRAINT pk_chats PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO personnes(prenom, nom, age, inscription, etat, status, cv, salaire)
VALUES
    ("Brad", "PITT", 60, '1970-01-01', 1, "non membre", "lorem ipsum", 2000000),
    ("George", "CLONEY", 62, '1999-01-01', 1, "membre", "juste beau", 4000000),
    ("Jean", "DUJARDIN", 51, '1994-01-01', 0, "membre", "brice de nice", 1000000);

-- Afficher le plus gros salaire (avec MAX)
SELECT MAX(salaire) AS "plus_gros_salaire" FROM personnes;

-- Afficher le plus petit salaire (avec MIN)
SELECT MIN(salaire) AS "plus_petit_salaire" FROM personnes;

-- Afficher le nom de l'acteur (et son salaire) qui a le plus petit salaire avec LIMIT & ORDER BY
SELECT prenom, nom, salaire FROM personnes ORDER BY salaire ASC LIMIT 1;

-- Afficher le nom de l'acteur (et son salaire) qui a le plus gros salaire avec LIMIT & ORDER BY
SELECT prenom, nom, salaire FROM personnes ORDER BY salaire DESC LIMIT 1;

-- Afficher le salaire moyen
SELECT AVG(salaire) AS "salaire_moyen" FROM personnes;

-- Afficher le nombre de personnes
SELECT count(id) AS "nb_personnes" FROM personnes;

-- Afficher les acteurs avec un salaire entre 1 000 000 et 4 000 000 avec BETWEEN
SELECT prenom, nom, salaire FROM personnes WHERE salaire BETWEEN 1000000 AND 4000000;

-- Proposer une requete avec UPPER() & LOWER()
SELECT UPPER(prenom), LOWER(nom) FROM personnes;

-- Afficher les personnes dont le prenom contient 'bra'
SELECT prenom FROM personnes WHERE prenom LIKE "%bra%";

-- Trier par age les membres
SELECT prenom, nom, age FROM personnes ORDER BY age ASC;

-- Afficher le nombre d'acteurs "membre"
SELECT count(id) AS "nb_membres" FROM personnes WHERE status = "membre";

--  Afficher le nombre des membres et des non membres
SELECT status, COUNT(id) AS "nb_acteur" FROM personnes GROUP BY status;