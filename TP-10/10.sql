DROP DATABASE IF EXISTS site_e_commerce;

CREATE DATABASE site_e_commerce CHARACTER SET utf8mb4  COLLATE  utf8mb4_unicode_ci;

USE site_e_commerce;

CREATE TABLE articles(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT pk_articles PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE clients(
    id INT NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    CONSTRAINT pk_clients PRIMARY KEY (id)
);

CREATE TABLE orders(
    id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,
    article_id INT NOT NULL,
    quantity INT NOT NULL,
    date DATE NOT NULL,
    CONSTRAINT pk_orders PRIMARY KEY (id)
);

ALTER TABLE orders 
    ADD CONSTRAINT fk_client FOREIGN KEY (client_id) REFERENCES clients(id),
    ADD CONSTRAINT fk_article FOREIGN KEY (article_id) REFERENCES articles(id);

INSERT INTO clients (firstname, lastname) VALUES
("Brad", "PITT"),
("George", "Cloney"),
("Jean", "DUJARDIN");

INSERT INTO articles (name, price) VALUES
("PlayStation 5", 400.00),
("X box", 350.00),
("Machine à café", 300.00),
("PlayStation 3", 100.00);

INSERT INTO orders (client_id, article_id, quantity date) VALUES
(1, 4, 2, '2024-09-08 10:15:00'),
(1, 3, 1, '2024-09-08 10:15:00'),
(1, 2, 1, '2024-09-08 10:15:00');

--  Afficher la commande de Brad PITT
SELECT firstname, lastname, name, quantity, price, (quantity * price) AS "total HT"
FROM orders o
INNER JOIN clients c ON c.id = o.client_id
INNER JOIN articles a ON a.id = o.article_id
WHERE( c.firstname = "Brad" AND c.lastname = "PITT");
