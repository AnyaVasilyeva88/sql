use lessons_1;
create table homework_1
(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    ProductName VARCHAR(45) not null, 
    Manufacturer VARCHAR(45) not null,
	ProductCount double null,
    Price double null
);

insert homework_1(ProductName, Manufacturer, ProductCount, Price)
values 
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);

-- Выведите название, производителя и цену для товаров, количество которых превышает 2 (SQL - файл, скриншот, либо сам код)
select ProductName, Manufacturer, Price
from homework_1
where ProductCount > 2;

-- Выведите весь ассортимент товаров марки “Samsung”
select *
from homework_1
where Manufacturer = 'Samsung';

-- Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
select *
from homework_1
where ProductCount * Price > 100000 and ProductCount * Price < 145000;

-- Товары, в которых есть упоминание "Iphone"
select *
from homework_1
where ProductName like 'iPhone%';

-- "Galaxy"
select *
from homework_1
where ProductName like 'Galaxy%';

-- Товары, в которых есть ЦИФРA 8
select *
from homework_1
where ProductName like '%8%';

-- Товары, в которых есть ЦИФРA
select *
from homework_1
where ProductName rlike '[:digit:]';

 







