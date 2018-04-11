DROP SEQUENCE IF EXISTS seq_user_id;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_badge_id;
DROP TABLE IF EXISTS badges;
DROP SEQUENCE IF EXISTS seq_photo_id;
DROP TABLE IF EXISTS rawPhotos;
DROP SEQUENCE IF EXISTS seq_vote_id;
DROP TABLE IF EXISTS votes;
DROP SEQUENCE IF EXISTS seq_approved_photo_id;
DROP TABLE IF EXISTS approvedPhotos;

CREATE SEQUENCE seq_user_id;
CREATE TABLE users
(
	user_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_user_id'),
	userName VARCHAR(200) NOT NULL,
	password  VARCHAR(300) NOT NULL,
	email VARCHAR(200) NOT NULL,
	score INTEGER
);

CREATE SEQUENCE seq_badge_id;
CREATE TABLE badges
(
	badge_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_badge_id'),
	title VARCHAR(200) NOT NULL,
	description VARCHAR(2000) NOT NULL,
	badge_url VARCHAR(200) NOT NULL,
	disabled_badge_url VARCHAR(200) NOT NULL
);

CREATE SEQUENCE seq_photo_id;
CREATE TABLE rawPhotos
(
	photo_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_photo_id'),
	photo_url VARCHAR(200) NOT NULL,
	OPPOSSUM real,
	DEER real, 
	RABBIT real, 
	RACCOON real, 
	TURKEY real, 
	SKUNK real, 
	BIRD real, 
	FOX real, 
	HUMAN real, 
	CAT real,
	COYOTE real, 
	SQUIRREL real, 
	DOG real, 
	MMV real,
	BIGFOOT real,
	photo_date VARCHAR(200),
	trail_cam INTEGER,
	identified INTEGER
);

CREATE SEQUENCE seq_vote_id;
CREATE TABLE votes
(
	vote_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_vote_id'),
	photo_id INTEGER NOT null REFERENCES rawPhotos,
	OPPOSSUM INTEGER,
	DEER INTEGER, 
	RABBIT INTEGER, 
	RACCOON INTEGER, 
	TURKEY INTEGER, 
	SKUNK INTEGER, 
	BIRD INTEGER, 
	FOX INTEGER, 
	HUMAN INTEGER, 
	CAT INTEGER,
	COYOTE INTEGER, 
	SQUIRREL INTEGER, 
	DOG INTEGER, 
	MMV INTEGER,
	BIGFOOT INTEGER,
	rating INTEGER
);

CREATE SEQUENCE seq_category_id;
CREATE TABLE category
(
	category_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_category_id'),
	title VARCHAR(200) NOT NULL,
	family VARCHAR(200) NOT NULL,
	description VARCHAR(2000) NOT NULL
);

CREATE SEQUENCE seq_approved_photo_id;
CREATE TABLE approvedPhotos
(
	photo_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_approved_photo_id'),
	raw_photo_id INTEGER NOT null REFERENCES rawPhotos,
	average_rating real
);






INSERT INTO users(userName, password, email) VALUES ('bradley', 'password', 'bradley.shilling@gmail.com');

INSERT INTO badges(title, description, badge_url, disabled_badge_url) VALUES ('Test Badge', 'this is a test badge', 'http://bit.ly/2HAN91j', 'http://bit.ly/2HAN91j');
INSERT INTO badges(title, description, badge_url, disabled_badge_url) VALUES ('Deer Spotter', 'Correctly spot deer in 5 photos', 'http://bit.ly/2HAN91j', 'http://bit.ly/2HAN91j');
INSERT INTO badges(title, description, badge_url, disabled_badge_url) VALUES ('Trend Setter', 'Rate 5 approved photos (photos are approved when animals are correctly identified)', 'http://bit.ly/2HAN91j', 'http://bit.ly/2HAN91j');
INSERT INTO badges(title, description, badge_url, disabled_badge_url) VALUES ('Test Badge', 'this is a test badge', 'http://bit.ly/2HAN91j', 'http://bit.ly/2HAN91j');
INSERT INTO badges(title, description, badge_url, disabled_badge_url) VALUES ('Test Badge', 'this is a test badge', 'http://bit.ly/2HAN91j', 'http://bit.ly/2HAN91j');
INSERT INTO badges(title, description, badge_url, disabled_badge_url) VALUES ('Test Badge', 'this is a test badge', 'http://bit.ly/2HAN91j', 'http://bit.ly/2HAN91j');

