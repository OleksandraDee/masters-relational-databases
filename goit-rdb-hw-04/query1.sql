CREATE SCHEMA IF NOT EXISTS LibraryManagement;
USE LibraryManagement;

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publication_year YEAR,
    author_id INT,
    genre_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE borrowed_books (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

SET SQL_SAFE_UPDATES = 0;

INSERT INTO authors (author_name)
VALUES 
('George Orwell'),
('Jane Austen');

INSERT INTO genres (genre_name)
VALUES 
('Dystopian'),
('Romance');


INSERT INTO users (username, email)
VALUES
('alice', 'alice@example.com'),
('bob', 'bob@example.com');

INSERT INTO books (title, publication_year, author_id, genre_id)
VALUES
('1984', 1949, 1, 1),
('Pride and Prejudice', 1813, 2, 2);

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date)
VALUES
(11, 1, '2024-01-10', '2024-01-20'),
(12, 2, '2024-02-05', NULL);

DELETE FROM borrowed_books;
DELETE FROM books;


SELECT * FROM authors;
SELECT * FROM genres;
SELECT * FROM books;
SELECT * FROM users;
SELECT * FROM borrowed_books;

