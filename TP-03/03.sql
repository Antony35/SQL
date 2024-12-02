DROP DATABASE IF EXISTS zoo;
CREATE DATABASE zoo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE zoo;
CREATE TABLE chats(
                      id INTEGER NOT NULL AUTO_INCREMENT,
                      nom VARCHAR(255) NOT NULL,
                      yeux VARCHAR(255) NOT NULL,
                      age INT NOT NULL,
                      CONSTRAINT pk_chats PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO chats(nom, yeux, age)
VALUES
    ("Maine coon", "marron", 20),
    ("Siamois", "bleu", 15),
    ("Bengal", "marron", 18),
    ("Scottish Fold", "marron", 10);

-- Afficher le chat avec l'id :2
SELECT id AS "identifiant", nom, yeux, age FROM chats WHERE id = 2;

-- Trier les chats par nom
SELECT id AS "identifiant", nom, yeux, age FROM chats ORDER BY nom ASC;

-- Trier les chats par age
SELECT id AS "identifiant", nom, yeux, age FROM chats ORDER BY age ASC;

-- Afficher les chats qui vive entre 11 et 19 ans
SELECT id AS "identifiant", nom, yeux, age FROM chats WHERE age BETWEEN 11 AND 19;

-- Afficher le ou les chats dont le nom contient 'sia'
SELECT id AS "identifiant", nom, yeux, age FROM chats WHERE nom LIKE "%sia%"

-- Afficher le ou les chats dont le nom contient 'a'
SELECT id AS "identifiant", nom, yeux, age FROM chats WHERE nom LIKE "%a%"

-- Afficher la moyenne d'age des chats
SELECT AVG(age) AS "moyen d'age" FROM chats;

-- Afficher le nombre de chats dans la table
SELECT COUNT(id) AS "nombre de chat" FROM chats;

-- Afficher le nombre de chat avec couleur d'yeux marron
SELECT id AS "identifiant", nom, yeux, age FROM chats WHERE yeux = "marron";

-- Afficher le nombre de chat par couleur d'yeux
SELECT yeux AS "couleur d'yeux", COUNT(id) AS "nombre de chat" FROM chats GROUP BY yeux;