-- noinspection SqlNoDataSourceInspectionForFile

-- noinspection SqlDialectInspectionForFile

BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS trees;
DROP  TABLE IF EXISTS species;
DROP  TABLE IF EXISTS beers;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(500) NOT NULL,
	role varchar(100) NOT NULL,
	firstName varchar(30),
	lastName varchar(30),
	email varchar(120),
	phone varchar(20),
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE species (
     species_id SERIAL,
     common_name varchar(80),
     scientific_name varchar(120),
     color varchar(60),
     bloom_time varchar(60),
     size_growth_habit varchar(120),
     CONSTRAINT PK_species PRIMARY KEY (species_id)
);

CREATE TABLE trees (
   tree_id SERIAL,
   species_id int NOT NULL,
   common_name varchar(80),
   scientific_name varchar(120),
   color varchar(60),
   bloom_time varchar(60),
   size_growth_habit varchar(120),
   hardiness_zone varchar(60),
   light_requirement varchar(120),
   watering_needs varchar(120),
   soil varchar(60),
   leaf varchar(200),
   special varchar(200),
   lifespan varchar(60),
   maintenance varchar(120),
   uses varchar(120),
   pest_disease varchar(120),
   origin varchar(60),
   image varchar(700),
   CONSTRAINT PK_tree PRIMARY KEY (tree_id),
   CONSTRAINT FK_species FOREIGN KEY (species_id) REFERENCES species(species_id)
);

CREATE TABLE reviews (
    user_id int NOT NULL,
    brew_id int,
    beer_id int,
    beerName varchar(30),
    review varchar(500),
    rating int,
    favorite boolean,
    liked boolean,
    image varchar(500),
    CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

COMMIT TRANSACTION;
