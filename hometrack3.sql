-- DDL: CREATE, DROP, ALTER, RENAME, TRUNCATE (очистка таблицы от данных, оставляя только названия столбцов)

-- DML: INSERT, UPDATE, DELETE, SELECT

-- 1. Создание БД: IF EXISTS (если существует) , IF NOT EXISTS (если НЕ существует)
DROP DATABASE IF EXISTS lesson3; -- Удаляем БД с именем lesson3, если она существует
CREATE DATABASE lesson3;

-- 2. Работаем с конкретной БД
USE lesson3;

-- 3. Создание таблицы
DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
id INT PRIMARY KEY AUTO_INCREMENT,
firstname VARCHAR(45),
lastname VARCHAR(45),
post VARCHAR(45),
seniority INT NOT NULL,
salary INT NOT NULL,
age INT NOT NULL
);

-- 4. Заполнение таблицы данными
INSERT INTO employees (firstname, lastname, post, seniority, salary, age)
VALUES

('Вася', 'Петров', 'Начальник', 40, 100000, 60),
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 20),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

-- 5. Получим все строки из подборки с фильмами
SELECT *
FROM employees;

-- Отсортировать данные по полю "salary" в порядке убывания:
SELECT * FROM employees ORDER BY salary DESC;

-- Отсортировать данные по полю "salary" в порядке возрастания:
SELECT * FROM employees ORDER BY salary ASC;

-- Вывести 5 максимальных зарплат:
SELECT salary FROM employees ORDER BY salary DESC LIMIT 5;

-- Посчитать суммарную зарплату по каждой специальности:
SELECT post, SUM(salary) FROM employees GROUP BY post;

-- Найти количество сотрудников с должностью "Рабочий" в возрасте от 24 до 49 лет:
SELECT COUNT(*) FROM employees WHERE post = 'Рабочий' AND age BETWEEN 24 AND 49;

-- Найти количество различных специальностей:
SELECT COUNT(DISTINCT post) FROM employees;

-- Вывести специальности, у которых средний возраст сотрудников меньше 30 лет:
SELECT post FROM employees GROUP BY post HAVING AVG(age) < 30;


