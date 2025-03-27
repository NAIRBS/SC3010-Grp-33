-- fake_db.sql

CREATE DATABASE IF NOT EXISTS fake_database;
USE fake_database;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100)
);

INSERT INTO users (username, password, email) VALUES
('admin', 'password123', 'admin@example.com'),
('user1', '123456', 'user1@example.com'),
('user2', 'abcdef', 'user2@example.com');
