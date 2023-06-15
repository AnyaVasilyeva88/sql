use lesson_5;
create table if not exists stations
(
	id INT NOT NULL PRIMARY KEY,
    train_id int,
    station VARCHAR(20),
    station_time time
);

insert stations
values
	(1, 110, "San Francisco", '10:00:00'),
    (2, 110, "Redwood City", '10:54:00'),
    (3, 110, "Palo Alto", '11:02:00'),
    (4, 110, "San Jose", '12:35:00'),
    (5, 120, "San Francisco", '11:00:00'),
    (6, 120, "Palo Alto", '12:49:00'),
    (7, 120, "San Jose", '13:30:00');
select * from stations;

SELECT
	stations.*,
    timediff(lead(station_time) OVER w, station_time) AS time_to_next_station
FROM stations
WINDOW w AS (PARTITION BY train_id);


    
