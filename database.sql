CREATE DATABASE pro_blog_db;
USE pro_blog_db;

CREATE TABLE utilisateur (
id_utilisateur int primary key auto_increment ,
nom varchar(50) not null,
prenom varchar(50) not null,
email varchar(100) not null unique,
mot_de_passe varchar(50) not null
);


CREATE TABLE categorie (
id_categorie int primary key auto_increment,
nom varchar(30) not null
);

create table commentaire(
id_commentaire int primary key auto_increment,
contenu text not null,
date_pub date,
id_utilisateur int,
foreign key (id_utilisateur) references utilisateur(id_utilisateur)
);

create table article (
id_article int auto_increment primary key,
titre varchar(50) not null,
contenu text not null,
date_pub date not null,
statut enum ('publier, draft'),
id_utilisateur int,
foreign key (id_utilisateur) references utilisateur(id_utilisateur),
id_categorie int,
foreign key (id_categorie) references categorie (id_categorie),
id_commentaire int,
foreign key (id_commentaire) references commentaire(id_commentaire)
);
alter table utilisateur add index (email);
alter table utilisateur comment = 'id_utilisateur';