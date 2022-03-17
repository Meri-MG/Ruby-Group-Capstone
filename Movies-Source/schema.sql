CREATE TABLE items (
    id  INT PRIMARY KEY,
    publish_date DATE,
    archived BOOLEAN,
    source_id INT,
    FOREIGN KEY (source_id) REFERENCES sources (id)
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

CREATE TABLE sources (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);
