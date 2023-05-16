CREATE DATABASE IF NOT EXISTS hometrack1;
USE hometrack1;

DROP TABLE IF EXISTS mobale;
CREATE TABLE IF NOT EXISTS mobale
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	ProductName VARCHAR(45),
	Manufacturer VARCHAR(45),
	ProductCount INTEGER,
    Price INTEGER
);

INSERT mobale (ProductName, Manufacturer, ProductCount, Price)
VALUES
	("iPhone X", "Apple", 3, 76000),
    ("iPhone 8", "Apple", 2, 51000),
    ("Galaxy S9", "Samsung", 2, 56000),
    ("Galaxy S8", "Samsung", 1, 41000),
    ("P20 Pro", "Huawei", 5, 36000);

SELECT *
FROM mobale;
    
SELECT ProductName, Manufacturer, Price
FROM mobale
WHERE ProductCount > 2;

SELECT ProductName, Manufacturer, ProductCount, Price
FROM mobale
WHERE Manufacturer = "Samsung";

SELECT ProductName, Manufacturer, ProductCount, Price
FROM mobale
WHERE ProductCount*Price BETWEEN 100000 AND 145000;

SELECT ProductName, Manufacturer, ProductCount, Price
FROM mobale
WHERE ProductName LIKE "iPhone%";

SELECT ProductName, Manufacturer, ProductCount, Price
FROM mobale
WHERE ProductName RLIKE "[0-9]";

SELECT ProductName, Manufacturer, ProductCount, Price
FROM mobale
WHERE ProductName RLIKE "8";