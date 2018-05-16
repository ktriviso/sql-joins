DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS spotify_user;
DROP TABLE IF EXISTS track;
DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS artist;

CREATE TABLE artist(
  id VARCHAR(255) PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE album(
  name VARCHAR(255),
  label VARCHAR(255),
  id VARCHAR(255) PRIMARY KEY
);

CREATE TABLE track(
  name VARCHAR(255),
  artist_id VARCHAR(255) REFERENCES artist(id),
  album_id VARCHAR(255) REFERENCES album(id),
  disc_number INTEGER,
  popularity INTEGER,
  id VARCHAR(255) PRIMARY KEY

);

\copy artist FROM './data/artist.csv' WITH (FORMAT csv); 
\copy album FROM './data/album.csv' WITH (FORMAT csv); 
\copy track FROM './data/track.csv' WITH (FORMAT csv); 
