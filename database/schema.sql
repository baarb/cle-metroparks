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
DROP SEQUENCE IF EXISTS seq_vote_id;
DROP TABLE IF EXISTS votes;
DROP SEQUENCE IF EXISTS seq_approved_photo_id;
DROP TABLE IF EXISTS approvedPhotos;

CREATE SEQUENCE seq_user_id;
CREATE TABLE users
(
	user_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_user_id'),
	user_name VARCHAR(200) NOT NULL,
	password  VARCHAR(300) NOT NULL,
	salt VARCHAR(255) NOT NULL,
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
	user_id INTEGER NOT null REFERENCES users,
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

COMMIT;