-- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
-- 2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
-- 3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- Создание представления, в которое попадут автомобили стоимостью до 25 000 долларов:

CREATE VIEW cars_under_25000 AS
SELECT *
FROM cars
WHERE cost < 25000;

-- Изменение порога для стоимости в существующем представлении с помощью оператора ALTER VIEW:
ALTER VIEW cars_under_25000 AS
SELECT *
FROM cars
WHERE cost < 30000;

-- Создание представления, в котором будут только автомобили марки "Шкода" и "Ауди":
CREATE VIEW skoda_audi_cars AS
SELECT *
FROM cars
WHERE name IN ('Skoda', 'Audi');

-- Добавление нового столбца "время до следующей станции" с использованием оконной функции LEAD:
ALTER TABLE cars
ADD COLUMN time_to_next_station INT;

UPDATE cars
SET time_to_next_station = LEAD(time) OVER (ORDER BY id) - time;






