CREATE DATABASE catalog;

CREATE TABLE item (
    id  INT GENERATED ALWAYS AS IDENTITY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    PRIMARY KEY(id),
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (author_id) REFERENCES authors (id),
    FOREIGN KEY (label_id) REFERENCES labels (id)
);

CREATE TABLE genres (
    id  INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY(id)
);


CREATE TABLE music_albums (
    id  INT,
    name VARCHAR(100),
    on_spotify BOOLEAN,
    FOREIGN KEY(id) REFERENCES item(id)
);

-- CREATE TABLE authors 
-- CREATE TABLE labels 



-- CREATE TABLE games
-- CREATE TABLE books 
