
DROP DATABASE pro_blog_db;

CREATE database solicode;
USE solicode;
CREATE TABLE utilisateur (
  id_utilisateur INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  prenom VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  mot_de_passe VARCHAR(50) NOT NULL
);

CREATE TABLE categorie (
  id_categorie INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(30) NOT NULL
);

CREATE TABLE article (
  id_article INT AUTO_INCREMENT PRIMARY KEY,
  titre VARCHAR(50) NOT NULL,
  contenu TEXT NOT NULL,
  date_pub DATE NOT NULL,
  statut ENUM('publier', 'draft'),
  id_utilisateur INT,
  id_categorie INT,
  FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur),
  FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie)
);

CREATE TABLE commentaire (
  id_commentaire INT AUTO_INCREMENT PRIMARY KEY,
  contenu TEXT NOT NULL,
  date_pub DATE,
  id_utilisateur INT,
  id_article INT,
  FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur),
  FOREIGN KEY (id_article) REFERENCES article(id_article)
);
ALTER TABLE utilisateur COMMENT = 'Table des utilisateurs du blog';
CREATE INDEX idx_email ON utilisateur(email);


