DROP
DATABASE IF EXISTS netflix;
CREATE
DATABASE netflix CHARACTER SET utf8mb4 COLLATE  utf8mb4_unicode_ci;

USE
netflix;

CREATE TABLE films
(
    id          INT          NOT NULL AUTO_INCREMENT,
    titre       VARCHAR(255) NOT NULL,
    sortie      DATE         NOT NULL,
    category_id INT,
    CONSTRAINT pk_films PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE categories
(
    id  INT          NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    CONSTRAINT ph_categories PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO categories(nom)
VALUES ("Sciences Fiction"),
       ("Thriller");

ALTER TABLE films ADD CONSTRAINT fk_film_categories FOREIGN KEY (category_id) REFERENCES categories(id);

INSERT INTO films(titre, sortie, category_id)
VALUES ("STAR WARS", '1977-05-25', 1),
       ("THE MATRIX", '1999-06-23', 1),
       ("PULP FICTION", '1994-10-26', 2),

-- Prise en main de INNER JOIN (affiche que les entrer avec une category_id)
SELECT titre, sortie, nom
FROM films
         INNER JOIN categories ON films.category_id = categories.id;

-- Prise en main de LEFT JOIN (affiche tout les entrer de la table de droite)
SELECT titre, sortie, nom
FROM films
         LEFT JOIN categories ON films.category_id = categories.id;
