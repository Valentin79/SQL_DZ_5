CREATE DATABASE dz_5;

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
    
-- 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW `low_cost_cars` AS
(SELECT * 
FROM cars
WHERE cost <= 25000
);
SELECT * FROM low_cost_cars;

-- 2. Изменить в существующем представлении порог
-- для стоимости: пусть цена будет до 30 000 долларов
ALTER VIEW `low_cost_cars` AS
SELECT *
FROM cars
WHERE cost <= 30000;
SELECT * FROM low_cost_cars;

-- 3. Создайте представление, в котором будут только
-- автомобили марки “Шкода” и “Ауди”
CREATE VIEW `VAG_group` AS
SELECT *
FROM `cars`
WHERE `name` = "Skoda" OR `name` = "Audi"; # сюда еще очень просится Volkswagen
SELECT * FROM `VAG_group`;

-- 4. Расписание автобусов.
CREATE TABLE `bus schedule`
(
`train id` INT,
`station` VARCHAR(40),
`station_time` TIME);

INSERT `bus schedule`
VALUES
	(110, "San Francisco", "10:00:00"),
    (110, "Redwood Sity", "10:54:00"),
	(110, "Palo Alto", "11:02:00"),
    (110, "San Jose", "12:35:00"),
    (120, "San Francisco", "11:00:00"),
    (120, "Palo Alto", "12:49:00"),
    (120, "San Jose", "13:30:00");
    
SELECT *, 
TIMEDIFF(LEAD(`station_time`) OVER(PARTITION BY `train id`), 
		`station_time`) AS `next_station`
FROM `bus schedule`;
-- я плохо понял что сделал, но оно сработало =)



