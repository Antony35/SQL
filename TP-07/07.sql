DROP
DATABASE IF EXISTS film_avec_acteurs;
CREATE
DATABASE film_avec_acteurs CHARACTER SET utf8mb4  COLLATE  utf8mb4_unicode_ci;

USE
film_avec_acteurs;

CREATE TABLE films
(
    id  INT          NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    CONSTRAINT pk_films PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE acteurs
(
    id     INT          NOT NULL AUTO_INCREMENT,
    prenom VARCHAR(255) NOT NULL,
    nom    VARCHAR(255) NOT NULL,
    CONSTRAINT acteurs PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE films_has_acteurs
(
    film_id   INT NOT NULL,
    acteur_id INT NOT NULL,
    CONSTRAINT films_has_acteurs PRIMARY KEY (film_id, acteur_id)
) ENGINE=InnoDB;

ALTER TABLE films_has_acteurs
    ADD CONSTRAINT fk_films FOREIGN KEY (film_id) REFERENCES films(id);
ALTER TABLE films_has_acteurs
    ADD CONSTRAINT fk_acteurs FOREIGN KEY (acteur_id) REFERENCES acteurs(id);

INSERT INTO films(nom)
VALUES ("Fight Club"),
       ("One Upon the time");

INSERT INTO acteurs(prenom, nom)
VALUES ("Brad", "PITT"),
       ("Léonardo", "DICAPRIO");

INSERT INTO films_has_acteurs(film_id, acteur_id)
VALUES (1,1),
       (2,1),
       (2,2);
SELECT
    films.nom AS film,
    acteurs.prenom,
    acteurs.nom
FROM films
         INNER JOIN films_has_acteurs  ON films.id = films_has_acteurs.film_id
         INNER JOIN acteurs ON acteurs.id = films_has_acteurs.acteur_id;

--  Afficher tous les films de Léonardo DI CAPRIO
SELECT
    films.nom AS "film",
    acteurs.prenom AS "acteur_prenom",
    acteurs.nom AS "acteur_nom"
FROM films
    INNER JOIN films_has_acteurs ON films.id = films_has_acteurs.film_id
    INNER JOIN acteurs ON acteurs.id = films_has_acteurs.acteur_id
WHERE acteurs.nom = "DICAPRIO" AND acteurs.prenom = "Leonardo";
-- WHERE acteurs.nom = "pitt" AND acteurs.prenom = "Brad";

--  Afficher le nombre de films par acteur
SELECT
    acteurs.prenom AS "acteur_prenom",
    acteurs.nom AS "acteur_nom",
    count(films.id) AS "nb_films"
FROM films
         INNER JOIN films_has_acteurs ON films.id = films_has_acteurs.film_id
         INNER JOIN acteurs ON acteurs.id = films_has_acteurs.acteur_id
GROUP BY films_has_acteurs.acteur_id;

--  Ajouter un film :TITANIC
INSERT INTO films(nom)
VALUES ("TITANIC");

-- Trouver le film qui n'a pas d'acteur
SELECT
    films.nom AS "film",
films_has_acteurs.acteur_id
FROM films
LEFT JOIN films_has_acteurs ON films.id = films_has_acteurs.film_id
WHERE films_has_acteurs.acteur_id IS NULL
;