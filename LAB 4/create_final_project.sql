DROP SCHEMA IF EXISTS epawtwitter;
CREATE DATABASE IF NOT EXISTS epawtwitter;
USE epawtwitter;
    
CREATE TABLE epawtwitter.location(
	zipcode VARCHAR(20) UNIQUE NOT NULL PRIMARY KEY,
	country VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL);
    
    
CREATE TABLE epawtwitter.user(
	uid INT UNIQUE AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    username VARCHAR(30) UNIQUE NOT NULL,
    mail VARCHAR(50) UNIQUE NOT NULL,
    phone INT NOT NULL,
    pwd VARCHAR(50) NOT NULL,
    gender ENUM('NS', 'F', 'M'),
    profilePicture VARCHAR(50),
    backgroundPicture VARCHAR(50),
    state VARCHAR(255),
    type ENUM('V', 'A', 'U') NOT NULL,
    birthday DATE,
    dateAccountCreated DATE NOT NULL,
    zipcode VARCHAR(20),
    CONSTRAINT location_fk FOREIGN KEY (zipcode) REFERENCES location (zipcode));
    
CREATE TABLE epawtwitter.tweet(
	tid INT UNIQUE AUTO_INCREMENT NOT NULL PRIMARY KEY,
	uid INT NOT NULL,
    postDateTime DATETIME NOT NULL,
    content VARCHAR(280) NOT NULL,
    isPrivileged BOOLEAN DEFAULT FALSE,
    parent INT,
    CONSTRAINT parent_fk FOREIGN KEY (parent) REFERENCES tweet (tid) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uid_fk FOREIGN KEY (uid) REFERENCES epawtwitter.user (uid));
    
CREATE TABLE epawtwitter.pet(
	pid INT UNIQUE AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    typeOfAnimal VARCHAR(30) NOT NULL,
    breed VARCHAR(30),
    birthday DATE,
    gender ENUM('NS', 'F', 'M'),
    profilePicture VARCHAR(50));
    
CREATE TABLE epawtwitter.picture(
	piid INT UNIQUE AUTO_INCREMENT NOT NULL PRIMARY KEY,
    content VARCHAR(50) NOT NULL,
    creationTime DATETIME NOT NULL);
    
CREATE TABLE epawtwitter.like(
	uid INT NOT NULL,
    tid INT NOT NULL,
    CONSTRAINT junction_like_PK PRIMARY KEY (uid, tid),
    CONSTRAINT uid_like_fk FOREIGN KEY (uid) REFERENCES epawtwitter.user (uid),
	CONSTRAINT tid_like_fk FOREIGN KEY (tid) REFERENCES tweet (tid));

CREATE TABLE epawtwitter.retweet(
	uid INT NOT NULL,
    tid INT NOT NULL,
    CONSTRAINT retweet_PK PRIMARY KEY (uid, tid),
    CONSTRAINT uid_retweet_fk FOREIGN KEY (uid) REFERENCES epawtwitter.user (uid),
	CONSTRAINT tid_retweet_fk FOREIGN KEY (tid) REFERENCES tweet (tid));

CREATE TABLE epawtwitter.follow(
	uid INT NOT NULL,
    fid INT NOT NULL,
    CONSTRAINT follow_PK PRIMARY KEY (uid, fid),
    CONSTRAINT uid_follow_fk FOREIGN KEY (uid) REFERENCES epawtwitter.user (uid),
	CONSTRAINT fid_follow_fk FOREIGN KEY (fid) REFERENCES epawtwitter.user (uid));

CREATE TABLE epawtwitter.pet_user(
	uid INT NOT NULL,
    pid INT NOT NULL,
    CONSTRAINT pet_user_PK PRIMARY KEY (uid, pid),
    CONSTRAINT uid_pet_user_fk FOREIGN KEY (uid) REFERENCES epawtwitter.user (uid),
	CONSTRAINT pid_pet_user_fk FOREIGN KEY (pid) REFERENCES pet (pid));

CREATE TABLE epawtwitter.pet_picture(
	pid INT NOT NULL,
    piid INT NOT NULL,
    CONSTRAINT pet_picture_PK PRIMARY KEY (pid, piid),
    CONSTRAINT pid_pet_picture_fk FOREIGN KEY (pid) REFERENCES pet (pid),
	CONSTRAINT piid_pet_picture_fk FOREIGN KEY (piid) REFERENCES picture (piid));
