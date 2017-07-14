--run this file with psql -a -f buildings.sql

CREATE DATABASE chicago;

\c chicago;

CREATE TABLE buildings (id SERIAL PRIMARY KEY,
name VARCHAR(255), address VARCHAR(255), height INT,
image_url VARCHAR(255), designer VARCHAR(255));
