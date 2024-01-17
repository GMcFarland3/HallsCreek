
-- Add admin role users to the users table
BEGIN TRANSACTION;
INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');   -- User ID 1
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');  -- User ID 2
INSERT INTO users (username,password_hash,role) VALUES ('bob','$2a$10$ocEQn6rIm3xDEr7SVUSLPuu5YFG12RBTu82uBgGXlwJUsf2AWH1Bq','ROLE_ADMIN');  -- User ID 3
INSERT INTO users (username,password_hash,role) VALUES ('jack','$2a$10$xVN8wyDaN1j4YGOmQnVQbemuSxUR3C0C0zhx/i21Q7/jqUX0zPVNG','ROLE_ADMIN');  -- User ID 4

-- Add brew users (admins for each brewery) to the users table
INSERT INTO users (username,password_hash,role) VALUES ('madtree','$2a$10$28PrpfLgaUVSzNf8RKZk0eOj01IdabcotB3mwZ7EiSytd3wPF6CgO','ROLE_USER');  -- User ID 5
INSERT INTO users (username,password_hash,role) VALUES ('hiwire','$2a$10$t5m4SQQmTdfu1ta/1xqBROLQvpjpl4YxeXcFSvUdESYtkjV2SsyXm','ROLE_USER');  -- User ID 6
INSERT INTO users (username,password_hash,role) VALUES ('streetside','$2a$10$6mUGZ8lvi5h3iFCQOc21cOKRVbQXXucduoZ3tnqWRSvyWP3UEQBuK','ROLE_USER');  -- User ID 7
INSERT INTO users (username,password_hash,role) VALUES ('fretboard','$2a$10$61HVBojRBAYsmzgOJZxPGeIZFfpxX9gar4SMrXI7U9R4Pj.o2WLc2','ROLE_USER');  -- User ID 8
INSERT INTO users (username,password_hash,role) VALUES ('bluemoon','$2a$10$7X4fnFneYPDJwIX1ZocqZ.17X6Nq.WDfrhHI0czsCY/VpTDLJdIKu','ROLE_USER');  -- User ID 9
INSERT INTO users (username,password_hash,role) VALUES ('brink','$2a$10$xIE3n1fg4uLxWwOGd8g2geiti5a1MF0v8hCr/D.APTQKCFAA5MpWm','ROLE_USER');  -- User ID 10
INSERT INTO users (username,password_hash,role) VALUES ('rhinegeist','$2a$10$kgy3hmgxSA2gB00A4tHcMeM8n6qzhw44wZWUsP4QXywpMcTGZntFa','ROLE_USER');  -- User ID 11
INSERT INTO users (username,password_hash,role) VALUES ('tafts','$2a$10$ZALMbsKPsLraC2iTlWdHyeLLWbKoj8DN8zxR5AC/od.FdLCSHaEYi','ROLE_USER');  -- User ID 12
INSERT INTO users (username,password_hash,role) VALUES ('woodburn','$2a$10$icUm6COXoJ9MJQvJdiibwOFYJ0kzpmMiNhDoT2izACUE2.wyCaVDK','ROLE_USER');  -- User ID 13
INSERT INTO users (username,password_hash,role) VALUES ('braxton','$2a$10$Gi.i/gV27HrjAW7tDziDPe0c4FuWJZ86vQeyXvPoHikHYfLy4T8nS','ROLE_USER');  -- User ID 14
INSERT INTO users (username,password_hash,role) VALUES ('municipal','$2a$10$lpPYhFQKuf.bYZh08anUD.mFMyh3rWyjOg2ruHAn1nmVU5vMyRsOK','ROLE_USER');  -- User ID 15
COMMIT TRANSACTION;

--  Adding Breweries here
BEGIN TRANSACTION;
INSERT INTO public.breweries(user_id, name, address, address2, city, state_abbr, zip_code, phone, website, operation_hours, history, image)
	VALUES (5, 'MadTree', '3301 Madison Rd', '', 'Cincinnati', 'OH', '45209', '5135555555', 'https://madtree.com/', 'M-F 2-11', 'MadTree was born out of a passion for the craft, a heart for the community, and a desire to actually love what you do. It started as friends brewing beer together in a garage who took the leap to open a craft brewery. Considering themselves “mad scientists” as well as being inspired by trees representing life and growth, the two words were forged together creating MadTree.', 'https://d2pxm94gkd1wuq.cloudfront.net/BreweryLogos/Standard/568634387.madtree.logo.green-squarepng.png');
