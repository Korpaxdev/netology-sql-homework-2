-- Create Base Tables

CREATE TABLE Genres
(
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Singers
(
    singer_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Albums
(
    album_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    realese_year DATE
);

CREATE TABLE Tracks
(
    track_id SERIAl PRIMARY KEY,
    name VARCHAR(100),
    duration INT,
    album_id INT REFERENCES Albums(album_id)
);

CREATE TABLE Collections
(
    collection_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    realese_year DATE
);

-- Create many - many relations 

CREATE TABLE GenresSingers
(
    genre_id INT REFERENCES Genres(genre_id),
    singer_id INT REFERENCES Singers(singer_id),
    PRIMARY KEY (genre_id, singer_id)
);

CREATE TABLE SingersAlbums
(
    singer_id INT REFERENCES Singers(singer_id),
    album_id INT REFERENCES Albums(album_id),
    PRIMARY KEY (singer_id, album_id)
);

CREATE TABLE TracksColletions
(
    track_id INT REFERENCES Tracks(track_id),
    collection_id INT REFERENCES Collections(collection_id),
    PRIMARY KEY (track_id, collection_id)
);