INSERT INTO rawPhotos(photo_url, OPPOSSUM, DEER, RABBIT, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000001.jpg', '5.0570484', '2.0570484', '0.0570484', '10/30/1985', '1');
INSERT INTO rawPhotos(photo_url, OPPOSSUM, DEER, RABBIT, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000002.jpg', '2.0570484', '1.0570484', '1.0570484', '10/30/1985', '1');
INSERT INTO rawPhotos(photo_url, OPPOSSUM, FOX, RABBIT, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000003.jpg', '5.0570484', '2.0570484', '0.0570484', '10/30/1985', '2');
INSERT INTO rawPhotos(photo_url, OPPOSSUM, DEER, SQUIRREL, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000004.jpg', '4.0470484', '3.0570484', '0.0570484', '10/30/1985', '3');
INSERT INTO rawPhotos(photo_url, OPPOSSUM, SQUIRREL, RABBIT, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000005.jpg', '2.0570484', '2.0570484', '1.0570484', '10/30/1985', '4');
INSERT INTO rawPhotos(photo_url, DEER, RABBIT, RACCOON, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000006.jpg', '6.0570484', '2.0570484', '0.0570484', '10/30/1985', '2');
INSERT INTO rawPhotos(photo_url, DEER, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000007.jpg', '4.0570484', '3.0570484', '0.0570484', '10/31/1985', '2');
INSERT INTO rawPhotos(photo_url, DEER, TURKEY, SKUNK, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000008.jpg', '6.0570484', '2.0570484', '0.0570484', '10/30/2018', '4');
INSERT INTO rawPhotos(photo_url, DEER, COYOTE, SQUIRREL, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000009.jpg', '6.0570484', '2.0570484', '0.0570484', '10/30/1985', '1');
INSERT INTO rawPhotos(photo_url, DEER, COYOTE, SQUIRREL, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000010.jpg', '4.0570484', '2.0570484', '0.0570484', '10/30/1985', '1');
INSERT INTO rawPhotos(photo_url, RABBIT, RACCOON, TURKEY, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000011.jpg', '1.0570484', '5.0570484', '0.0570484', '10/30/2018', '10');
INSERT INTO rawPhotos(photo_url, RABBIT, HUMAN, CAT, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000012.jpg', '1.0570484', '5.0570484', '0.0570484', '10/30/1985', '1');
INSERT INTO rawPhotos(photo_url, RABBIT, COYOTE, SQUIRREL, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000013.jpg', '1.0570484', '5.0570484', '0.0570484', '10/30/1985', '6');
INSERT INTO rawPhotos(photo_url, RABBIT, SQUIRREL, DOG, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000014.jpg', '1.0570484', '5.0570484', '0.0570484', '10/30/1985', '7');
INSERT INTO rawPhotos(photo_url, RABBIT, FOX, HUMAN, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000015.jpg', '1.0570484', '5.0570484', '0.0570484', '10/30/1985', '2');
INSERT INTO rawPhotos(photo_url, RACCOON, TURKEY, SKUNK, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000016.jpg', '6.0570484', '3.0570484', '0.0570484', '8/31/2017', '6');
INSERT INTO rawPhotos(photo_url, RACCOON, BIRD, FOX, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000017.jpg', '4.0570484', '1.0570484', '0.0570484', '8/31/2017', '6');
INSERT INTO rawPhotos(photo_url, RACCOON, TURKEY, SKUNK, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000018.jpg', '5.0570484', '2.0570484', '0.0570484', '8/31/2017', '2');
INSERT INTO rawPhotos(photo_url, RACCOON, BIRD, FOX, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000019.jpg', '6.0570484', '4.0570484', '0.0570484', '8/31/2017', '4');
INSERT INTO rawPhotos(photo_url, RACCOON, BIRD, FOX, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000020.jpg', '7.0570484', '2.0570484', '0.0570484', '4.0570484', '2.0570484', '8/31/2017', '7');
INSERT INTO rawPhotos(photo_url, TURKEY, SKUNK, BIRD, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000021.jpg', '7.0570484', '2.0570484', '0.0570484', '4.0570484', '2.0570484', '8/31/2017', '1');
INSERT INTO rawPhotos(photo_url, TURKEY, SKUNK, BIRD, COYOTE, SQUIRREL, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000022.jpg', '4.0570484', '2.0570484', '0.0570484', '4.0570484', '2.0570484', '8/31/2017', '6');
INSERT INTO rawPhotos(photo_url, TURKEY, SKUNK, BIRD, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000023.jpg', '3.0570484', '2.0570484', '0.0570484', '4.0570484', '2.0570484', '8/31/2017', '5');
INSERT INTO rawPhotos(photo_url, TURKEY, SKUNK, BIRD, HUMAN, CAT, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000024.jpg', '2.0570484', '2.0570484', '0.0570484', '4.0570484', '2.0570484', '8/31/2017', '3');
INSERT INTO rawPhotos(photo_url, TURKEY, SKUNK, BIRD, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000025.jpg', '6.0570484', '2.0570484', '0.0570484', '4.0570484', '2.0570484', '8/31/2017', '2');
INSERT INTO rawPhotos(photo_url, SKUNK, BIRD, FOX, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000026.jpg', '2.0570484', '2.0570484', '0.0570484', '4.0570484', '2.0570484', '8/31/2017', '2');
INSERT INTO rawPhotos(photo_url, SKUNK, BIRD, FOX, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000027.jpg', '5.0570484', '2.0570484', '0.0570484', '4.0570484', '2.0570484', '8/12/2016', '4');
INSERT INTO rawPhotos(photo_url, SKUNK, BIRD, FOX, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000028.jpg', '5.0570484', '2.0570484', '0.0570484', '4.0570484', '2.0570484', '8/12/2016', '4');
INSERT INTO rawPhotos(photo_url, SKUNK, BIRD, HUMAN, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000029.jpg', '5.0570484', '2.0570484', '0.0570484', '4.0570484', '2.0570484', '8/12/2016', '4');
INSERT INTO rawPhotos(photo_url, SKUNK, BIRD, HUMAN, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000030.jpg', '6.0570484', '2.0570484', '0.0570484', '4.0570484', '2.0570484', '8/12/2016', '1');
INSERT INTO rawPhotos(photo_url, BIRD, FOX, HUMAN, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000031.jpg', '7.0570484', '5.0570484', '0.0570484', '10/30/1985', '1');
INSERT INTO rawPhotos(photo_url, BIRD, SQUIRREL, DOG, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000032.jpg', '7.0570484', '5.0570484', '0.0570484', '10/30/1985', '10');
INSERT INTO rawPhotos(photo_url, BIRD, FOX, HUMAN, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000033.jpg', '4.0570484', '5.0570484', '0.0570484', '10/30/1985', '2');
INSERT INTO rawPhotos(photo_url, BIRD, FOX, HUMAN, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000034.jpg', '7.0570484', '2.0570484', '0.0570484', '10/30/1985', '6');
INSERT INTO rawPhotos(photo_url, BIRD, SQUIRREL, DOG, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000035.jpg', '7.0570484', '5.0570484', '0.0570484', '10/30/1985', '1');
INSERT INTO rawPhotos(photo_url, DOG, FOX, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000036.jpg', '5.0570484', '2.0570484', '0.0570484', '4.0570484',  '8/12/2016', '4');
INSERT INTO rawPhotos(photo_url, DOG, FOX, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000037.jpg', '5.0570484', '2.0570484', '0.0570484', '4.0570484',  '8/12/2016', '2');
INSERT INTO rawPhotos(photo_url, DOG, FOX, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000038.jpg', '5.0570484', '5.0570484', '0.0570484', '4.0570484', '8/12/2016', '1');
INSERT INTO rawPhotos(photo_url, DOG, FOX, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000039.jpg', '6.0570484', '2.0570484', '0.0570484', '4.0570484', '8/12/2016', '3');
INSERT INTO rawPhotos(photo_url, DOG, FOX, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000040.jpg', '5.0570484', '2.0570484', '0.0570484', '4.0570484', '8/12/2016', '7');
INSERT INTO rawPhotos(photo_url, HUMAN, DOG, FOX, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000041.jpg', '5.0570484', '2.0570484', '0.0570484', '4.0570484', '2.0570484', '8/12/2016', '9');
INSERT INTO rawPhotos(photo_url, HUMAN, DOG, FOX, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000042.jpg', '5.0570484', '2.0570484', '0.0570484', '4.0570484', '2.0570484', '8/12/2016', '9');
INSERT INTO rawPhotos(photo_url, HUMAN, DOG, FOX, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000043.jpg', '5.0570484', '2.0570484', '0.0570484', '4.0570484', '2.0570484', '8/12/2016', '1');
INSERT INTO rawPhotos(photo_url, HUMAN, DOG, FOX, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000044.jpg', '5.0570484', '2.0570484', '0.0570484', '4.0570484', '2.0570484', '8/12/2016', '2');
INSERT INTO rawPhotos(photo_url, HUMAN, DOG, FOX, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000045.jpg', '5.0570484', '2.0570484', '0.0570484', '4.0570484', '2.0570484', '8/12/2016', '3');
INSERT INTO rawPhotos(photo_url, DOG, FOX, CAT, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000046.jpg', '5.0570484', '2.0570484', '0.0570484', '4.0570484','8/12/2016', '1');
INSERT INTO rawPhotos(photo_url, COYOTE, FOX, CAT, SQUIRREL, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000047.jpg', '5.0570484', '6.0570484', '0.0570484', '4.0570484','6/17/2016', '2');
INSERT INTO rawPhotos(photo_url, COYOTE, FOX, CAT, SQUIRREL, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000048.jpg', '5.0570484', '2.0570484', '0.0570484', '4.0570484', '6/17/2016', '1');
INSERT INTO rawPhotos(photo_url, COYOTE, FOX, CAT, SQUIRREL, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000049.jpg', '5.0570484', '4.0570484', '0.0570484', '4.0570484', '6/17/2016', '2');
INSERT INTO rawPhotos(photo_url, COYOTE, FOX, CAT, SQUIRREL, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000050.jpg', '5.0570484', '3.0570484', '0.0570484', '4.0570484', '6/17/2016', '4');
INSERT INTO rawPhotos(photo_url, COYOTE, FOX, CAT, SQUIRREL, DOG, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000051.jpg', '9.0570484', '6.0570484', '0.0570484', '4.0570484', '2.0570484', '6/17/2016', '5');
INSERT INTO rawPhotos(photo_url, COYOTE, FOX, CAT, SQUIRREL, DOG, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000052.jpg', '9.0570484', '6.0570484', '0.0570484', '4.0570484', '2.0570484', '4/17/2016', '2');
INSERT INTO rawPhotos(photo_url, COYOTE, FOX, CAT, SQUIRREL, DOG, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000053.jpg', '3.0570484', '6.0570484', '5.0570484', '4.0570484', '2.0570484', '5/17/2016', '1');
INSERT INTO rawPhotos(photo_url, COYOTE, FOX, CAT, SQUIRREL, DOG, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000054.jpg', '6.0570484', '6.0570484', '0.0570484', '4.0570484', '2.0570484', '8/17/2016', '10');
INSERT INTO rawPhotos(photo_url, COYOTE, FOX, CAT, SQUIRREL, DOG, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000055.jpg', '1.0570484', '6.0570484', '0.0570484', '4.0570484', '2.0570484', '8/17/2016', '4');
INSERT INTO rawPhotos(photo_url, SQUIRREL, FOX, CAT, HUMAN, DOG, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000056.jpg', '7.0570484', '6.0570484', '0.0570484', '4.0570484', '2.0570484', '8/17/2016', '1');
INSERT INTO rawPhotos(photo_url, SQUIRREL, FOX, CAT, HUMAN, DOG, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000057.jpg', '7.0570484', '6.0570484', '0.0570484', '4.0570484', '2.0570484', '8/17/2016', '2');
INSERT INTO rawPhotos(photo_url, SQUIRREL, FOX, CAT, HUMAN, DOG, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000058.jpg', '7.0570484', '6.0570484', '0.0570484', '4.0570484', '2.0570484', '8/17/2016', '3');
INSERT INTO rawPhotos(photo_url, SQUIRREL, FOX, CAT, HUMAN, DOG, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000059.jpg', '7.0570484', '6.0570484', '0.0570484', '4.0570484', '2.0570484', '8/17/2016', '4');
INSERT INTO rawPhotos(photo_url, SQUIRREL, FOX, CAT, HUMAN, DOG, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000060.jpg', '7.0570484', '6.0570484', '0.0570484', '4.0570484', '2.0570484', '8/17/2016', '5');
INSERT INTO rawPhotos(photo_url, DOG, FOX, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000061.jpg', '4.0570484', '6.0570484', '5.0570484', '4.0570484', '2.0570484', '5/12/2016', '1');
INSERT INTO rawPhotos(photo_url, DOG, FOX, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000062.jpg', '4.0570484', '6.0570484', '5.0570484', '4.0570484', '2.0570484', '5/12/2016', '9');
INSERT INTO rawPhotos(photo_url, DOG, FOX, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000063.jpg', '4.0570484', '6.0570484', '5.0570484', '4.0570484', '3.0570484', '5/12/2016', '8');
INSERT INTO rawPhotos(photo_url, DOG, FOX, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000064.jpg', '4.0570484', '0.0570484', '5.0570484', '4.0570484', '0.0570484', '5/12/2016', '7');
INSERT INTO rawPhotos(photo_url, DOG, FOX, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000065.jpg', '4.0570484', '6.0570484', '0.0570484', '4.0570484', '2.0570484', '5/12/2016', '6');
INSERT INTO rawPhotos(photo_url, MMV, HUMAN, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000066.jpg', '9.0570484', '7.0570484', '0.0570484', '0.0570484', '0.0570484', '5/12/2016', '1');
INSERT INTO rawPhotos(photo_url, MMV, HUMAN, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000067.jpg', '2.0570484', '7.0570484', '0.0570484', '0.0570484', '0.0570484', '5/12/2016', '2');
INSERT INTO rawPhotos(photo_url, MMV, HUMAN, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000068.jpg', '9.0570484', '1.0570484', '0.0570484', '0.0570484', '0.0570484', '5/12/2016', '3');
INSERT INTO rawPhotos(photo_url, MMV, HUMAN, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000069.jpg', '9.0570484', '1.0570484', '0.0570484', '0.0570484', '0.0570484', '5/12/2016', '7');
INSERT INTO rawPhotos(photo_url, MMV, HUMAN, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000070.jpg', '3.0570484', '1.0570484', '0.0570484', '0.0570484', '0.0570484', '5/12/2016', '8');
INSERT INTO rawPhotos(photo_url, BIGFOOT, HUMAN, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000071.jpg', '3.0570484', '1.0570484', '0.0570484', '0.0570484', '0.0570484', '5/18/2016', '11');
INSERT INTO rawPhotos(photo_url, BIGFOOT, HUMAN, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000072.jpg', '2.0570484', '1.0570484', '0.0570484', '0.0570484', '0.0570484', '5/18/2016', '9');
INSERT INTO rawPhotos(photo_url, BIGFOOT, HUMAN, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000073.jpg', '0.0570484', '0.0570484', '0.0570484', '0.0570484', '0.0570484', '5/8/2016', '1');
INSERT INTO rawPhotos(photo_url, BIGFOOT, HUMAN, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000074.jpg', '0.0570484', '0.0570484', '0.0570484', '0.0570484', '0.0570484', '5/8/2016', '1');
INSERT INTO rawPhotos(photo_url, BIGFOOT, HUMAN, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000075.jpg', '0.0570484', '0.0570484', '0.0570484', '0.0570484', '0.0570484', '5/8/2016', '4');
INSERT INTO rawPhotos(photo_url, BIGFOOT, HUMAN, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000076.jpg', '0.0570484', '0.0570484', '0.0570484', '0.0570484', '0.0570484', '5/8/2016', '6');
INSERT INTO rawPhotos(photo_url, BIGFOOT, HUMAN, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000077.jpg', '0.0570484', '0.0570484', '0.0570484', '0.0570484', '0.0570484', '5/8/2016', '10');
INSERT INTO rawPhotos(photo_url, BIGFOOT, HUMAN, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000078.jpg', '0.0570484', '1.0570484', '0.0570484', '0.0570484', '0.0570484', '5/8/2016', '1');
INSERT INTO rawPhotos(photo_url, BIGFOOT, HUMAN, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000079.jpg', '0.0570484', '0.0570484', '0.0570484', '0.0570484', '0.0570484', '5/8/2016', '11');
INSERT INTO rawPhotos(photo_url, BIGFOOT, HUMAN, CAT, SQUIRREL, COYOTE, photo_date, trail_cam) VALUES ('http://metroparks-hackathon.s3.amazonaws.com/raw-images/image-0000080.jpg', '0.0570484', '0.0570484', '0.0570484', '0.0570484', '0.0570484', '5/8/2016', '3');

INSERT INTO category(title, family, description) VALUES ('Oppossum', 'Didelphimorphia', 'The opossum is a marsupial of the order Didelphimorphia endemic to the Americas. The largest order of marsupials in the Western Hemisphere, it comprises 103 or more species in 19 genera. Opossums originated in South America and entered North America in the Great American Interchange following the connection of the two continents. Their unspecialized biology, flexible diet, and reproductive habits make them successful colonizers and survivors in diverse locations and conditions.');
INSERT INTO category(title, family, description) VALUES ('Deer', 'Cervidae', 'Deer are the ruminant mammals forming the family Cervidae. The two main groups are the Cervinae, including the muntjac, the elk, the fallow deer and the chital, and the Capreolinae, including the reindeer, the roe deer and the moose. Female reindeer, and male deer of all species (except the Chinese water deer), grow and shed new antlers each year. In this they differ from permanently horned antelope, which are part of a different family within the same order of even-toed ungulates. The musk deer of Asia and water chevrotain (or mouse deer) of tropical African and Asian forests are not usually regarded as true deer and form their own families: Moschidae and Tragulidae, respectively. Deer appear in art from Paleolithic cave paintings onwards, and they have played a role in mythology, religion, and literature throughout history, as well as in heraldry. Their economic importance includes the use of their meat as venison, their skins as soft, strong buckskin, and their antlers as handles for knives. Deer hunting has been a popular activity since at least the Middle Ages, and remains an important business today.');
INSERT INTO category(title, family, description) VALUES ('Rabbit', 'Leporidae', 'Rabbits are small mammals in the family Leporidae of the order Lagomorpha (along with the hare and the pika). Oryctolagus cuniculus includes the European rabbit species and its descendants, the worlds 305 breeds of domestic rabbit. Sylvilagus includes thirteen wild rabbit species, among them the seven types of cottontail. The European rabbit, which has been introduced on every continent except Antartica, is familiar throughout the world as a wild prey animal and as a domesticated form of livestock and pet. With its widespread effect on ecologies and cultures, the rabbit (or bunny) is, in many areas of the world, a part of daily life—as food, clothing, and companion, and as a source of artistic inspiration.');
INSERT INTO category(title, family, description) VALUES ('Raccoon', 'Procyonid', 'The raccoon, sometimes spelled racoon, also known as the common raccoon, North American raccoon, northern raccoon, colloquially as coon or trash panda is a medium-sized mammal native to North America. The raccoon is the largest of the procyonid family, having a body length of 40 to 70 cm (16 to 28 in) and a body weight of 5 to 26 kg (11 to 57 lb).[8] Its grayish coat mostly consists of dense underfur which insulates it against cold weather. Three of the raccoons most distinctive features are its extremely dexterous front paws, its facial mask, and its ringed tail, which are themes in the mythologies of the indigenous peoples of the Americas. Raccoons are noted for their intelligence, with studies showing that they are able to remember the solution to tasks for up to three years.[9] The diet of the omnivorous raccoon, which is usually nocturnal, consists of about 40% invertebrates, 33% plant foods, and 27% vertebrates. The original habitats of the raccoon are deciduous and mixed forests, but due to their adaptability they have extended their range to mountainous areas, coastal marshes, and urban areas, where some homeowners consider them to be pests. As a result of escapes and deliberate introductions in the mid-20th century, raccoons are now also distributed across mainland Germany, France, Denmark, Switzerland, Czech Republic, Caucasia, and Japan.');
INSERT INTO category(title, family, description) VALUES ('Turkey', 'Meleagris', 'The turkey is a large bird in the genus Meleagris, which is native to the Americas. Males of both turkey species have a distinctive fleshy wattle or protuberance that hangs from the top of the beak (called a snood). They are among the largest birds in their ranges. As in many galliformes, the male is larger and much more colorful than the female.');
INSERT INTO category(title, family, description) VALUES ('Skunk', 'Mephitidae', 'Skunks are North and South American mammals in the family Mephitidae. Not related to polecats which are in the weasel family, the closest Old World relative to the skunk is the stink badger. The animals are known for their ability to spray a liquid with a strong unpleasant smell. Different species of skunk vary in appearance from black-and-white to brown, cream or ginger colored, but all have warning coloration.');
INSERT INTO category(title, family, description) VALUES ('Bird', 'Avifauna', 'Birds (Aves) are a group of endothermic vertebrates, characterised by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton. Birds live worldwide and range in size from the 5 cm (2 in) bee hummingbird to the 2.75 m (9 ft) ostrich. They rank as the world’s most numerically-successful class of tetrapods, with approximately ten thousand living species, more than half of these being passerines, sometimes known as perching birds. Birds have wings which are more or less developed depending on the species; the only known groups without wings are the extinct moa and elephant birds. Wings, which evolved from forelimbs, gave birds the ability to fly, although further evolution has led to the loss of flight in flightless birds, including ratites, penguins, and diverse endemic island species of birds. The digestive and respiratory systems of birds are also uniquely adapted for flight. Some bird species of aquatic environments, particularly seabirds and some waterbirds, have further evolved for swimming.');
INSERT INTO category(title, family, description) VALUES ('Fox', 'Canidae', 'Foxes are small-to-medium-sized, omnivorous mammals belonging to several genera of the family Canidae. Foxes have a flattened skull, upright triangular ears, a pointed, slightly upturned snout, and a long bushy tail (or brush). Twelve species belong to the monophyletic group of Vulpes genus of "true foxes". Approximately another 25 current or extinct species are always or sometimes called foxes; these foxes are either part of the paraphyletic group of the South American foxes, or of the outlying group, which consists of bat-eared fox, gray fox, and island fox. Foxes live on every continent except Antarctica. By far the most common and widespread species of fox is the red fox (Vulpes vulpes) with about 47 recognized subspecies. The global distribution of foxes, together with their widespread reputation for cunning, has contributed to their prominence in popular culture and folklore in many societies around the world. The hunting of foxes with packs of hounds, long an established pursuit in Europe, especially in the British Isles, was exported by European settlers to various parts of the New World.');
INSERT INTO category(title, family, description) VALUES ('Human', 'Hominini', 'Modern humans (Homo sapiens, ssp. Homo sapiens sapiens) are the only extant members of the subtribe Hominina, a branch of the tribe Hominini belonging to the family of great apes. They are characterized by erect posture and bipedal locomotion; high manual dexterity and heavy tool use compared to other animals; open-ended and complex language use compared to other animal communications; and a general trend toward larger, more complex brains and societies.');
INSERT INTO category(title, family, description) VALUES ('Cat', 'Felidae', 'The domestic cat (Felis silvestris catus or Felis catus) is a small, typically furry, carnivorous mammal. They are often called house cats[6] when kept as indoor pets or simply cats when there is no need to distinguish them from other felids and felines. They are often valued by humans for companionship and for their ability to hunt vermin. There are more than seventy cat breeds recognized by various cat registries. Cats are similar in anatomy to the other felids, with a strong flexible body, quick reflexes, sharp retractable claws and teeth adapted to killing small prey. Cat senses fit a crepuscular and predatory ecological niche. Cats can hear sounds too faint or too high in frequency for human ears, such as those made by mice and other small animals. They can see in near darkness. Like most other mammals, cats have poorer color vision and a better sense of smell than humans. Cats, despite being solitary hunters, are a social species, and cat communication includes the use of a variety of vocalizations (mewing, purring, trilling, hissing, growling and grunting) as well as cat pheromones and types of cat-specific body language.');
INSERT INTO category(title, family, description) VALUES ('Coyote', 'Canidae', 'The coyote, Canis latrans, from Nahuatl About this sound pronunciation, is a canine native to North America. It is smaller than its close relative, the gray wolf, and slightly smaller than the closely related eastern wolf and red wolf. It fills much of the same ecological niche as the golden jackal does in Eurasia, though it is larger and more predatory, and is sometimes called the American jackal by zoologists. The coyote is listed as least concern by the International Union for Conservation of Nature due to its wide distribution and abundance throughout North America, southwards through Mexico, and into Central America. The species is versatile, able to adapt to and expand into environments modified by humans. It is enlarging its range, with coyotes moving into urban areas in the Eastern U.S., and was sighted in eastern Panama (across the Panama Canal from their home range) for the first time in 2013.');
INSERT INTO category(title, family, description) VALUES ('Squirrel', 'Sciuridae', 'Squirrels are members of the family Sciuridae, a family that includes small or medium-size rodents. The squirrel family includes tree squirrels, ground squirrels, chipmunks, marmots (including woodchucks), flying squirrels, and prairie dogs amongst other rodents. Squirrels are indigenous to the Americas, Eurasia, and Africa, and were introduced by humans to Australia. The earliest known squirrels date from the Eocene period and are most closely related to the mountain beaver and to the dormouse among other living rodent families.');
INSERT INTO category(title, family, description) VALUES ('Dog', 'Canines', 'The domestic dog, Canis lupus familiaris or Canis familiaris,is a member of the genus Canis, which forms part of the wolf-like canids, and is the most widely abundant terrestrial carnivore. The dog and the extant gray wolf are sister taxa as modern wolves are not closely related to the wolves that were first domesticated, which implies that the direct ancestor of the dog is extinct. The dog was the first species to be domesticated and has been selectively bred over millennia for various behaviors, sensory capabilities, and physical attributes. Their long association with humans has led dogs to be uniquely attuned to human behavior and they are able to thrive on a starch-rich diet that would be inadequate for other canid species. New research seems to show that dogs have mutations to equivalent genetic regions in humans where changes are known to trigger high sociability and somewhat reduced intelligence. Dogs vary widely in shape, size and colors. Dogs perform many roles for people, such as hunting, herding, pulling loads, protection, assisting police and military, companionship and, more recently, aiding handicapped individuals and therapeutic roles. This influence on human society has given them the sobriquet mans best friend.');
INSERT INTO category(title, family, description) VALUES ('Motorized Vehicle', 'Automobile', 'A motor vehicle is a self-propelled vehicle, commonly wheeled, that does not operate on rails, such as trains or trams and used for the transportation of passengers, or passengers and property. The vehicle propulsion is provided by an engine or motor, usually by an internal combustion engine, or an electric motor, or some combination of the two, such as hybrid electric vehicles and plug-in hybrids. For legal purposes motor vehicles are often identified within a number of vehicle classes including cars, buses, motorcycles, off-road vehicles, light trucks and regular trucks. These classifications vary according to the legal codes of each country. ISO 3833:1977 is the standard for road vehicles types, terms and definitions. Generally to avoid requiring handicapped persons from having to possess an operators license to use one, or requiring tags and insurance, powered wheelchairs will be specifically excluded by law from being considered motor vehicles.');
INSERT INTO category(title, family, description) VALUES ('Sasquatch', 'Cryptozoological Hominid', 'In North American folklore, Bigfoot or Sasquatch is a hairy, upright-walking, ape-like being who reportedly dwells in the wilderness and leaves behind large footprints. Strongly associated with the Pacific Northwest (particularly Washington state and British Columbia), individuals claim to see the creature across North America. Over the years, the creature has inspired numerous commercial ventures and hoaxes. Folklorists trace the figure of Bigfoot to a combination of factors and sources, including folklore surrounding the European wild man figure, folk belief among Native Americans and loggers, and a cultural increase in environmental concerns. A majority of mainstream scientists have historically discounted the existence of Bigfoot, considering it to be a combination of folklore, misidentification, and hoax, rather than a living animal.');


INSERT INTO votes(photo_id, DEER, RABBIT) VALUES (1, 1, 2);
INSERT INTO votes(photo_id, DEER, RABBIT) VALUES (1, 0, 1);
INSERT INTO votes(photo_id, BIRD, RACCOON) VALUES (1, 1, 1);
INSERT INTO votes(photo_id, DOG, RABBIT) VALUES (2, 1, 2);
INSERT INTO votes(photo_id, DEER, RABBIT) VALUES (3, 0, 1);
INSERT INTO votes(photo_id, BIRD, RACCOON) VALUES (2, 1, 1);
INSERT INTO votes(photo_id, DOG, HUMAN) VALUES (50, 1, 3);
INSERT INTO votes(photo_id, DEER, RABBIT) VALUES (6, 0, 1);
INSERT INTO votes(photo_id, BIRD, RACCOON) VALUES (7, 1, 1);
INSERT INTO votes(photo_id, DOG, HUMAN) VALUES (50, 1, 3);
INSERT INTO votes(photo_id, DEER, RABBIT) VALUES (3, 0, 1);
INSERT INTO votes(photo_id, BIRD, RACCOON) VALUES (2, 1, 1);
INSERT INTO votes(photo_id, DOG, BIGFOOT) VALUES (40, 1, 3);