INSERT INTO public.breweries(user_id, name, address, address2, city, state_abbr, zip_code, phone, website, operation_hours, history, image)
    VALUES (6, 'HI-Wire', '4600 Beech Street, Suites 100 & 300', '', 'Cincinnati', 'OH', '45242', '(513) 930-4050', 'https://hiwirebrewing.com/', 'M-F 2-11', 'With a shared entrepreneurial spirit and love for craft beer, Adam Charnack and Chris Frosaker (two college roommates turned business professionals) saw an opportunity in Asheville, NC, that they couldn’t turn down. When a local brewery closed, Adam and Chris took over the lease and purchased the equipment, and with an idea and vision, turned it into the place that we all know and love — Hi-Wire Brewing.', 'https://beerstreetjournal.com/wp-content/uploads/Hi-Wire-Brewing-Logo.png');
INSERT INTO public.breweries(user_id, name, address, address2, city, state_abbr, zip_code, phone, website, operation_hours, history, image)
	VALUES (7, 'StreetSide', '4003 Eastern Ave', '', 'Cincinnati', 'OH', '45202', '(855) 762-7880', 'https://streetsidebrewery.com/', 'M-F 2-11', 'In November 1788, Benjamin Stites and 26 others founded "Columbia" near the Ohio and Little Miami River. Now, Columbia-Tusculum, Streetside Brewery calls Cincinnati`s oldest neighborhood home. Founded by the Hickey family, residents of Columbia-Tusculum, Streetside Brewery aims to offer a down-to-earth experience with diverse craft beer. From IPAs to Stouts, their lineup reflects the community`s originality. Seasonal specialties abound, and guest taps support local breweries, embodying the brewery`s commitment to community and craft.', 'https://i0.wp.com/www.craftbeerjoe.com/wp-content/uploads/2017/09/streetside-logo-lrg.png?fit=400%2C152&ssl=1');
INSERT INTO public.breweries(user_id, name, address, address2, city, state_abbr, zip_code, phone, website, operation_hours, history, image)
	VALUES (8, 'FretBoard', '5800 Creek Rd', '', 'Hamilton', 'OH', '45013', ' (513) 914-4677', 'https://www.fretboardbrewing.com/', 'M-F 2-11', 'Fretboard, an idea in the making for a while, found its home in Blue Ash, seamlessly blending music and beer. With a focus on traditional styles brewed authentically yet unafraid to experiment, the brewery opened in late 2017, swiftly gaining acclaim among beer enthusiasts and music fans. In fall 2019, they announced plans for a second brewpub in Hamilton, which opened in December 2019 in the space once occupied by the closed Quarter Barrel Brewpub. ', 'https://assets.simpleviewinc.com/simpleview/image/upload/crm/cincyregion/fretboard-logo_4296F194-5056-B3A8-498F3A8268F21539-4296f0065056b3a_4297013a-5056-b3a8-49dd1e77fc024616.jpg');
INSERT INTO public.breweries(user_id, name, address, address2, city, state_abbr, zip_code, phone, website, operation_hours, history, image)
    VALUES (9, 'BlueMoon', '3750 Chestnut Pl', '', 'Denver', 'CO', '80216', ' (303) 728-2337', 'https://www.bluemoonbrewingcompany.com/en-US', 'M-F 2-11', 'Born from a love for baseball, Blue Moon originated at the Sandlot Brewery in Denver, CO in 1995. The aim was to craft Belgian-inspired beers with a refreshing twist. A fan-favorite, "Bellyslide Wit," earned its name when someone declared, “A beer this good only comes around once in a blue moon.” Thus, Blue Moon® Belgian White Belgian-Style Wheat Ale was born. Since then, we`ve been a home run for fans, brightening every game at home and in the park.', 'https://pbs.twimg.com/profile_images/1528785473329672193/P2Qd-1Be_400x400.jpg');
INSERT INTO public.breweries(user_id, name, address, address2, city, state_abbr, zip_code, phone, website, operation_hours, history, image)
    VALUES (10, 'Brink brewing', '5905 Hamilton Ave.', '', 'Cincinnati', 'OH', '45224', '(513) 882-3334', 'https://www.brinkbrewing.com/', 'M-F 2-11', 'Jack Duncan, a visionary brewer since the early ‘90s, fostered dreams well before the craft brewery revolution hit. His love for classic brews, discovered globally and proudly stored in his fridge, ignited homebrew partners Kelly Montgomery and Mark Landers—Jack’s nephew and nephew-in-law. Their venture earned acclaim, winning Best of Show at the 2015 Hop Courage Great American Homebrew Contest with a nut brown ale inspiring Brink’s beloved GABF ® Gold-Medal-winning Father G’s Bees Honey Brown. Friend Andy McCleese, impressed by Kelly and Mark’s brews, added business acumen, propelling the team “On the Brink” of success. In February 2017, backed by a supportive network, Brink Brewing Co. emerged. Awards stacked up, including three consecutive GABF ® Gold Medals for Moozie Milk Stout and back-to-back Best Very Small Brewery in the United States', 'https://assets.untappd.com/site/beer_logos_hd/beer-3334486_8d9e4_hd.jpeg');
