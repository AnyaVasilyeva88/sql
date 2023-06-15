create database if not exists lesson_5;
use lesson_5;
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

-- Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE OR REPLACE VIEW cars_25
AS
SELECT 
	*
FROM cars
where cost < 25000
ORDER BY cost;
select * from cars_25;

-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW
alter view cars_25
as
SELECT 
	*
FROM cars
where cost < 30000
ORDER BY cost;
select * from cars_25;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE OR REPLACE VIEW cars_new
AS
SELECT 
	*
FROM cars
where name = 'Skoda' or name = 'Audi'
ORDER BY cost;
select * from cars_new;
 