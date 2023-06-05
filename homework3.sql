create database if not exists lesson3;
USE lesson3;
create table if not exists staff
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(45),
	lastname VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
    salary DECIMAL(8,2),
    age INT
);
INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES
  ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
  ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
  ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
  ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
  ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
  ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
  ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
  ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
  ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
  ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
  ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
  ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
  
-- Отсортируйте данные по полю заработная плата (salary) в порядке возрастания 
select * from staff
order by salary;
  
--  Отсортируйте данные по полю заработная плата (salary) в порядке убывания
select * from staff
order by salary desc;

-- Выведите 5 максимальных заработных плат (saraly)
select salary from staff
order by salary
limit 5;

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
select post, sum(salary) as sum_salary from staff
group by post;

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
select post, count(post) as count_post from staff
where post = 'Рабочий' and age between 24 and 49;

-- Найдите количество специальностей
select count(distinct post) as count_post from staff;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
select post from staff
group by post
having avg (age) <= 30;

-- вывести топ2 высокооплачиваемых сотрудников в каждой должности
select 
	CONCAT(firstname, " ", lastname) AS fullname, 
	post,
    salary
from staff
order by post, salary desc;
