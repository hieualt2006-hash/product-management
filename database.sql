CREATE DATABASE IF NOT EXISTS exam_db;
USE exam_db;

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL,
    quantity INT NOT NULL
);

-- Dữ liệu mẫu ban đầu
INSERT INTO products (name, price, quantity) VALUES
('Bàn phím cơ AKKO', 1250000, 15),
('Chuột Logitech G102', 399000, 30),
('Tai nghe Gaming', 650000, 20);
