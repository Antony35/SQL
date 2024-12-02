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

ALTER TABLE personnes
RENAME TO inv_personnes;