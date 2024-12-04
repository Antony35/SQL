DROP DATABASE IF EXISTS customer_relationship_management;
CREATE DATABASE customer_relationship_management CHARACTER SET utf8mb4  COLLATE  utf8mb4_unicode_ci;

USE customer_relationship_management;

CREATE TABLE clients (
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    CONSTRAINT pk_clients PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE projects (
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255),
    client_id INT NOT NULL,
    CONSTRAINT pk_projects PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE devis (
    ref_devis CHAR(20) NOT NULL,
    version_devis CHAR(5) NOT NULL,
    montant INT NOT NULL,
    project_id INT,
    ref_facture CHAR(20),
    CONSTRAINT pk_devis PRIMARY KEY (ref_devis)
) ENGINE = InnoDB;

CREATE TABLE factures (
    ref_facture CHAR(20),
    info VARCHAR(255),
    total INT,
    creation_date DATE,
    paiment_date DATE,
    CONSTRAINT pk_factures PRIMARY KEY (ref_facture)
) ENGINE = InnoDB;

ALTER TABLE projects ADD CONSTRAINT fk_projects_clients FOREIGN KEY (client_id) REFERENCES clients(id);
ALTER TABLE devis 
    ADD CONSTRAINT fk_devis_project FOREIGN KEY (project_id) REFERENCES projects(id),
    ADD CONSTRAINT fk_devis_facture FOREIGN KEY (ref_facture) REFERENCES factures(ref_facture);

INSERT INTO clients (nom) VALUES
("Mairie de Rennes"),
("Neo Soft"),
("Sopra"),
("Accenture"),
("Amazon");

INSERT INTO projects (nom, client_id) VALUES
("Creation de site internet", 1),
("Logiciel CRM", 2),
("Logiciel de devis", 3),
("Site internet ecommerce", 4),
("logiciel ERP", 2),
("logiciel Gestion de Stock", 5);


INSERT INTO factures (ref_facture, info, total, creation_date, paiment_date) VALUES
("FA001", "Site internet partie 1", 1500, "2023-09-01", "2023-10-01"),
("FA002", "Site internet partie 2", 1500, "2023-09-20", NULL),
("FA003", "Logiciel CRM", 5000, "2024-02-01", NULL),
("FA004", "Logiciel devis", 3000, "2024-03-03", "2024-04-03"),
("FA005", "Site internet ecommerce", 5000, "2023-03-01", NULL),
("FA006", "logiciel ERP", 2000, "2023-03-01", NULL);


INSERT INTO devis (ref_devis, version_devis, montant, project_id, ref_facture) VALUES
("DEV2100A", 1, 3000, 1, "FA001"),
("DEV2100B", 2, 5000, 1, NULL),
("DEV2100C", 1, 5000, 2, "FA003"),
("DEV2100D", 1, 3000, 3, "FA004"),
("DEV2100E", 1, 5000, 4, "FA005"),
("DEV2100F", 1, 2000, 5, "FA006"),
("DEV2100G", 1, 1000, 6, NULL);

-- 1️⃣ Afficher toutes les factures avec le nom des clients
SELECT f.ref_facture, c.nom, info, total, creation_date, paiment_date
FROM factures f
INNER JOIN devis d ON d.ref_facture = f.ref_facture
INNER JOIN projects p ON p.id = d.project_id
INNER JOIN clients c ON c.id = p.client_id
ORDER BY f.ref_facture;

-- 2️⃣ Afficher le nombre de factures par client
-- Afficher 0 factures si il n'y a pas de factures
SELECT c.nom, COUNT(f.ref_facture) AS nb_factures
FROM clients c
INNER JOIN projects p ON p.client_id = c.id
INNER JOIN devis d ON d.project_id = p.id
LEFT JOIN factures f ON f.ref_facture = d.ref_facture
GROUP BY nom;

-- 3️⃣ Afficher le chiffre d'affaire par client
SELECT c.nom, SUM(montant)
FROM clients c
INNER JOIN projects p ON p.client_id = c.id
INNER JOIN devis d ON d.project_id = p.id
GROUP BY c.nom;

-- 4️⃣ Afficher le CA total
SELECT SUM(total) AS ca_total
FROM factures;

-- 5️⃣ Afficher la somme des factures en attente de paiement
SELECT SUM(total) AS ca_total
FROM factures;
WHERE IFNULL(paiment_date); 