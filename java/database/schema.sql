
BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS trees;
DROP TABLE IF EXISTS species;

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
     scientificName varchar(120),
     price1 varchar(10),
     size1 varchar(10),
     wholesale1 varchar(10),
     price2 varchar(10),
     size2 varchar(10),
     wholesale2 varchar(10),
     price3 varchar(10),
     size3 varchar(10),
     wholesale3 varchar(10),
     price4 varchar(10),
     size4 varchar(10),
     wholesale4 varchar(10),
     price5 varchar(10),
     size5 varchar(10),
     wholesale5 varchar(10),
     price6 varchar(10),
     size6 varchar(10),
     wholesale6 varchar(10),
     CONSTRAINT PK_species PRIMARY KEY (speciesId)
);

CREATE TABLE trees (
   treeId SERIAL,
   speciesId int NOT NULL,
   commonName varchar(80),
   image varchar(500),
   CONSTRAINT PK_tree PRIMARY KEY (treeId),
   CONSTRAINT FK_species FOREIGN KEY (speciesId) REFERENCES species(speciesId)
);

--CREATE TABLE reviews (
--    user_id int NOT NULL,
--    brew_id int,
--    beer_id int,
--    beerName varchar(30),
--    review varchar(500),
--    rating int,
--    favorite boolean,
--    liked boolean,
--    image varchar(500),
--    CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES users(user_id)
--);

COMMIT TRANSACTION;
