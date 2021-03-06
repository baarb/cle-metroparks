-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP SEQUENCE IF EXISTS seq_user_id;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_badge_id;
DROP TABLE IF EXISTS badges;
DROP SEQUENCE IF EXISTS seq_photo_id;
DROP TABLE IF EXISTS rawPhotos;
DROP SEQUENCE IF EXISTS seq_votes_id;
DROP TABLE IF EXISTS votes;
DROP SEQUENCE IF EXISTS seq_vote_animal_id;
DROP TABLE IF EXISTS vote_animal;
DROP SEQUENCE IF EXISTS seq_approved_photo_id;
DROP TABLE IF EXISTS approvedPhotos;
DROP SEQUENCE IF EXISTS seq_users_badges_id;
DROP TABLE IF EXISTS users_badges;
DROP SEQUENCE IF EXISTS seq_users_photos_id;
DROP TABLE IF EXISTS users_photos;



CREATE SEQUENCE seq_badge_id;
CREATE TABLE badges
(
	badge_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_badge_id'),
	title VARCHAR(200) NOT NULL,
	description VARCHAR(2000) NOT NULL,
	badge_url VARCHAR(200) NOT NULL,
	disabled_badge_url VARCHAR(200) NOT NULL
);

CREATE SEQUENCE seq_user_id;
CREATE TABLE users
(
	user_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_user_id'),
	user_name VARCHAR(200) NOT NULL,
	password  VARCHAR(300) NOT NULL,
	salt VARCHAR(255) NOT NULL,
	email VARCHAR(200) NOT NULL,
	score INTEGER DEFAULT 0,
	user_avatar INTEGER
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

CREATE SEQUENCE seq_votes_id;
CREATE TABLE votes
(
	vote_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_votes_id'),
	photo_id INTEGER NOT null REFERENCES rawPhotos,
	user_id INTEGER NOT null REFERENCES users,
	rating INTEGER
);

CREATE SEQUENCE seq_vote_animal_id;
CREATE TABLE votes_animal
(
	votes_animal_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_vote_animal_id'),
	vote_id INTEGER REFERENCES votes,
	animal_id VARCHAR(200) NOT NULL,
	num_animals INTEGER NOT NULL
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

CREATE SEQUENCE seq_users_badges_id;
CREATE TABLE users_badges
(
	users_badges_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_users_badges_id'),
	user_id INTEGER NOT null REFERENCES users,
	badge_id INTEGER NOT null REFERENCES badges
);

CREATE SEQUENCE seq_users_photos_id;
CREATE TABLE users_photos
(
	users_photos_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_users_photos_id'),
	user_id INTEGER NOT null REFERENCES users,
	photo_id INTEGER NOT null REFERENCES rawPhotos
);


COMMIT;