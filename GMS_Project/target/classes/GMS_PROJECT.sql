CREATE DATABASE GMS_PROJECT;
USE GMS_PROJECT;

CREATE TABLE GALLERY_TB(
	GALLERY_ID 		VARCHAR(50) PRIMARY KEY,
    GALLERY_NAME 		VARCHAR(50),
    GALLERY_PASSWORD 		VARCHAR(400),
    GALLERY_NICKNAME 	VARCHAR(50),
    GALLERY_EMAIL 	VARCHAR(50),
    ART_TITLE 	VARCHAR(50),
    ART_CONTENT  VARCHAR(50),
   	ART_SELL 	INT,
    ART_STATUS  VARCHAR(50),
    ART_ARTNUM  INT,
    COMENT_DATE DATE,
    COMENT_TITLE VARCHAR(50),
    COMENT_CONTENT VARCHAR(50),
    COMENT_BEST VARCHAR(50),
    COMENT_BEST_NUM INT,
    COMENT_WORST VARCHAR(50),
    COMENT_WORST_NUM INT,
    ARTIST VARCHAR(50),
    ARTIST_ART VARCHAR(50),
    ARTIST_COMENT VARCHAR(50)
);

SELECT 
		*
FROM
        GALLERY_TB;