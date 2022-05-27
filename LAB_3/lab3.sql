CREATE DATABASE IF NOT EXISTS epawTwitter;
# DROP DATABASE epawTwitter;

USE epawTwitter;

DROP  TABLE IF EXISTS users;

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


