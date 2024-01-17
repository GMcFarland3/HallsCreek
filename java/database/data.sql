
-- Add admin role users to the users table
BEGIN TRANSACTION;
INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');   -- User ID 1
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');  -- User ID 2
INSERT INTO users (username,password_hash,role) VALUES ('bob','$2a$10$ocEQn6rIm3xDEr7SVUSLPuu5YFG12RBTu82uBgGXlwJUsf2AWH1Bq','ROLE_ADMIN');  -- User ID 3
INSERT INTO users (username,password_hash,role) VALUES ('jack','$2a$10$xVN8wyDaN1j4YGOmQnVQbemuSxUR3C0C0zhx/i21Q7/jqUX0zPVNG','ROLE_ADMIN');  -- User ID 4
COMMIT;


BEGIN TRANSACTION;

-- Inserting into species table
INSERT INTO species (common_name, scientific_name, color, bloom_time, size_growth_habit)
VALUES ('Oak', 'Quercus', 'Green', 'Spring', 'Large tree, up to 60 feet');

INSERT INTO species (common_name, scientific_name, color, bloom_time, size_growth_habit)
VALUES ('Maple', 'Acer', 'Red', 'Autumn', 'Medium tree, up to 40 feet');

INSERT INTO species (common_name, scientific_name, color, bloom_time, size_growth_habit)
VALUES ('Pine', 'Pinus', 'Green', 'Non-flowering', 'Tall tree, up to 80 feet');

INSERT INTO species (common_name, scientific_name, color, bloom_time, size_growth_habit)
VALUES ('Birch', 'Betula', 'Green', 'Spring', 'Medium tree, up to 50 feet');

INSERT INTO species (common_name, scientific_name, color, bloom_time, size_growth_habit)
VALUES ('Cherry', 'Prunus', 'Pink', 'Spring', 'Small tree, up to 30 feet');

COMMIT;

-- Assuming species_id generated are 1, 2, 3, 4, 5
-- Replace the values for other columns as per your requirement
BEGIN TRANSACTION;
-- Inserting into trees table
INSERT INTO trees (species_id, common_name, scientific_name, color, bloom_time, size_growth_habit, hardiness_zone, light_requirement, watering_needs, soil, leaf, special, lifespan, maintenance, uses, pest_disease, origin, image)
VALUES (1, 'Oak', 'Quercus', 'Green', 'Spring', 'Large tree, up to 60 feet', '3-9', 'Full sun', 'Medium', 'Well-drained', 'Deciduous', 'Acorns as fruit', '100 years', 'Low', 'Shade tree', 'Oak wilt, root rot', 'Northern Hemisphere', 'https://www.lovethegarden.com/sites/default/files/content/articles/UK_old-english-oak-tree.jpg');

-- Add more trees similarly for species_id 2, 3, 4, 5

COMMIT;
