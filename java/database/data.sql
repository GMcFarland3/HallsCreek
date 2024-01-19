
BEGIN TRANSACTION;
INSERT INTO users (username,password_hash,role) VALUES ('bob','$2a$10$ocEQn6rIm3xDEr7SVUSLPuu5YFG12RBTu82uBgGXlwJUsf2AWH1Bq','ROLE_ADMIN');  -- User ID 3
INSERT INTO users (username,password_hash,role) VALUES ('jack','$2a$10$xVN8wyDaN1j4YGOmQnVQbemuSxUR3C0C0zhx/i21Q7/jqUX0zPVNG','ROLE_ADMIN');  -- User ID 4
COMMIT;

BEGIN TRANSACTION;
-- species id -> 1
INSERT INTO species (scientificName, size1, price1,  size2, price2, size3, price3, size4, price4, size5, price5, size6, price6)
VALUES ('Acer', '-1.5', '135.00', '1.5', '148.00', '2.0', '163.00', '2.5', '197.00', '3.0', '210.00', '+3.0', '225.00');
-- species id -> 2
INSERT INTO species (scientificName, size1, price1,  size2, price2, size3, price3, size4, price4, size5, price5, size6, price6)
VALUES ('Elm', '-1.5', '135.00', '1.5', '148.00', '2.0', '163.00', '2.5', '197.00', '3.0', '210.00', '+3.0', '225.00');
-- species id -> 3
INSERT INTO species (scientificName, size1, price1,  size2, price2, size3, price3, size4, price4, size5, price5, size6, price6)
VALUES ('Redbud', '-1.5', '135.00', '1.5', '148.00', '2."', '163.00', '2.5', '197.00', '3.0', '210.00', '+3.0', '225.00');
-- species id -> 4
INSERT INTO species (scientificName, size1, price1,  size2, price2, size3, price3, size4, price4, size5, price5, size6, price6)
VALUES ('Tulip', '-1.5', '135.00', '1.5', '148.00', '2.0', '163.00', '2.5', '197.00', '3.0', '210.00', '+3.0', '225.00');
COMMIT;

BEGIN TRANSACTION;
INSERT INTO trees (speciesId, commonName) VALUES (1, 'Autumn Blaze Maple');
INSERT INTO trees (speciesId, commonName) VALUES (1, 'Redpointe Maple');
INSERT INTO trees (speciesId, commonName) VALUES (2, 'Frontier Elm');
INSERT INTO trees (speciesId, commonName) VALUES (2, 'Emerald Sunshine Elm');
INSERT INTO trees (speciesId, commonName) VALUES (3, 'Eastern Redbud');
INSERT INTO trees (speciesId, commonName) VALUES (3, 'Forest Pansy Redbud');
INSERT INTO trees (speciesId, commonName) VALUES (4, 'Emerald City Tulip');
COMMIT;
