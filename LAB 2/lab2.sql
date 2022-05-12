CREATE DATABASE IF NOT EXISTS epawTwitter;
# DROP DATABASE epawTwitter;

USE epawTwitter;

DROP  TABLE IF EXISTS pets_users;
DROP  TABLE IF EXISTS users;
DROP  TABLE IF EXISTS pets;

CREATE TABLE users (
	name VARCHAR(255) NOT NULL,
  	usr VARCHAR(255) NOT NULL,
  	mail VARCHAR(255) NOT NULL,
  	phone VARCHAR(255) NOT NULL,
  	pwd VARCHAR(255) NOT NULL,
  	gender VARCHAR(255),
  	PRIMARY KEY (usr),
  	UNIQUE KEY mail (mail)
	); 


CREATE TABLE pets (
	 	id INTEGER NOT NULL AUTO_INCREMENT,
	 	type VARCHAR(255) NOT NULL,
 		name VARCHAR(255) NOT NULL,
 		breed VARCHAR(255),
 		gender VARCHAR(255),
 		birth_date VARCHAR(255),
 		PRIMARY KEY (id)
	 );


CREATE TABLE pets_users (
	 	username VARCHAR(255) NOT NULL,
	 	pet_id INTEGER NOT NULL,
		PRIMARY KEY (username),
		CONSTRAINT username_ FOREIGN KEY (username)
    	REFERENCES users (usr),
    	CONSTRAINT pet_id_ FOREIGN KEY (pet_id)
    	REFERENCES pets (id)
	 );