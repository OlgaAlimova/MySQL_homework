-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

CREATE FUNCTION format_seconds(seconds INT) RETURNS VARCHAR(255)
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE result VARCHAR(255);
    
    SET days = FLOOR(seconds / (24 * 3600));
    SET seconds = seconds - (days * 24 * 3600);
    
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds - (hours * 3600);
    
    SET minutes = FLOOR(seconds / 60);
    SET seconds = seconds - (minutes * 60);
    
    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
    
    RETURN result;
END;

SELECT format_seconds(123456);


-- Выведите только четные числа от 1 до 10.
-- Пример: 2,4,6,8,10

SELECT *
FROM your_table
WHERE column_name % 2 = 0
AND column_name BETWEEN 1 AND 10;

-- Cоздание процедуры, которая решает следующую задачу
-- Выбрать для одного пользователя 5 пользователей в случайной комбинации, которые удовлетворяют хотя бы одному критерию:
-- 1) из одного города
-- 2) состоят в одной группе
-- 3) друзья друзей
-- Cоздание функции, вычисляющей коэффициент популярности пользователя

CREATE PROCEDURE select_users(IN user_id INT)
BEGIN
    -- Критерий 1: Пользователи из одного города
    SELECT DISTINCT u1.user_id
    FROM users u1
    INNER JOIN users u2 ON u1.city = u2.city
    WHERE u2.user_id = user_id
    ORDER BY RAND()
    LIMIT 5;
    
    -- Критерий 2: Пользователи, состоящие в одной группе
    SELECT DISTINCT u3.user_id
    FROM users u3
    INNER JOIN group_members gm1 ON u3.user_id = gm1.user_id
    INNER JOIN group_members gm2 ON gm1.group_id = gm2.group_id
    WHERE gm2.user_id = user_id
    ORDER BY RAND()
    LIMIT 5;
    
    -- Критерий 3: Друзья друзей
    SELECT DISTINCT u4.user_id
    FROM users u4
    INNER JOIN friends f1 ON u4.user_id = f1.friend_id
    INNER JOIN friends f2 ON f1.user_id = f2.friend_id
    WHERE f2.user_id = user_id
    ORDER BY RAND()
    LIMIT 5;
END;

CALL select_users(1);
