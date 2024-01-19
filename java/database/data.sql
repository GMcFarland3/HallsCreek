
-- Add admin role users to the users table
BEGIN TRANSACTION;
INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');   -- User ID 1
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');  -- User ID 2
INSERT INTO users (username,password_hash,role) VALUES ('bob','$2a$10$ocEQn6rIm3xDEr7SVUSLPuu5YFG12RBTu82uBgGXlwJUsf2AWH1Bq','ROLE_ADMIN');  -- User ID 3
INSERT INTO users (username,password_hash,role) VALUES ('jack','$2a$10$xVN8wyDaN1j4YGOmQnVQbemuSxUR3C0C0zhx/i21Q7/jqUX0zPVNG','ROLE_ADMIN');  -- User ID 4
COMMIT;

BEGIN TRANSACTION;

-- Inserting into species table
-- species_id: 1
INSERT INTO species (commonName, scientificName, color, bloomTime, sizeGrowthHabit)
VALUES ('Oak', 'Quercus', 'Green', 'Spring', 'Large tree, up to 60 feet');

-- species_id: 2
INSERT INTO species (commonName, scientificName, color, bloomTime, sizeGrowthHabit)
VALUES ('Maple', 'Acer', 'Red', 'Autumn', 'Medium tree, up to 40 feet');

-- species_id: 3
INSERT INTO species (commonName, scientificName, color, bloomTime, sizeGrowthHabit)
VALUES ('Pine', 'Pinus', 'Green', 'Non-flowering', 'Tall tree, up to 80 feet');

-- species_id: 4
INSERT INTO species (commonName, scientificName, color, bloomTime, sizeGrowthHabit)
VALUES ('Birch', 'Betula', 'Green', 'Spring', 'Medium tree, up to 50 feet');

-- species_id: 5
INSERT INTO species (commonName, scientificName, color, bloomTime, sizeGrowthHabit)
VALUES ('Cherry', 'Prunus', 'Pink', 'Spring', 'Small tree, up to 30 feet');

COMMIT;

-- Assuming species_id generated are 1, 2, 3, 4, 5
-- Replace the values for other columns as per your requirement
BEGIN TRANSACTION;
-- Inserting into trees table
INSERT INTO trees (speciesId, commonName, scientificName, color, bloomTime, sizeGrowthHabit, hardinessZone, lightRequirement, wateringNeeds, soil, leaf, special, lifespan, maintenance, uses, pestDisease, origin, image)
VALUES (1, 'Oak', 'Quercus', 'Green', 'Spring', 'Large tree, up to 60 feet', '3-9', 'Full sun', 'Medium', 'Well-drained', 'Deciduous', 'Acorns as fruit', '100 years', 'Low', 'Shade tree', 'Oak wilt, root rot', 'Northern Hemisphere', 'https://www.lovethegarden.com/sites/default/files/content/articles/UK_old-english-oak-tree.jpg');

INSERT INTO trees (speciesId, commonName, scientificName, color, bloomTime, sizeGrowthHabit, hardinessZone, lightRequirement, wateringNeeds, soil, leaf, special, lifespan, maintenance, uses, pestDisease, origin, image)
VALUES (3, 'Pine', 'Pinus', 'Green', 'Spring', 'Large tree, 10 to 260 feet', '3-9', 'Full sun', 'Medium', 'Well-drained', 'Conifer', 'Pine Cones', '100 years', 'Low', 'Ever green', 'Pine dies', 'Northern Hemisphere', 'https://www.thetreecenter.com/wp-content/uploads/eastern-white-pine-2.jpg');

INSERT INTO trees (speciesId, commonName, scientificName, color, bloomTime, sizeGrowthHabit, hardinessZone, lightRequirement, wateringNeeds, soil, leaf, special, lifespan, maintenance, uses, pestDisease, origin, image)
VALUES (5, 'Cherry', 'Prunus', 'Green', 'Spring', 'Large tree, 15 to 25 feet', '3-9', 'Full sun', 'Medium', 'Well-drained', 'Deciduous', 'Cherries', '100 years', 'Low', 'Fruit', 'Cherry problems', 'Northern Hemisphere', 'https://www.plantsnap.com/wp-content/uploads/2020/12/shutterstock_630092342.jpg');

-- Add more trees similarly for species_id 2, 3, 4, 5

COMMIT;
