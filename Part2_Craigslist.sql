DROP DATABASE craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    Name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    Password TEXT NOT NULL,
    Pref_Region INTEGER UNIQUE REFERENCES region(id) ON DELETE SET NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    Name TEXT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    Title VARCHAR(25) NOT NULL,
    Post_text TEXT NOT NULL,
    user_id INTEGER REFERENCES users,
    Location TEXT NOT NULL,
    Category INTEGER REFERENCES categories(id) NOT NULL,
    Region INTEGER REFERENCES users(Pref_Region) ON DELETE SET NULL
);

insert into region (name) 
VALUES
('Atlanta'),
('Detroit'),
('Another City'),
('????');

insert into users (name, password, pref_region)
VALUES 
('Jrejory', 'jfkdlsaj', 1),
('Greg with a J', 'mfksdlas', 4);

insert into categories (name) VALUES 
('knitting'),
('running around outside'),
('managing your excitement');

insert into posts (title, post_text, user_id, location, category, region) values 
('Look', 'look at this post I made', 1, 'your house', 3, 1);