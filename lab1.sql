CREATE DATABASE IF NOT EXISTS epaw;
# DROP DATABASE epaw;

USE epaw;

CREATE TABLE IF NOT EXISTS user (
nom VARCHAR(24),
descripcio VARCHAR(255),
id INTEGER NOT NULL AUTO_INCREMENT,
telefon INTEGER,
PRIMARY KEY (id) );

USE epaw;
INSERT INTO user (nom, descripcio, telefon) VALUES ('Carla', 'actriu', '111111111');
INSERT INTO user (nom, descripcio, telefon) VALUES ('Marc', 'enginyer', '222222222');
INSERT INTO user (nom, descripcio, telefon) VALUES ('Silvia', 'professora', '333333333');
INSERT INTO user (nom, descripcio, telefon) VALUES ('Pau', 'estudiant', '444444444');