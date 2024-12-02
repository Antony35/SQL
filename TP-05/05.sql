DROP
DATABASE IF EXISTS spa;
CREATE
DATABASE spa CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE
spa;
CREATE TABLE chats
(
    id        INT      NOT NULL AUTO_INCREMENT,
    nom       VARCHAR(255) NOT NULL,
    age       INT          NOT NULL,
    region_id INT,
    CONSTRAINT pk_chats PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE couleurs
(
    id  INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255),
    CONSTRAINT pk_couleurs PRIMARY KEY (id)
) ENGINE=InnoDB;

ALTER TABLE chats
    ADD
        CONSTRAINT fk_chats_couleurs FOREIGN KEY (region_id) REFERENCES couleurs (id);

INSERT INTO couleurs(nom)
VALUES ("marron"),
       ("bleu"),
       ("vert");

INSERT INTO chats(nom, age, region_id)
VALUES ("maine coon", 20, 1),
       ("siamois", 15, 2),
       ("bengal", 18, 1),
       ("scottish fold", 10, 1),
       ("domestique", 21, null);
