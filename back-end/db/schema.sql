DROP DATABASE IF EXISTS artnet_db;

CREATE DATABASE artnet_db;

\c artnet_db;

DROP TABLE IF EXISTS users;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username TEXT,
    email TEXT,
    password TEXT,
    phone_number TEXT,
    is_artist BOOLEAN,
    is_gallery BOOLEAN
);

DROP TABLE IF EXISTS artwork;

CREATE TABLE artwork(
    id SERIAL PRIMARY KEY, 
    title TEXT,
    artist_id INT REFERENCES users(id)
        ON DELETE CASCADE,
    image TEXT
);

-- COME BACK LATER --
-- DROP TABLE IF EXISTS artist_request;

-- CREATE TABLE artist_request(
--     id SERIAL PRIMARY KEY, 
--     artist_id INT REFERENCES users(id),
--     owner_id INT REFERENCES galleries(id),
--     gallery_id INT REFERENCES users(id),
--     message TEXT
-- );

DROP TABLE IF EXISTS galleries;

CREATE TABLE galleries(
    id SERIAL PRIMARY KEY, 
    name TEXT,
    owner_id INT REFERENCES user(id),
    address TEXT
);

--COME BACK LATER --
-- DROP TABLE IF EXISTS gallery_request;

-- CREATE TABLE gallery_request(
--     id SERIAL PRIMARY KEY, 
--     artist_id INT REFERENCES users(id),
--     owner_id INT REFERENCES galleries(id),
--     gallery_id INT REFERENCES users(id),
--     message TEXT
-- );

DROP TABLE IF EXISTS gallery_images;

CREATE TABLE gallery_images(
    id SERIAL PRIMARY KEY, 
    gallery_id INT REFERENCES users(id),
    photo_url TEXT
);
