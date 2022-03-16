CREATE DATABASE catalog;

CREATE TABLE item (
    id  int PRIMARY KEY,
    publish_date DATE,
    archived boolean,
    FOREIGN KEY (label_id) REFERENCES labels (id)
);

CREATE TABLE books (
    id integer PRIMARY KEY,
    title varchar(100),
    publisher varchar(100),
    cover_state varchar(100),
    publish_date,
    archived boolean,
    FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE labels (
    id integer PRIMARY KEY,
    title varchar(100),
    color varchar(100)
);
