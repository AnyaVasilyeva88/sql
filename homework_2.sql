-- Используя операторы языка SQL, 
-- создайте таблицу “sales”. Заполните ее данными
create database if not exists lesson_2;
use lesson_2;
create table if not exists homework_2
(
	d INT PRIMARY KEY AUTO_INCREMENT,
    order_date date,
    count_product int
);
rename table homework_2 to sales;
insert into sales (order_date, count_product)
values
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);
select * from sales;


-- Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
-- меньше 100  -    Маленький заказ
-- от 100 до 300 - Средний заказ
-- больше 300  -     Большой заказ-- 

select 
	d,
    case
		when count_product < 100 then "Маленький заказ"
        when count_product between 100 and 300 then "Средний заказ"
        else "Большой заказ"
    end as "Тип заказа"
from sales;

-- Создайте таблицу “orders”, заполните ее значениями
create table if not exists orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(45) NOT NULL,
    amount float DEFAULT 0.0,
    order_status VARCHAR(45)
);
insert into orders (employee_id, amount, order_status)
values
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');
select * from orders;

-- Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
-- OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED -  «Order is cancelled»
select
	id,
    employee_id,
    amount,
    order_status,
	case
		when order_status = 'OPEN' then 'Order is in open state'
        when order_status = 'CLOSED' then 'Order is closed'
        else 'Order is cancelled'
	end as 'full_order_status'
from orders;

-- Чем 0 отличается от NULL? Ответ - 0 - это значение, Null - отсутствие какого-либо значения



    
    




