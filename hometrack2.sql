CREATE DATABASE IF NOT EXISTS hometrack2;
USE hometrack2;

DROP TABLE IF EXISTS sales;
CREATE TABLE sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_date DATE,
	count_product INT
);

INSERT sales (order_date, count_product)
VALUES
	('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);

SELECT *
FROM sales;

SELECT 
	id AS "ID заказа",
    count_product AS "Количество",
CASE
	WHEN count_product < 100 THEN "Маленький заказ"
    WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
    ELSE "Большой заказ"
END AS "Комментарий"
FROM sales;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	employee_id VARCHAR(45),
	amount FLOAT,
    order_status VARCHAR(45)
);

INSERT orders (employee_id, amount, order_status)
VALUES
	('e03', 15.00, 'OPEN'),
    ('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');

SELECT *
FROM orders;

SELECT
	id AS "Номер ордера",
    employee_id AS "Сотрудник",
    amount AS "Количество",
    IF (order_status = "OPEN", "order is in open state",
		IF (order_status = "CLOSED", "Order is closed", "Order is cancelled"))
	AS "full_order_status"
FROM orders;