INSERT INTO public.breweries(user_id, name, address, address2, city, state_abbr, zip_code, phone, website, operation_hours, history, image)
    VALUES (11, 'Rhinegeist', '1910 Elm St', '', 'Cincinnati', 'OH', '45202', '(513) 381-1367', 'https://www.rhinegeist.com/', 'M-F 2-11', 'The Rhinegeist saga commences in 2005 when consultants Bob Bonder and Bryant Goulding, toiling in San Francisco, yearn for meaningful impact. Bob drafts a coffee roastery business plan, while Bryant delves into homebrewing, fueled by a quest for diverse beer experiences. Come August 2011, Bob, now with a coffee venture, envisions Cincinnati`s potential and, on Bryant`s birthday, pitches the idea of revitalizing the city`s heritage through a brewery. Seeing a craft beer vacuum, especially compared to the West Coast, they envision Rhinegeist as a catalyst for Cincinnati`s renaissance, seizing the opportunity to make a unique mark on the city`s evolving landscape.', 'https://assets.untappd.com/site/brewery_logos_hd/brewery-69953_77723_hd.jpeg');
INSERT INTO public.breweries(user_id, name, address, address2, city, state_abbr, zip_code, phone, website, operation_hours, history, image)
    VALUES (12, 'Tafts Ale House', '1429 Race St', '', 'Cincinnati', 'OH', '45202', '(513) 334-1393', 'https://www.taftsalehouse.com/', 'M-F 2-11', 'Taft`s Ale House, once St. Paul`s Evangelical Church (1850), faced demolition in 2011 but was saved by 3CDC. After a roof collapse and extensive renovation, it now spans three floors since April 2015. Named after William Howard Taft, co-founders Dave Kassling and Taft, a UC grad, transformed the space. Vintage aesthetics, dark wood, and a wraparound bar define the Ale House. The fermenting area mirrors a pattern from the Taft National Historic Site. Owners expanded in 2017 with Taft`s Brewpourium. The Ale House offers premium tri-tip steak fare, blending history, and craft beer in Cincinnati, Ohio.', 'https://brewingpersuasionscom.files.wordpress.com/2020/08/tafts.jpg?w=1024');
INSERT INTO public.breweries(user_id, name, address, address2, city, state_abbr, zip_code, phone, website, operation_hours, history, image)
    VALUES (13, 'Woodburn', '2800 Woodburn Ave', '', 'Cincinnati', 'OH', '45206', '(513) 407-3947', 'https://www.woodburnbrewery.com/', 'M-F 2-11', 'The phoenix, a tale of life, death, creation, and rebirth, lives for millennia, consumed in a fiery end, only to emerge from ashes renewed. Woodburn Brewing draws inspiration from this myth, seeking goodness in all and symbolizing Cincinnati`s brewing rebirth. Over the past century, we honor this legacy, raising a glass to Cincinnati`s brewing heritage, one pint at a time.', 'https://assets.untappd.com/site/brewery_logos_hd/brewery-223460_8bb24_hd.jpeg');
INSERT INTO public.breweries(user_id, name, address, address2, city, state_abbr, zip_code, phone, website, operation_hours, history, image)
    VALUES (14, 'Braxton Brewing', '27 W 7th St', '', 'Covington', 'KY', '41011', '(859) 261-5600', 'https://www.braxtonbrewing.com/', 'Varies, check their website for details', 'In Braxton`s world, a garage isn`t just walls; it`s where dreams find a home, with garden tools neatly stored. A hub for venturing into the world, a haven for safe returns. Saturdays resonate with solitude or shared moments. Picture your dad`s garage—the scent of oil and beer, fixing lawnmowers, instilling respect. The family garage transforms into an incubator, a renaissance space.', 'https://findvectorlogo.com/wp-content/uploads/2020/02/braxton-brewing-company-vector-logo.png');
INSERT INTO public.breweries(user_id, name, address, address2, city, state_abbr, zip_code, phone, website, operation_hours, history, image)
    VALUES (15, 'Municipal Brew Works', '20 High St', '', 'Hamilton', 'OH', '45011', '513 642 2424', 'https://www.municipal.beer/', 'M-T 3-10 | F 2-11 | S 12-11 | S 12-8', 'This neighborhood brewery opened up with a focus on making great beer, establishing strong community roots, and educating people about craft beer.  It’s hard to look past the amazing building that Municipal Brew Works calls home. The Municipal Building, also called the Frederick Mueller Building, was built in 1933 and shows off the Art Deco style of that time.', 'https://images.sirved.com/ChIJTTqjU1VGQIgRh8fPyC7lIO0/0JIVWjjPjQ.png');
COMMIT TRANSACTION;

