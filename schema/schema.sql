CREATE TABLE genres (
    id  INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE sources (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE labels (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    color VARCHAR(100)
);

CREATE TABLE authors (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

CREATE TABLE items (
    id  INT GENERATED ALWAYS AS IDENTITY,
    source_id INT,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    PRIMARY KEY(id),
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (author_id) REFERENCES authors (id),
    FOREIGN KEY (label_id) REFERENCES labels (id),
    FOREIGN KEY (source_id) REFERENCES sources (id)
);

CREATE TABLE books (
    id INTEGER PRIMARY KEY,
    title VARCHAR(100),
    publisher VARCHAR(100),
    cover_state VARCHAR(100),
    publish_date DATE,
    archived BOOLEAN,
    item_id INT,
    FOREIGN KEY(item_id) REFERENCES items(id)
);

CREATE TABLE movies (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    silent BOOLEAN,
    publish_date DATE,
    archived BOOLEAN,
    item_id INT,
    FOREIGN KEY(item_id) REFERENCES item(id)
);

CREATE TABLE music_albums (
    id  INT PRIMARY KEY,
    name VARCHAR(100),
    on_spotify BOOLEAN,
    item_id INT,
    FOREIGN KEY(item_id) REFERENCES item(id)
);

CREATE TABLE games(
    id INT GENERATED ALWAYS AS IDENTITY,
    multiplayer BOOLEAN,
    last_played_at DATE,
    item_id INT,
    FOREIGN KEY(item_id) REFERENCES item(id)
);
