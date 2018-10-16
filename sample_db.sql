CREATE TABLE users (
id INT NOT NULL AUTO_INCREMENT,
username VARCHAR(255) NOT NULL,
password VARCHAR(20) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE artists (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE albums (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
year YEAR(4),
artist_id INT,
PRIMARY KEY (id),
FOREIGN KEY(artist_id)
REFERENCES artists(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);


CREATE TABLE songs (
id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
length INT NOT NULL,
genre VARCHAR(255) NOT NULL,
album_id INT,
PRIMARY KEY (id),
FOREIGN KEY (album_id)
REFERENCES albums(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);


CREATE TABLE users (
id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
length VARCHAR(255) NOT NULL,
genre VARCHAR(255) NOT NULL,
year int(255) NOT NULL,
album_id
PRIMARY KEY (id)
);

CREATE TABLE playlists (
id INT NOT NULL AUTO_INCREMENT,
date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
user_id INT,
PRIMARY KEY (id),
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE SET NULL
ON UPDATE CASCADE
);

CREATE TABLE songs_playlists (
id INT NOT NULL AUTO_INCREMENT,
song_id INT,
playlist_id INT,
PRIMARY KEY (id),
FOREIGN KEY (song_id)
REFERENCES songs(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(playlist_id)
REFERENCES playlists(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

--Inserting values
INSERT INTO artists (name) VALUES ("Rivermaya");
INSERT INTO albums (name, year, artist_id) VALUES ("Trip", 1996, 1);


INSERT INTO artists (name) VALUES ("Psy");

INSERT INTO albums (name, year, artist_id) VALUES ("Psy 6", 2012, 2);

INSERT INTO songs (title, length, genre, album_id) VALUES ("Gangnam Style", 253, "k-pop", 2);

INSERT INTO songs (title, length, genre, album_id) VALUES ("Kundiman", 234, "OPM", 1);

INSERT INTO songs (title, length, genre, album_id) VALUES ("Kisapmata", 279, "OPM", 1);

SELECT title, genre FROM songs;

SELECT * FROM songs;

SELECT title FROM songs WHERE genre = "opm";

SELECT title, length FROM songs WHERE length > 240 AND genre = "opm";

--edit kundiman's length to 240
UPDATE songs SET length = 240 WHERE title = "Kundiman";
SELECT title, length FROM songs where title = "Kundiman";

--users: username: adam adam password: apple, username: eve password: orange
instructions
update functionality
	update beatles to "The Beatles"
		update the genre opm to 90's opm
			update the time of "Come together" to 240 seconds

delete functionality

	delete psy's gangnam Styledelete eve from the user's TABLE

retrieve functionality
select all songs belong to 90's opmselect all songs greater than 240 seconds in length
select all songs by rivermaya

-- 
INSERT INTO users(username, password) VALUES("adam", "apple");
INSERT INTO users(username, password) VALUES("eve", "orange");

--add eheads and beatles
INSERT INTO artists(name) VALUES("Eraserheads");
INSERT INTO artists(name) VALUES("Beatles");
SELECT * FROM artists;

-- add abbey road and cutterpillow
INSERT INTO albums (name, artist_id, year) VALUES("Abbey road", 4, 1969);
INSERT INTO albums (name, artist_id, year) VALUES("Cutterpillow", 3, 1995);

--add 4 songs to the table

INSERT INTO songs (title, length, genre, album_id) VALUES("Huling El Bimbo", 449, "OPM", 4);
INSERT INTO songs (title, length, genre, album_id) VALUES("Torpedo", 257, "OPM", 4);
INSERT INTO songs (title, length, genre, album_id) VALUES("Come together", 259, "Rock", 3);
INSERT INTO songs (title, length, genre, album_id) VALUES("Here comes the sun", 185, "Rock", 3);
SELECT * FROM songs;

INSERT INTO playlists(user_id) VALUES (1);
SELECT * FROM playlists;

-- addings songs to the playlist
--huling elbimbo
INSERT INTO songs_playlists(song_id, playlist_id) VALUES (4,1);
--come together
INSERT INTO songs_playlists(song_id, playlist_id) VALUES (6,1);

--change beatles to the beatles
UPDATE artists SET name = "The Beatles" WHERE name = "Beatles";
SELECT * FROM artists WHERE name = "The Beatles";

UPDATE songs SET genre = "90's OPM" WHERE genre = "OPM";
SELECT genre FROM songs WHERE genre = "90's OPM";

UPDATE songs SET length = 240 WHERE title = "Come together";

--delete psy's gangnam style and eve's
DELETE FROM songs WHERE title = "Gangnam stle";
DELETE FROM users WHERE username = "eve";

--select all songs
SELECT * FROM songs WHERE genre = "90's OPM";
SELECT * FROM songs WHERE length > 240;
SELECT * FROM songs WHERE artist = "Rivermaya";