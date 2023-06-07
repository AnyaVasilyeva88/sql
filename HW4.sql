DROP DATABASE IF EXISTS HW_4;
CREATE DATABASE HW_4;
USE HW_4;

CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);

CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);
        
select * from cats;

-- Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
select 
	cats.`name`,
    shops.`shopname`
from cats
join shops on shops.id = cats.shops_id;

-- Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
select 
    shops.`shopname`
from cats
join shops on shops.id = cats.shops_id
where cats.`name`= "Murzik";

select 
    shops.`shopname`
from (select * from cats where `name`= "Murzik") m_cats
join shops on shops.id = m_cats.shops_id;

-- Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”
SELECT 
	shops.`shopname`
FROM shops
WHERE  id NOT IN (
	SELECT shops_id
    FROM cats
    WHERE `name` IN ("Murzik", "Zuza")
);
    
    
