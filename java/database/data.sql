
BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('bob','$2a$10$ocEQn6rIm3xDEr7SVUSLPuu5YFG12RBTu82uBgGXlwJUsf2AWH1Bq','ROLE_ADMIN');  -- User ID 3
INSERT INTO users (username,password_hash,role) VALUES ('jack','$2a$10$xVN8wyDaN1j4YGOmQnVQbemuSxUR3C0C0zhx/i21Q7/jqUX0zPVNG','ROLE_ADMIN');  -- User ID 4

COMMIT;

BEGIN TRANSACTION;

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

BEGIN TRANSACTION;
INSERT INTO trees (speciesId, commonName, scientificName, color, bloomTime, sizeGrowthHabit, hardinessZone, lightRequirement, wateringNeeds, soil, leaf, special, lifespan, maintenance, uses, pestDisease, origin, image)
VALUES (1, 'Oak', 'Quercus', 'Green', 'Spring', 'Large tree, up to 60 feet', '3-9', 'Full sun', 'Medium', 'Well-drained', 'Deciduous', 'Acorns as fruit', '100 years', 'Low', 'Shade tree', 'Oak wilt, root rot', 'Northern Hemisphere', 'https://drive.google.com/file/d/164N8lLt_8oXAmH1AcA3DFyKLrNKrIaEs/view?usp=drive_link');

INSERT INTO trees (speciesId, commonName, scientificName, color, bloomTime, sizeGrowthHabit, hardinessZone, lightRequirement, wateringNeeds, soil, leaf, special, lifespan, maintenance, uses, pestDisease, origin, image)
VALUES (3, 'Pine', 'Pinus', 'Green', 'Spring', 'Large tree, 10 to 260 feet', '3-9', 'Full sun', 'Medium', 'Well-drained', 'Conifer', 'Pine Cones', '100 years', 'Low', 'Ever green', 'Pine dies', 'Northern Hemisphere', 'https://drive.google.com/file/d/1LQuRf89iL7YU0mhukdedhZSslzuGq_LA/view?usp=drive_link');

INSERT INTO trees (speciesId, commonName, scientificName, color, bloomTime, sizeGrowthHabit, hardinessZone, lightRequirement, wateringNeeds, soil, leaf, special, lifespan, maintenance, uses, pestDisease, origin, image)
VALUES (5, 'Cherry', 'Prunus', 'Green', 'Spring', 'Large tree, 15 to 25 feet', '3-9', 'Full sun', 'Medium', 'Well-drained', 'Deciduous', 'Cherries', '100 years', 'Low', 'Fruit', 'Cherry problems', 'Northern Hemisphere', 'https://drive.google.com/file/d/19VTJ4D_JEWCgQ2Sxvr3bXya1rFwYf5og/view?usp=drive_link');

COMMIT;
