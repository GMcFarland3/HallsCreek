BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS breweries;
DROP  TABLE IF EXISTS usersToBreweries;
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

CREATE  TABLE trees (
    tree_id SERIAL,
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
    CONSTRAINT PK_brew PRIMARY KEY (tree_id),
);

CREATE TABLE usersToBreweries (
    user_id int NOT NULL,
    brew_id int NOT NULL,
    CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT FK_brew FOREIGN KEY (brew_id) REFERENCES breweries(brew_id)
);

CREATE TABLE beers (
    beer_id SERIAL,
    brew_id int NOT NULL,
    name varchar(30),
    type varchar(25),
    description varchar(500),
    abv varchar(5),
    image varchar(500),
    status boolean,
    CONSTRAINT PK_beer PRIMARY KEY (beer_id),
    CONSTRAINT FK_brew FOREIGN KEY (brew_id) REFERENCES breweries(brew_id)
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
