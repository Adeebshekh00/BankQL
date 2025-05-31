CREATE DATABASE IF NOT EXISTS bank_app;
USE bank_app;

-- USERS TABLE
Drop table if exists users;
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    occupation VARCHAR(50),
    ini_deposit FLOAT,
    city VARCHAR(50),
    state VARCHAR(50)
);

-- ACCOUNTS TABLE
Drop table if exists accounts;
CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    balance FLOAT DEFAULT 0,
    account_type VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Transactions Table
Drop table if exists transactions;
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    from_account INT,
    to_account INT,
    amount FLOAT,
    transaction_type VARCHAR(20), -- deposit, withdrawal, transfer
    date DATE DEFAULT (CURRENT_DATE),
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (from_account) REFERENCES accounts(account_id),
    FOREIGN KEY (to_account) REFERENCES accounts(account_id)
);

ALTER TABLE accounts
ADD COLUMN account_number VARCHAR(20) UNIQUE;

UPDATE accounts
SET account_number = (
    SELECT LEFT(REPLACE(UUID(), '-', ''), 10)
)
WHERE account_number IS NULL;


SELECT * FROM users;
select * from accounts;
select * from transactions;



