CREATE DATABASE GMS_PROJECT;
USE GMS_PROJECT;

CREATE TABLE GALLERY_MEMBER(
	GALLERY_ID 		VARCHAR(50) PRIMARY KEY,
    GALLERY_NAME 		VARCHAR(50),
    GALLERY_PASSWORD 		VARCHAR(500),
    GALLERY_NICKNAME 	VARCHAR(50),
    GALLERY_EMAIL 	VARCHAR(50),
	ROADADDRESS 		VARCHAR(500),
	JIBUNADDRESS 		VARCHAR(500),
	NAMUJIADDRESS 		VARCHAR(500),
    ZIPCODE 			VARCHAR(20),
	JOIN_DATE 			DATE
);

CREATE TABLE GALLERY_ADMIN(
	ART_TITLE 	VARCHAR(50),
    ART_CONTENT  VARCHAR(50),
   	ART_SELL 	INT,
    ART_STATUS  VARCHAR(50),
    ART_ARTNUM  INT,
    ARTIST VARCHAR(50),
    ARTIST_ART VARCHAR(50),
    ARTIST_COMENT VARCHAR(50),
    SHOW_NAME			VARCHAR(100),
    START_DATE			DATE,
    END_DATE			DATE,
    MAIN_ART      VARCHAR(500)
);
CREATE TABLE GALLERY_SHOP(
	COMENT_DATE DATE,
    COMENT_TITLE VARCHAR(50),
    COMENT_CONTENT VARCHAR(50),
    COMENT_BEST VARCHAR(50),
    COMENT_BEST_NUM INT,
    COMENT_WORST VARCHAR(50),
    COMENT_WORST_NUM INT
);
SELECT 
		*
FROM
        GALLERY_MEMBER;

SELECT 
		*
FROM
        GALLERY_ADMIN;
        
SELECT 
		*
FROM
        GALLERY_SHOP;