-- Adding Beers here
BEGIN TRANSACTION;
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (1,'Happy Amber', 'Hoppy Amber Ale', 'Caramel, Floral, Bready', '6.0%', 'https://madtree.com/wp-content/uploads/2023/01/Happy-Amber_Can-Render.png', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (1,'Legendary Lager', 'Lager', 'Classic & Crisp', '4.2%', 'https://madtree.com/wp-content/uploads/2023/01/Legendary-Lager.png', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (1, 'Holly Days', 'India Pale Ale', 'Pine, Citrus, Hoppy', '6.8%', 'https://madtree.com/wp-content/uploads/2023/01/Holly-Days_Can-Render.png', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (1, 'Ziegler', 'Oktoberfest Lager', 'Toasty, Smooth, Rich Malt', '5.7%', 'https://madtree.com/wp-content/uploads/2023/01/Ziegler_Can-Render.png', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (1, 'Shade', 'Tart Fruit Ale', 'Fruity, Refreshing, Slightly Tart', '4.0%', 'https://dydza6t6xitx6.cloudfront.net/ci-madtree-shade-tart-fruit-ale-880eda814e972e52.jpeg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (2,'Leisure Time', 'Lager', 'smooth, crisp and refreshing American craft lager brewed patiently with 100% barley', '5.0%', 'https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_1498/https://hiwirebrewing.com/wp-content/uploads/2022/11/LeisureTimeLager_front_Mockup.png', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (2,'Mountain Water', 'Easy Drinking Ale', 'Bright and citrusy with major slushy-in-the-sunshine energy vibes from lemon and lime.', '4.5%', 'https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_397,h_1030/https://hiwirebrewing.com/wp-content/uploads/2021/09/mtn-wtr_front-397x1030.png', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (2, 'Zirkusfest', 'Oktoberfest', 'Oktoberfest lager without the heavy finish.', '6.0%', 'https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_1498/https://hiwirebrewing.com/wp-content/uploads/2022/01/zirk-2022.png', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (2, 'Elated', 'Winter IPA', 'India Pale Ale that doesn’t lack for pine and citrus peel notes from Michigan Chinook & Idaho 7 hops balanced by sticky caramel and toasted bread flavors from a carefully crafted malt bill.','5.5%', 'https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_1498/https://hiwirebrewing.com/wp-content/uploads/2022/01/elated-front.png', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (2, 'Lo-Pitch', 'Hazy IPA', 'Juicy American hops and a light malt bill make Lo-Pitch the perfect pairing for sandy shores, mountain tops, or backyard hangs', '5.5%', 'https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_397,h_1030/https://hiwirebrewing.com/wp-content/uploads/2021/08/lopitch_front-397x1030.png', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (3,'Game Ball', 'Golden Ale', 'Game Ball, our golden ale, is brewed for celebrating all your favorite Cincinnati sports teams.', '5.0%', 'https://assets.untappd.com/photos/2023_11_03/efd9c575de27126cd2d40114e91d8446_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (3,'Kanpai', 'Japanese Rice Lager', 'Kampai, our Japanese-style Rice Lager, made with jasmine rice and pilsner malt, will surely delight the senses and the palate.', '4.0%', 'https://assets.untappd.com/site/beer_logos_hd/beer-5599906_3b89a_hd.jpeg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (3, 'Return of the Mac', 'Blonde Ale', 'Dripping in aromatics of coconut, honey, and fresh vanilla blended together in a fresh cup of your favorite morning coffee.', '5.5%', 'https://assets.untappd.com/site/beer_logos_hd/beer-2061260_80689_hd.jpeg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (3, 'Pineapple Midwesty', 'IPA-Fruited', 'Check out this super secret, uber-limited FOURTH different variant of Midwesty, Pineapple Midwesty! This West Coast India Pale Ale is complimented by that sweet nectar of the gods, Pineapple!','7.0%', 'https://assets.untappd.com/site/beer_logos_hd/beer-5604525_c50a9_hd.jpeg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (3, 'Whos A Good Beer', 'Hazy Pale Ale', 'Whos a Good Beer? Hazy Pale Ale made with Cltra, Mosaic and El Dorado hops Is our way to help fund two local Cincinnati animal shelters', '5.0%', 'https://assets.untappd.com/site/beer_logos_hd/beer-3730048_4adfe_hd.jpeg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (4,'Vlad', 'Pilsner', 'This International-Style Pils is a recipient of many awards and is the perfect medium-body, European style lager.', '5.3%', 'https://ohio.org/static/uploads/0688y000004Qr14AAC.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (4,'Peso In My Hand', 'Mexican Lager', 'Brewed with generous amounts of corn, this easy drinking Mexican-style Lager is a crowd pleaser. 2020 Cervecera Del Pacifico bronze medal winner.', '5.3%', 'https://assets.untappd.com/photos/2022_05_27/2368712711cd2faa8c8c5b769b5afb25_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (4, 'Reba Strawberry', 'Blonde Ale', 'This light cream style ale infused with just the right amount of strawberry. Its bubbly and effervescent and a fan favorite', '5.3%', 'https://images.squarespace-cdn.com/content/v1/6400c622d90f2c202613ca3d/add69cc7-9c92-4412-a716-181100971e61/RebaSingleCanMock.png', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (4, 'Fretboard Light', 'Premium Lager', 'Perfect light lager. You can now enjoy this domestic light lager in 15 and 24 packs.','4.0%', 'https://images.squarespace-cdn.com/content/v1/6400c622d90f2c202613ca3d/035675e0-b6b7-4b83-a1e9-114359a65aaa/FretLight1920x1080V2.png', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (4, 'Bootsy Brewski', 'India Pale Ale', 'This light and crispy IPA is a 5 time winner of medals in the US Beer Open Championship', '7.0%', 'https://www.cincinnati.com/gcdn/presto/2019/08/05/PCIN/99ec70f7-5226-410c-b1e7-1a5e8a0eb0e1-Bootsy_6_pack.PNG', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (5,'Belgian White', 'Belgian-Style Wheat Ale', 'A wheat beer brewed with Valencia orange peel for a suble sweetness and bright, citrus aroma.', '5.4%', 'https://www.bluemoonbrewingcompany.com/sites/bluemoon/files/styles/beers/public/beers/2018-06/BlueMoon-BelgianWhite.png?itok=NZQsZ8D-', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (5,'Lightsky Tropical Wheat', 'Tropical Wheat Beer', 'A new light and refreshing wheat beer brewed with pineapple and orange peel for a lighter, exceptional taste.', '4.0%', 'https://www.bluemoonbrewingcompany.com/sites/bluemoon/files/styles/beers/public/beers/2022-03/LightSky%20Tropical_.png?itok=PHAvh_Mk', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (5, 'Lightsky', 'Citrus Wheat', 'A light and refreshing wheat beer, brewed with real tangerine peel.', '4.0%', 'https://www.bluemoonbrewingcompany.com/sites/bluemoon/files/styles/beers/public/beers/2020-02/Light%20Sky.png?itok=dHVQHOMb', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (5, 'Moon Haze', 'Hazy Pale Ale', 'Hazy brewed with dried whole oranges to infuse the flavor into the beer, creating a delicious, juicy flavor and bright color.','5.7%', 'https://www.bluemoonbrewingcompany.com/sites/bluemoon/files/styles/beers/public/beers/2021-09/Blue_Moon_Moon_Haze_Can.png?itok=RrRhjA3p', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (5, 'Mango Wheat', 'Mango Wheat Beer', 'A refreshing beer with ripe mango flavor and biscuity malt sweetness', '5.4%', 'https://www.bluemoonbrewingcompany.com/sites/bluemoon/files/styles/beers/public/beers/2018-06/BlueMoon-MangoWheat.png?itok=5mGbkI3j', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (6,'Jackpot Joey', 'Golden Ale', 'Clean, crisp, and way more crushable than its namesake. The perfect game day beer.', '5.2%', 'https://i0.wp.com/beersbeardspod.com/wp-content/uploads/2022/09/brink-jackpot-joey-rotated.jpg?resize=678%2C381&ssl=1', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (6,'Comet', 'Fresh Hopped IPA', 'Its light in body like a west coast IPA, its dank and resinous, but with notes of peach, apricot, and citrus.', '7.2%', 'https://assets.untappd.com/photos/2023_10_17/89b29c73d25376ef82ad38bbf2fee74d_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (6, 'Hold The Reins', 'English Mild', 'Malty, brown British Ale. Medium body. Smooth caramel, toffee sweetness with hints of coffee and chocolate.', '5.2%', 'https://potablepastime.files.wordpress.com/2021/05/brink-hold-the-reins-og2.jpg?w=500', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (6, 'Nightbringer', 'Imperial Stout', 'Slightly bitter dark chocolate turns into a richer, smoother, creamier chocolate flavor with hints of dark caramel and coffee as this behemoth stout warms up.','10.0%', 'https://assets.untappd.com/photos/2023_09_10/377905315e27599710cce24d5211ce12_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (6, 'Tropical Wheat', 'American Wheat Ale', 'Traditional American wheat ale gets loaded up with guava and pineapple, with plenty of light grain maltiness to support the island party in your mouth.', '4.9%', 'https://assets.untappd.com/photo/2023_04_19/0359a2fe3004bcb977500e41a6c830fa_c_1266485894_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (7,'Cincy Light', 'American Lager', 'A refreshingly crisp lager. This easy-drinking classic is the perfect way to celebrate the Queen City.', '4.2%', 'https://d24v69n0tr7hm9.cloudfront.net/wp-content/uploads/2023/06/10185212/CincyLight_12oz_CanRender-768x1179.png', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (7,'Juicy Truth', 'Juicy India Pale Ale', 'Brewed to unleash the mouthwatering, tropical notes and aromas of the generous hop bill, Juicy Truth delivers on the promise by the iconic IPA: always bold, always consistent, always fresh, always delicious. ', '6.5%', 'https://d24v69n0tr7hm9.cloudfront.net/wp-content/uploads/2022/12/31102148/JuicyTruth_CanRender-768x1179.png', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (7, 'Cheetah', 'Lager', 'Swift in body and mind, Cheetah sprints forward. Pure, crisp, clean.', '4.8%', 'https://d24v69n0tr7hm9.cloudfront.net/wp-content/uploads/2018/08/04022328/Cheetah_12oz_CanRender-768x1179.png', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (7, '93 Octane', 'Four Peel Blonde Ale', 'Slightly fruity aroma, flavor is bright sublte malt characteristics, fruity flavors, hints at orange.','6.2%', 'https://d24v69n0tr7hm9.cloudfront.net/wp-content/uploads/2018/09/03180359/Light-Beer-Color-768x1316.png', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (7, 'Antelope', 'Amber Lager', 'This amber lager leaps through fields of toasty, amber malts and grazes on ample cascade and crystal hops for a malt-forward, bready profile with just a hint of hop bitterness and a clean finish.', '5.0%', 'https://d24v69n0tr7hm9.cloudfront.net/wp-content/uploads/2018/09/03180411/Med-Color-Pint-768x1316.png', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (8,'Gavel Banger', 'American IPA', 'American IPA brewed and dry hopped with heaps of Citra and Mosaic hops, juicy, hoppy justice.', '7.0%', 'https://thegnarlygnome.com/wp-content/uploads/2019/10/adjustments-dsqz-9-400x400.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (8,'Cold Boy', 'Lager', 'This anytime lager features American Pilsner malt and Saaz hops for a clean, balanced character that drinks smooth every time.', '4.5%', 'https://assets.untappd.com/photos/2022_03_12/84a76f5c6fcbb452610a08ad08cfda49_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (8, 'Santas Bribe', 'Christmas Cookie Ale', 'Winter warmer ale brewed with cinnamon, ginger and vanilla.', '6.2%', 'https://assets.untappd.com/photos/2023_01_08/e4f196324ecf8bfd35bd14d8c7ed2b64_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (8, 'Nellies Orange Creamsicle Ale', 'American Wheat Ale', 'A juicy, adults-only cream ale brewed with heaps of orange to transport you back to a simpler time.','4.8%', 'https://assets.untappd.com/photos/2023_06_27/c46e80ddd4e3e7018273874448c96d2f_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (8, 'Oktubberfest', 'Festbier', 'Our festbier shines a deep golden orange with German malts and hops in all the right places.', '5.7%', 'https://i.redd.it/were-in-the-thick-of-it-now-which-local-oktoberfest-beers-v0-1y9463hf5rjb1.jpg?width=2779&format=pjpg&auto=webp&s=470a4098154ba35a60a3eae143792e92b57c3276', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (9,'American Pilsner', 'Pilsner', 'Reformulated and better than ever! Now more American!', '4.6%', 'https://static.wixstatic.com/media/a3d152_126794080a254d9faf8c59a0d4102a07~mv2.jpg/v1/fill/w_560,h_400,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/beerfrontpage.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (9,'1803 Blonde Ale', 'Blonde Ale', 'Crisp American blonde ale.', '4.9%', 'https://cdn.shortpixel.ai/spai/q_lossless+w_1082+to_webp+ret_img/imbibemagazine.com/wp-content/uploads/2017/05/real-ale-firemans-no-4-draft2-crdt-max-kelly.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (9, 'Solo', 'Coffee Blonde Ale', 'Coffee infused blonde ale. Loaded with LaTerza coffee, this traditional Blonde Ale delivers bright coffee and vanilla notes through a bright fluffy pillow of foam.', '5.0%', 'https://cdn.beeradvocate.com/im/beers/548403.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (9, 'Orange Cream', 'Cream Ale', 'This bright orange cream ale is brewed basmati rice. After fermentation, blood orange and vanilla are packed into this brew, reminding you of hot summer days and tasty treats.','5.0%', 'https://photos.bringfido.com/restaurants/7/8/5/74587/74587_276961.jpg?size=slide&density=2x', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (9, 'Craft American Lager', 'Lager-Pale', 'Well-balanced malty and hop flavor, harvest gold in color. Slight sweetness gives way to a crisp refreshing finish. The aroma has notes of orange marmalade, grapefruit, spice, brown bread and caramel.', '4.8%', 'https://assets.untappd.com/photos/2023_11_11/54f1180d365f46fd485c0192f2b4d5a8_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (10,'Spur', 'Amber Lager', 'This friendly amber lager is malt-forward, has a deep golden hue and a body thats as sharp as it is smooth.', '4.0%', 'https://thepartysource.com/image/cache//catalog/inventory/BRAXTON-SPUR-AMERICAN-LAGER-6-PACK-500x500.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (10,'Schwarzbier', 'Schwarzbier', 'A schwarzbier is a dark lager and this one is brewed with 100% German-based Weyermann malt. An array of speciality malts bring a dark color, light roast, and a breadth of malt character.', '5.1%', 'https://assets.untappd.com/photos/2023_10_11/790f6bf55b3a595717f427db653e92d7_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (10, 'Opera Cream Stout', 'American Stout', 'A dessert-like sweet stout starts as a delicious milk stout made up of chocolate and caramel malts, we then add Lactose and hops to give the beer a sweet finish and full mouthfeel.', '5.5%', 'https://d1ynl4hb5mx7r8.cloudfront.net/wp-content/uploads/2023/09/14131039/7dab6193c7343a89e04c.png', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (10, 'Jubilee', 'Imperial IPA', 'Jubilee Hoppy Holiday Extra IPA features strong citrus and tropical fruit aromas, flavors including orange, tangerine, mango, and pineapple with subtle fresh pine notes as well as a clean, soft finish.','8.0%', 'https://thepartysource.com/image/cache/catalog/inventory/BRAXTON-JUBILEE-6-PACK-228x228.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (10, 'Scooter Blood Orange Radler', 'Shandy', 'Take your tastebuds on a refreshing ride with this unique infusion of sweet and citrus perfection. Enjoy the delicious flavors and aromas of freshly cut, ripe blood oranges.', '4.0%', 'https://www.kroger.com/product/images/large/front/0086058500027', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (11, 'Approachable Blond', 'Ale', 'It won the silver medal at the Ohio Craft Brewers Cup.', '4.7%', 'https://assets.untappd.com/photos/2023_12_01/13ea1cda364bf537445a90990651a4d7_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (11, 'Woltermelon Blonde', 'Ale', 'Takes their great blonde ale and loads it with watermelon. Named after a local fallen firefighter, Patrick Wolterman.', '4.8%', 'https://assets.untappd.com/photos/2023_07_08/38d7cf72ed41e75263c4dd696675fbd6_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (11, 'Orange Agave Blonde', 'Ale', 'Blonde that taste like a liquid creamsicle.', '5.0%', 'https://assets.untappd.com/photos/2023_11_27/efc0b04ecf3f05da8704038eb2a8fb18_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
    VALUES (11, 'Anniversary Series #2', 'Double IPA', 'This Double IPA was released at their 2nd anniversary event. With the addition of honey, this beer is just as sweet and boozy as it is hoppy.', '10.0%', 'https://assets.untappd.com/photos/2018_12_23/2e35263874349c0e2a94afb240e314cd_640x640.jpg', 'true');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (11, 'Scout IPA', 'IPA', 'A true mosaic of flavors make up this beer’s profile as hints of orange peel and kumquats greet you up front while the bite of grapefruit and pine resin make up the encore.', '6.5%', 'https://assets.untappd.com/photos/2023_11_25/cd16e32885e1a0408a9ab5d77013653c_640x640.jpg', 'true');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (11, 'The Duelist', 'Belgian Stout', 'Strong roasted malt flavors dominate here, with intense notes of bitter dark chocolate out front and wisps of licorice and campfire smoke dancing in the background.', '8.0%', 'https://assets.untappd.com/photos/2020_08_07/f4d14a0f5435ad4fc75fc610f59c10e2_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (11, 'Midnight Cut', 'Porter', 'The sophistication of roasted coffee, the sharp bite of dark chocolate and the slightest wisp of smokiness.', '6.18%', 'https://assets.untappd.com/photos/2023_11_19/9d26746a589e0214d3d7374a5aa00e9a_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (11, 'Courageous', 'IPA', 'Light and smooth with a nice west coast hop presence.', '5.6%', 'https://assets.untappd.com/photos/2023_07_08/1dc0795ac3413e446ba7af43c21a7718_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (11, 'True West', 'Porter', 'We take our Midnight Cut porter and blend in some fantastic cold-brewed coffee from our friends at True West Coffee.', '5.4%', 'https://assets.untappd.com/photos/2023_11_21/8b838a97615ef3ef5a894cd6495d6d23_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (11, 'Free City Ale', 'Red Ale', 'Sweet, clean malts out front give way to a balancing dose of spicy hops on the back end that make this an easy drinking, tasty and fun brew.', '6.3%', 'https://assets.untappd.com/photos/2022_10_08/1b0a01f59c372db808370b92cddcc8b5_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (11, 'Our Two Cents', 'Pale Ale', 'Our version of a West Coast Pale Ale loaded up with nothing but Centennial.', '7.5%', 'https://assets.untappd.com/photos/2023_02_02/6d2232fcb3b7b1444fa82f7b45a68bf3_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (11, 'Station 2', 'Rye', 'Our unique pale ale has generous amounts of rye for that "bite" yet the hops bring it right around at the end.', '5.12%', 'https://assets.untappd.com/photos/2022_03_16/39d931610bafba1718ce370036381e2a_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (11, '1791 Oktoberfest', 'Festbier', 'This rich Amber brew expertly captures the smells, flavors, and colors of autumn with hints of dried fruit and molasses on the nose and notes of caramel and toffee on the tongue.', '7.0%', 'https://assets.untappd.com/photos/2023_10_02/eaf3c641968e42da6e27c2f6fb8de525_640x640.jpg', 'true');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (11, 'Weiz Guys', 'Wheat', 'This quaffable wheat beer has a nose that you will go bananas for and a bright lemony finish.', '4.3%', 'https://assets.untappd.com/photos/2022_09_18/d3a7c71543a355020c1b47ee0463f674_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (11, 'Recovery Red', 'Red Ale', 'A red ale with full taste.', '7.1%', 'https://assets.untappd.com/photos/2023_11_19/ed6026adfa280cf8d69f579d0c32a0bc_640x640.jpg', 'false');
INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)
	VALUES (11, 'Timber Trail Brown Ale', 'Brown Ale', 'The nutty aroma and flavors comes from the generous portion of Maris Otter malt we use during the brewing process. To finish it off we add one of our favorite hops to give it an American signature', '6.5%', 'https://assets.untappd.com/photos/2023_07_06/3b732a782ff9380dff1d37a57d4a4e5d_640x640.jpg', 'false');
COMMIT TRANSACTION;

-- Adding Reviews here
BEGIN TRANSACTION;
INSERT INTO public.reviews(user_id, brew_id, beer_id, beerName, review, rating, favorite, liked, image) VALUES(3, 11, 51, 'Approachable Blond', 'Love this blonde!', 5, true, true, 'https://assets.untappd.com/photos/2023_12_01/13ea1cda364bf537445a90990651a4d7_640x640.jpg');
INSERT INTO public.reviews(user_id, brew_id, beer_id, beerName, review, rating, favorite, liked, image) VALUES(3, 11, 53, 'Orange Agave Blonde', 'Love this orange blonde!', 5, true, true, 'https://assets.untappd.com/photos/2023_11_27/efc0b04ecf3f05da8704038eb2a8fb18_640x640.jpg');
INSERT INTO public.reviews(user_id, brew_id, beer_id, beerName, review, rating, favorite, liked, image) VALUES(3, 11, 54, 'Anniversary Series #2', 'what can i say', 5, true, true, 'https://assets.untappd.com/photos/2023_12_01/13ea1cda364bf537445a90990651a4d7_640x640.jpg');
INSERT INTO public.reviews(user_id, brew_id, beer_id, beerName, review, rating, favorite, liked, image) VALUES(3, 11, 55, 'Scout IPA', 'Scouts honor', 3, true, true, 'https://assets.untappd.com/photos/2023_12_01/13ea1cda364bf537445a90990651a4d7_640x640.jpg');
INSERT INTO public.reviews(user_id, brew_id, beer_id, beerName, review, rating, favorite, liked, image) VALUES(3, 11, 51, 'Approachable Blond', 'Cant get enough', 5, true, true, 'https://assets.untappd.com/photos/2023_12_01/13ea1cda364bf537445a90990651a4d7_640x640.jpg');
INSERT INTO public.reviews(user_id, brew_id, beer_id, beerName, review, rating, favorite, liked, image) VALUES(3, 11, 53, 'Orange Agave Blonde', 'Go orange', 3, true, true, 'https://assets.untappd.com/photos/2023_12_01/13ea1cda364bf537445a90990651a4d7_640x640.jpg');
INSERT INTO public.reviews(user_id, brew_id, beer_id, beerName, review, rating, favorite, liked, image) VALUES(4, 11, 51, 'Approachable Blond', 'Tried for first time and best tasting beer!', 5, true, true, 'https://assets.untappd.com/photos/2023_12_01/13ea1cda364bf537445a90990651a4d7_640x640.jpg');
INSERT INTO public.reviews(user_id, brew_id, beer_id, beerName, review, rating, favorite, liked, image) VALUES(4, 11, 54, 'Anniversary Series #2', 'Not a bad beer i would get it again next time i visit municipal', 5, true, true, 'https://assets.untappd.com/photos/2023_12_01/13ea1cda364bf537445a90990651a4d7_640x640.jpg');
INSERT INTO public.reviews(user_id, brew_id, beer_id, beerName, review, rating, favorite, liked, image) VALUES(4, 11, 55, 'Scout IPA', 'must try for IPA lovers', 3, true, true, 'https://assets.untappd.com/photos/2023_12_01/13ea1cda364bf537445a90990651a4d7_640x640.jpg');

COMMIT TRANSACTION;
