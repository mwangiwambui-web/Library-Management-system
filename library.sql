-- =============================
-- Library Management System DB
-- =============================

-- Drop and recreate the database
DROP DATABASE IF EXISTS LibraryDB;
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- =============================
-- Tables and Relationships
-- =============================

-- Authors Table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- Books Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) UNIQUE NOT NULL,
    publication_year INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Book_Authors Table (Many-to-Many)
CREATE TABLE Book_Authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Members Table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE NOT NULL
);

-- Staff Table
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Loans Table
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    staff_id INT,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

-- Fines Table
CREATE TABLE Fines (
    fine_id INT AUTO_INCREMENT PRIMARY KEY,
    loan_id INT UNIQUE,
    amount DECIMAL(6,2) NOT NULL,
    paid BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (loan_id) REFERENCES Loans(loan_id)
);

-- =============================
-- Sample Data Insertion
-- =============================

-- Authors
INSERT INTO Authors (first_name, last_name) VALUES
('George', 'Orwell'),
('Harper', 'Lee'),
('J.K.', 'Rowling'),
('Jane', 'Austen');

-- Categories
INSERT INTO Categories (category_name) VALUES
('Fiction'),
('Science Fiction'),
('Historical'),
('Fantasy');

-- Books
INSERT INTO Books (title, isbn, publication_year, category_id) VALUES
('1984', '9780451524935', 1949, 2),
('To Kill a Mockingbird', '9780061120084', 1960, 1),
('Harry Potter and the Sorcerer\'s Stone', '9780747532699', 1997, 4),
('Pride and Prejudice', '9780141439518', 1813, 3);

-- Book_Authors
INSERT INTO Book_Authors (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Members
INSERT INTO Members (first_name, last_name, email, join_date) VALUES
('Alice', 'Johnson', 'alice@example.com', '2023-05-01'),
('Bob', 'Smith', 'bob@example.com', '2023-06-15');

-- Staff
INSERT INTO Staff (first_name, last_name, email) VALUES
('Emma', 'Brown', 'emma.brown@library.com'),
('Liam', 'Wilson', 'liam.wilson@library.com');

-- Loans
INSERT INTO Loans (book_id, member_id, staff_id, loan_date, due_date, return_date) VALUES
(1, 1, 1, '2024-04-01', '2024-04-15', '2024-04-10'),
(2, 2, 2, '2024-04-05', '2024-04-20', NULL),
(3, 1, 1, '2024-05-01', '2024-05-15', NULL);

-- Fines
INSERT INTO Fines (loan_id, amount, paid) VALUES
(2, 5.00, FALSE);
