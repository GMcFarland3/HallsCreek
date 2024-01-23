
BEGIN TRANSACTION;
INSERT INTO users (username,password_hash,role) VALUES ('bob','$2a$10$ocEQn6rIm3xDEr7SVUSLPuu5YFG12RBTu82uBgGXlwJUsf2AWH1Bq','ROLE_ADMIN');  -- User ID 3
INSERT INTO users (username,password_hash,role) VALUES ('jack','$2a$10$xVN8wyDaN1j4YGOmQnVQbemuSxUR3C0C0zhx/i21Q7/jqUX0zPVNG','ROLE_ADMIN');  -- User ID 4
COMMIT;


BEGIN TRANSACTION;

-- Insert species with pricing details and image URLs
INSERT INTO species (scientificName, size1, price1, wholesale1, size2, price2, wholesale2, size3, price3, wholesale3, size4, price4, wholesale4, size5, price5, wholesale5, size6, price6, wholesale6)
VALUES
    ('Autumn Blaze Maple', '1.75', '235.00', '148.00', '2', '250.00', '163.00', '2.5', '300.00', '197.00', '3', '375.00', '240.00', NULL, NULL, NULL, NULL, NULL, NULL),
    ('Eastern Red Bud', '1.5', '195.00','126.00', '1.75', '210.00', '135.00', '2', '250.00', '162.00', '2.5', '300.00', '195.00', '3', '350.00', '225.00', NULL, NULL, NULL),
    ('Forest Pansy', '1.5', '230.00', '150.00', '1.75', '270.00', '175.00', '2', '300.00', '195.00', '2.5', '330.00', '215.00', '3', '385.00', '250.00', NULL, NULL, NULL),
    ('Exclamation', '1.75', '195.00', '126.00', '2', '250.00', '162.00', '2.5', '300.00', '190.00', '3', '350.00', '230.00', NULL, NULL, NULL, NULL, NULL, NULL),
    ('Frontier Elm', '1.75', '200.00', '131.00', '2', '245.00', '157.00', '2.5', '295.00', '190.00', '3', '350.00', '230.00', NULL, NULL, NULL, NULL, NULL, NULL),
    ('American Dream White Oak/Red Oak', '1.75', '240.00', '145.00', '2', '270.00', '162.00', '2.5', '315.00', '205.00', '3', '375.00', '235.00', NULL, NULL, NULL, NULL, NULL, NULL);

