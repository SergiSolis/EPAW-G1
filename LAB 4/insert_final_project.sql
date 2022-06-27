USE epawtwitter;

DELETE FROM epawtwitter.like;
DELETE FROM epawtwitter.retweet;
DELETE FROM epawtwitter.follow;
DELETE FROM epawtwitter.pet_user;
DELETE FROM epawtwitter.pet_picture;
DELETE FROM epawtwitter.tweet;
ALTER TABLE epawtwitter.tweet AUTO_INCREMENT = 1;
DELETE FROM epawtwitter.user;
ALTER TABLE epawtwitter.user AUTO_INCREMENT = 1;
DELETE FROM epawtwitter.location;
ALTER TABLE epawtwitter.location AUTO_INCREMENT = 1;
DELETE FROM epawtwitter.pet;
ALTER TABLE epawtwitter.pet AUTO_INCREMENT = 1;
DELETE FROM epawtwitter.picture;
ALTER TABLE epawtwitter.picture AUTO_INCREMENT = 1;


INSERT INTO epawtwitter.location(zipcode, country, city) VALUES ("08800", "Spain", "Vilanova i la Geltrú");

INSERT INTO epawtwitter.user(name, username, mail, phone, pwd, gender, type, dateAccountCreated,profilePicture) VALUES ("admin", "admin", "admin@gmail.com", "682036242", "Aa123456", "M", "A", "2020-12-01 00:00:00","imgs/avatar3.png");
INSERT INTO epawtwitter.user(name, username, mail, phone, pwd, gender, type, dateAccountCreated,profilePicture) VALUES ("toni", "aaaa1", "aaaa1@gmail.com", "682036242", "Aa123456", "M", "U", "2020-12-01 00:00:00","imgs/avatar3.png");
INSERT INTO epawtwitter.user(name, username, mail, phone, pwd, gender, type, dateAccountCreated,profilePicture) VALUES ("claudia", "aaaa2", "aaaa2@gmail.com", "682036242", "Aa123456", "F", "U", "2020-12-01 00:00:00","imgs/avatar3.png");
INSERT INTO epawtwitter.user(name, username, mail, phone, pwd, gender, type, dateAccountCreated,profilePicture) VALUES ("martina", "aaaa3", "aaaa3@gmail.com", "682036242", "Aa123456", "F", "U", "2020-12-01 00:00:00","imgs/avatar3.png");
INSERT INTO epawtwitter.user(name, username, mail, phone, pwd, gender, type, dateAccountCreated, zipcode,profilePicture) VALUES ("mireia", "aaaa4", "aaaa4@gmail.com", "682036242", "Aa123456", "F","U", "2020-12-01 00:00:00", "08800","imgs/avatar3.png");

INSERT INTO epawtwitter.tweet(postDateTime, content, isPrivileged, uid) VALUES ("2020-12-01 00:00:00", "Hola", False, 1);
INSERT INTO epawtwitter.tweet(postDateTime, content, isPrivileged, parent, uid) VALUES ("2021-12-01 00:00:00", "Alo", False, 1, 1);
INSERT INTO epawtwitter.tweet(postDateTime, content, isPrivileged, parent, uid) VALUES ("2021-10-01 00:00:00", "Bon jour", False, 1, 2);
INSERT INTO epawtwitter.tweet(postDateTime, content, isPrivileged, parent, uid) VALUES ("2021-11-01 00:00:00", "Hello", False, 1, 3);
INSERT INTO epawtwitter.tweet(postDateTime, content, isPrivileged, uid) VALUES ("2021-09-01 00:00:00", "Exacte", False, 4);
INSERT INTO epawtwitter.tweet(postDateTime, content, isPrivileged, uid) VALUES ("2020-12-01 00:00:00", "Perfecte", False, 4);

INSERT INTO epawtwitter.pet(name, typeOfAnimal) VALUES ("rodolfo", "gos");

INSERT INTO epawtwitter.picture(content, creationTime) VALUES ("hello", "2020-12-01");

INSERT INTO epawtwitter.like(uid, tid) VALUES (2,1);

INSERT INTO epawtwitter.retweet(uid, tid) VALUES (3,1);

INSERT INTO epawtwitter.follow(uid, fid) VALUES (1,2);
INSERT INTO epawtwitter.follow(uid, fid) VALUES (1,3);
INSERT INTO epawtwitter.follow(uid, fid) VALUES (2,3);
INSERT INTO epawtwitter.follow(uid, fid) VALUES (2,1);
INSERT INTO epawtwitter.follow(uid, fid) VALUES (2,5);
INSERT INTO epawtwitter.follow(uid, fid) VALUES (3,1);
INSERT INTO epawtwitter.follow(uid, fid) VALUES (3,4);
INSERT INTO epawtwitter.follow(uid, fid) VALUES (4,2);
INSERT INTO epawtwitter.follow(uid, fid) VALUES (4,3);
INSERT INTO epawtwitter.follow(uid, fid) VALUES (4,5);
INSERT INTO epawtwitter.follow(uid, fid) VALUES (4,1);
INSERT INTO epawtwitter.follow(uid, fid) VALUES (5,2);

INSERT INTO epawtwitter.pet_user(uid, pid) VALUES (4,1);

INSERT INTO epawtwitter.pet_picture(pid, piid) VALUES (1,1);