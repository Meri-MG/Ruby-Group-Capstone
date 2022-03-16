CREATE DATABASE ruby_capstone;

CREATE TABLE item(
  id SERIAL PRIMARY KEY,
  publish_date date,
  archived boolean,
  genre_id INT,
  source_id INT,
  author_id INT,
  label_id INT,
  CONSTRAINT genre_id
    FOREIGN KEY(genre_id)
      REFERENCES genre(id)
      ON DELETE CASCADE,
  CONSTRAINT source_id
    FOREIGN KEY(source_id)
      REFERENCES source(id)
      ON DELETE CASCADE,
  CONSTRAINT author_id
    FOREIGN KEY(author_id)
      REFERENCES author(id)
      ON DELETE CASCADE,
  CONSTRAINT label_id
    FOREIGN KEY(label_id)
      REFERENCES label(id)
      ON DELETE CASCADE
);

CREATE TABLE book(
  id SERIAL PRIMARY KEY,
  publisher VARCHAR(80),
  cover_state VARCHAR(20),
  publish_date date,
  archived boolean,
  genre_id INT,
  source_id INT,
  author_id INT,
  label_id INT,
  CONSTRAINT genre_id
    FOREIGN KEY(genre_id)
      REFERENCES genre(id)
      ON DELETE CASCADE,
  CONSTRAINT source_id
    FOREIGN KEY(source_id)
      REFERENCES source(id)
      ON DELETE CASCADE,
  CONSTRAINT author_id
    FOREIGN KEY(author_id)
      REFERENCES author(id)
      ON DELETE CASCADE,
  CONSTRAINT label_id
    FOREIGN KEY(label_id)
      REFERENCES label(id)
      ON DELETE CASCADE
);

CREATE TABLE label(
  id SERIAL PRIMARY KEY,
  title VARCHAR(30),
  color VARCHAR(20),
);

CREATE TABLE music_albums(
  id INT GENERATED ALWAYS AS IDENTITY,
  on_spotify BOOLEAN,
  FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE genres(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255)
  PRIMARY KEY(id)
);

CREATE TABLE games(
  id INT GENERATED ALWAYS AS IDENTITY,
  multiplayer BOOLEAN,
  last_played_at DATE,
  FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE author(
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  PRIMARY KEY(id)
);

CREATE TABLE sources(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255)
  PRIMARY KEY(id)
);

CREATE TABLE movies(
  id INT,
  silet BOOLEAN,
  FOREIGN KEY(id) REFERENCES item(id)
);




