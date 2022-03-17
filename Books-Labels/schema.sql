CREATE TABLE items (
    id  INTEGER PRIMARY KEY,
    publish_date DATE,
    archived BOOLEAN,
    label_id INT,
    FOREIGN KEY (label_id) REFERENCES labels (id)
);

CREATE TABLE books (
    id INTEGER PRIMARY KEY,
    title VARCHAR(100),
    publisher VARCHAR(100),
    cover_state VARCHAR(100),
    publish_date DATE,
    archived BOOLEAN,
    item_id INT,
    FOREIGN KEY(item_id) REFERENCES item(id)
);

CREATE TABLE labels (
    id INTEGER PRIMARY KEY,
    title VARCHAR(100),
    color VARCHAR(100)
);
