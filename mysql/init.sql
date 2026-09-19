CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- =========================
-- CUSTOMERS
-- =========================

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    city VARCHAR(100),
    state VARCHAR(50),
    created_at DATE
);

-- =========================
-- PRODUCTS
-- =========================

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10,2) NOT NULL
);

-- =========================
-- ORDERS
-- =========================

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    traffic_source VARCHAR(50),
    payment_method VARCHAR(50),
    status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- =========================
-- ORDER ITEMS
-- =========================

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- =========================
-- CUSTOMERS
-- =========================

INSERT INTO customers
(name, email, city, state, created_at)
VALUES
('Ana Silva', 'ana@email.com', 'São Paulo', 'SP', '2025-01-10'),
('Bruno Santos', 'bruno@email.com', 'Rio de Janeiro', 'RJ', '2025-01-15'),
('Carla Oliveira', 'carla@email.com', 'Belo Horizonte', 'MG', '2025-02-03'),
('Daniel Costa', 'daniel@email.com', 'Salvador', 'BA', '2025-02-20'),
('Eduarda Lima', 'eduarda@email.com', 'Recife', 'PE', '2025-03-01'),
('Felipe Souza', 'felipe@email.com', 'Curitiba', 'PR', '2025-03-15'),
('Gabriela Rocha', 'gabriela@email.com', 'Porto Alegre', 'RS', '2025-04-02'),
('Henrique Alves', 'henrique@email.com', 'Brasília', 'DF', '2025-04-18'),
('Isabela Martins', 'isabela@email.com', 'Fortaleza', 'CE', '2025-05-01'),
('João Pereira', 'joao@email.com', 'Teresina', 'PI', '2025-05-20'),
('Larissa Mendes', 'larissa@email.com', 'Campinas', 'SP', '2025-06-05'),
('Lucas Ferreira', 'lucas@email.com', 'Niterói', 'RJ', '2025-06-18'),
('Mariana Castro', 'mariana@email.com', 'Goiânia', 'GO', '2025-07-02'),
('Nicolas Ribeiro', 'nicolas@email.com', 'Manaus', 'AM', '2025-07-20'),
('Olivia Barbosa', 'olivia@email.com', 'Natal', 'RN', '2025-08-10');

-- =========================
-- PRODUCTS
-- =========================

INSERT INTO products
(product_name, category, price)
VALUES
('Wireless Headphones', 'Electronics', 299.90),
('Mechanical Keyboard', 'Electronics', 449.90),
('Wireless Mouse', 'Electronics', 129.90),
('USB-C Hub', 'Accessories', 159.90),
('Laptop Stand', 'Accessories', 189.90),
('Webcam Full HD', 'Electronics', 249.90),
('Smartwatch', 'Wearables', 599.90),
('Fitness Band', 'Wearables', 299.90),
('Backpack', 'Accessories', 219.90),
('Desk Lamp', 'Home Office', 139.90);

-- =========================
-- ORDERS
-- =========================

INSERT INTO orders
(customer_id, order_date, traffic_source, payment_method, status)
VALUES
(1, '2025-08-01', 'Google', 'Credit Card', 'Completed'),
(2, '2025-08-02', 'Instagram', 'Pix', 'Completed'),
(3, '2025-08-03', 'Google', 'Credit Card', 'Completed'),
(4, '2025-08-05', 'Direct', 'Pix', 'Completed'),
(5, '2025-08-07', 'Facebook', 'Credit Card', 'Completed'),
(6, '2025-08-09', 'Google', 'Pix', 'Completed'),
(7, '2025-08-11', 'Instagram', 'Credit Card', 'Completed'),
(8, '2025-08-13', 'Email', 'Pix', 'Completed'),
(9, '2025-08-15', 'Google', 'Credit Card', 'Completed'),
(10, '2025-08-17', 'Direct', 'Pix', 'Completed'),
(11, '2025-08-19', 'Instagram', 'Credit Card', 'Completed'),
(12, '2025-08-21', 'Facebook', 'Pix', 'Completed'),
(13, '2025-08-23', 'Google', 'Credit Card', 'Completed'),
(14, '2025-08-25', 'Email', 'Pix', 'Completed'),
(15, '2025-08-27', 'Google', 'Credit Card', 'Completed'),
(1, '2025-08-29', 'Instagram', 'Pix', 'Completed'),
(3, '2025-09-01', 'Google', 'Credit Card', 'Completed'),
(5, '2025-09-03', 'Direct', 'Pix', 'Completed'),
(7, '2025-09-05', 'Facebook', 'Credit Card', 'Completed'),
(9, '2025-09-07', 'Google', 'Pix', 'Completed'),
(11, '2025-09-09', 'Instagram', 'Credit Card', 'Completed'),
(13, '2025-09-11', 'Email', 'Pix', 'Completed'),
(15, '2025-09-13', 'Google', 'Credit Card', 'Completed'),
(2, '2025-09-15', 'Direct', 'Pix', 'Completed'),
(4, '2025-09-17', 'Instagram', 'Credit Card', 'Completed');

-- =========================
-- ORDER ITEMS
-- =========================

INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 299.90),
(1, 3, 1, 129.90),

(2, 2, 1, 449.90),

(3, 7, 1, 599.90),

(4, 4, 2, 159.90),

(5, 5, 1, 189.90),
(5, 10, 1, 139.90),

(6, 6, 1, 249.90),

(7, 1, 1, 299.90),
(7, 8, 1, 299.90),

(8, 9, 1, 219.90),

(9, 2, 1, 449.90),
(9, 3, 2, 129.90),

(10, 10, 2, 139.90),

(11, 7, 1, 599.90),

(12, 4, 1, 159.90),
(12, 5, 1, 189.90),

(13, 1, 2, 299.90),

(14, 8, 1, 299.90),

(15, 2, 1, 449.90),
(15, 9, 1, 219.90),

(16, 3, 1, 129.90),
(16, 6, 1, 249.90),

(17, 7, 1, 599.90),

(18, 4, 2, 159.90),
(18, 10, 1, 139.90),

(19, 1, 1, 299.90),
(19, 5, 1, 189.90),

(20, 2, 1, 449.90),

(21, 8, 2, 299.90),

(22, 9, 1, 219.90),

(23, 7, 1, 599.90),
(23, 3, 1, 129.90),

(24, 6, 1, 249.90),

(25, 1, 1, 299.90),
(25, 4, 1, 159.90);