-- Insert trees linked to species as before
INSERT INTO trees (speciesId, commonName, image) VALUES (1, 'Autumn Blaze Maple', 'https://scontent.fluk1-1.fna.fbcdn.net/v/t1.6435-9/118616050_110624847431009_4846292020924748536_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=dd63ad&_nc_ohc=IVsMTXDtIzsAX_WgBCo&_nc_ht=scontent.fluk1-1.fna&oh=00_AfBPSPbjQAS5OXqeR4opWx3NzOwUG9YF7mWIpqPWFp2-nw&oe=65D5E808');
INSERT INTO trees (speciesId, commonName, image) VALUES (1, 'Redpointe Maple', 'https://scontent.fluk1-1.fna.fbcdn.net/v/t1.6435-9/118469476_110624954097665_5027403863018243416_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=dd63ad&_nc_ohc=F_tjw44MPdcAX8pfMWQ&_nc_ht=scontent.fluk1-1.fna&oh=00_AfBipOa8fJl9U3IRv_Sr8lluzbtfaa1SKbOpg0oha0EmTw&oe=65D5E810');
INSERT INTO trees (speciesId, commonName, image) VALUES (2, 'Frontier Elm', 'https://scontent.fluk1-1.fna.fbcdn.net/v/t1.6435-9/118588689_110624894097671_8804710479014920377_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=dd63ad&_nc_ohc=IyDqAoj_TosAX-55XgQ&_nc_ht=scontent.fluk1-1.fna&oh=00_AfAhc6LReHEI1ziRtvopI-AfAp2fU6K5qzoYZuaJC2_umQ&oe=65D61123');
INSERT INTO trees (speciesId, commonName, image) VALUES (2, 'Emerald Sunshine Elm', 'https://scontent.fluk1-1.fna.fbcdn.net/v/t1.6435-9/118588689_110624894097671_8804710479014920377_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=dd63ad&_nc_ohc=IyDqAoj_TosAX-55XgQ&_nc_ht=scontent.fluk1-1.fna&oh=00_AfAhc6LReHEI1ziRtvopI-AfAp2fU6K5qzoYZuaJC2_umQ&oe=65D61123');
INSERT INTO trees (speciesId, commonName, image) VALUES (3, 'Eastern Redbud', 'https://scontent.fluk1-1.fna.fbcdn.net/v/t1.6435-9/118497860_110624870764340_5068663010534376626_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=dd63ad&_nc_ohc=_5IQJJyNmasAX8Geh8X&_nc_ht=scontent.fluk1-1.fna&oh=00_AfBiRW_bLxUmRwGtpKxaL8OgLZw7kqf2cV4TYhbGNzM6Ww&oe=65D5FA4F');
INSERT INTO trees (speciesId, commonName, image) VALUES (3, 'Forest Pansy Redbud', 'https://scontent.fluk1-1.fna.fbcdn.net/v/t1.6435-9/118497860_110624870764340_5068663010534376626_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=dd63ad&_nc_ohc=_5IQJJyNmasAX8Geh8X&_nc_ht=scontent.fluk1-1.fna&oh=00_AfBiRW_bLxUmRwGtpKxaL8OgLZw7kqf2cV4TYhbGNzM6Ww&oe=65D5FA4F');
INSERT INTO trees (speciesId, commonName, image) VALUES (4, 'Emerald City Tulip', '');

COMMIT;

-- BEGIN TRANSACTION;
-- -- species id -> 1
-- INSERT INTO species (scientificName, size1, price1,  size2, price2, size3, price3, size4, price4, size5, price5, size6, price6)
-- VALUES ('Acer', '-1.5', '135.00', '1.5', '148.00', '2.0', '163.00', '2.5', '197.00', '3.0', '210.00', '+3.0', '225.00');
-- -- species id -> 2
-- INSERT INTO species (scientificName, size1, price1,  size2, price2, size3, price3, size4, price4, size5, price5, size6, price6)
-- VALUES ('Elm', '-1.5', '135.00', '1.5', '148.00', '2.0', '163.00', '2.5', '197.00', '3.0', '210.00', '+3.0', '225.00');
-- -- species id -> 3
-- INSERT INTO species (scientificName, size1, price1,  size2, price2, size3, price3, size4, price4, size5, price5, size6, price6)
-- VALUES ('Redbud', '-1.5', '135.00', '1.5', '148.00', '2."', '163.00', '2.5', '197.00', '3.0', '210.00', '+3.0', '225.00');
-- -- species id -> 4
-- INSERT INTO species (scientificName, size1, price1,  size2, price2, size3, price3, size4, price4, size5, price5, size6, price6)
-- VALUES ('Tulip', '-1.5', '135.00', '1.5', '148.00', '2.0', '163.00', '2.5', '197.00', '3.0', '210.00', '+3.0', '225.00');
-- COMMIT;
--
-- BEGIN TRANSACTION;
-- INSERT INTO trees (speciesId, commonName) VALUES (1, 'Autumn Blaze Maple');
-- INSERT INTO trees (speciesId, commonName) VALUES (1, 'Redpointe Maple');
-- INSERT INTO trees (speciesId, commonName) VALUES (2, 'Frontier Elm');
-- INSERT INTO trees (speciesId, commonName) VALUES (2, 'Emerald Sunshine Elm');
-- INSERT INTO trees (speciesId, commonName) VALUES (3, 'Eastern Redbud');
-- INSERT INTO trees (speciesId, commonName) VALUES (3, 'Forest Pansy Redbud');
-- INSERT INTO trees (speciesId, commonName) VALUES (4, 'Emerald City Tulip');
-- COMMIT;
