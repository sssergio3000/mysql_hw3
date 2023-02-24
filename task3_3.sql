create database human_recources;
-- drop database human_recources;
USE human_recources;

CREATE TABLE positions (
id TINYINT NOT NULL AUTO_INCREMENT PRIMARY key,
position_name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE personnel (
id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
lastname VARCHAR(20) NOT NULL,
firstname VARCHAR(20) NOT NULL,
birthdate DATE NOT NULL

);
drop table salary_set;
CREATE TABLE salary_set (
id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
person_id SMALLINT UNSIGNED NOT NULL,
date DATE NOT NULL,
salary INT UNSIGNED NOT NULL,
FOREIGN KEY (person_id) REFERENCES personnel(id)

);

CREATE TABLE recruitment (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
person_id SMALLINT UNSIGNED NOT NULL,
date DATE NOT NULL,
FOREIGN KEY (person_id) REFERENCES personnel(id)
);

CREATE TABLE setposition (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
person_id SMALLINT UNSIGNED NOT NULL,
position_id TINYINT NOT NULL,
date DATE NOT NULL,
FOREIGN KEY (person_id) REFERENCES personnel(id),
FOREIGN KEY (position_id) REFERENCES positions(id)
);

CREATE TABLE dismissal (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
person_id SMALLINT UNSIGNED NOT NULL,
date DATE NOT NULL,
reason VARCHAR(50),
FOREIGN KEY (person_id) REFERENCES personnel(id)
);

INSERT INTO `human_recources`.`positions`
(`position_name`)
VALUES
('ceo'),
('accountant'),
('sales manager'),
('ads manager'),
('manager');

INSERT INTO `human_recources`.`personnel`
(`lastname`,
`firstname`,
`birthdate`)
VALUES
('Nickson', 'John', '1932-03-23'),
('Luckas' ,'Adward' , '1965-11-25'),
('Statham', 'Walter', '1982-12-5'),
('Miller', 'Glen', '1935-12-12');

INSERT INTO `human_recources`.`recruitment`
(`person_id`,
`date`)
VALUES
(2, current_date()),
(1, '2020-04-13'),
(3, '2019-05-22'),
(4, '2018-01-01');

-- TRUNCATE recruitment;

INSERT INTO `human_recources`.`salary_set`
(`person_id`,
`date`,
`salary`)
VALUES
(1, '2020-04-13', 12000),
(2, '2023-02-24', 9000),
(3, '2019-05-22', 15000),
(4, '2018-01-01', 20000);

select * from human_recources.salary_set;

INSERT INTO `human_recources`.`setposition`
(`person_id`,
`position_id`,
`date`)
VALUES
(1, 1, current_date()),
(2, 3, current_date()),
(3, 2, current_date()),
(4, 4, current_date());


INSERT INTO `human_recources`.`dismissal`
(`person_id`,
`date`,
`reason`)
VALUES
(3, curdate(), 'too much drinking');

SELECT * from dismissal;
SELECT * from personnel;
SELECT * from positions;
SELECT * from recruitment;
SELECT * from salary_set;
SELECT * from setposition;

select personnel.lastname, positions.position_name, salary_set.salary, salary_set.date
from personnel
join setposition
on setposition.person_id = personnel.id
join positions
on positions.id = setposition.position_id
join salary_set
on salary_set.person_id = setposition.person_id;










