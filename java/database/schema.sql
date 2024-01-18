-- noinspection SqlNoDataSourceInspectionForFile

-- noinspection SqlDialectInspectionForFile

BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS trees;
DROP  TABLE IF EXISTS species;

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
     speciesId SERIAL,
     commonName varchar(80),
     scientificName varchar(120),
     color varchar(60),
     bloomTime varchar(60),
     sizeGrowthHabit varchar(120),
     CONSTRAINT PK_species PRIMARY KEY (speciesId)
);

CREATE TABLE trees (
   treeId SERIAL,
   speciesId int NOT NULL,
   commonName varchar(80),
   scientificName varchar(120),
   color varchar(60),
   bloomTime varchar(60),
   sizeGrowthHabit varchar(120),
   hardinessZone varchar(60),
   lightRequirement varchar(120),
   wateringNeeds varchar(120),
   soil varchar(60),
   leaf varchar(200),
   special varchar(200),
   lifespan varchar(60),
   maintenance varchar(120),
   uses varchar(120),
   pestDisease varchar(120),
   origin varchar(60),
   image varchar(700),
   CONSTRAINT PK_tree PRIMARY KEY (treeId),
   CONSTRAINT FK_species FOREIGN KEY (speciesId) REFERENCES species(speciesId)
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
