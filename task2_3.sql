create DATABASE army;
-- drop DATABASE army;
use army;

CREATE TABLE weapons (
id smallint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY key,
name VARCHAR(20) NOT NULL UNIQUE
);







CREATE TABLE ranks (
id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) UNIQUE
);



CREATE TABLE soldiers (
id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(30) NOT NULL,
middlename VARCHAR(30),
lastname VARCHAR(30) NOT NULL,
platoon TINYINT UNSIGNED NOT NULL,
of_num SMALLINT UNSIGNED default 0
);

CREATE TABLE officers (
id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(30) NOT NULL,
middlename VARCHAR(30),
lastname VARCHAR(30) NOT NULL,
rank_id TINYINT UNSIGNED NOT NULL,
FOREIGN KEY (rank_id) REFERENCES ranks(id)
);

CREATE table weapon_delivery (
id int AUTO_INCREMENT PRIMARY KEY,
soldier_id SMALLINT UNSIGNED NOT NULL,
weapon_id smallint UNSIGNED NOT NULL,
officer_id SMALLINT UNSIGNED NOT NULL,
FOREIGN KEY (soldier_id) REFERENCES soldiers (id),
FOREIGN KEY (weapon_id) REFERENCES weapons (id),
FOREIGN KEY (officer_id) REFERENCES officers (id)
);

insert weapons 
(name)
VALUES
('ak-47'),
('glok20'),
('TT'),
('PM');

INSERT ranks 
(name)
VALUES 
('major'),
('lieut colonel'),
('general');



INSERT INTO `officers`
(`firstname`,
`middlename`,
`lastname`,
`rank_id`)
VALUES
('O', 'S', 'Burov', 1),
('N', 'G', 'Rybakov', 1),
('V', 'Y', 'Derebanov', 2),
('S', 'K', 'Generalov', 1);


INSERT INTO `army`.`soldiers`
(`firstname`,
`middlename`,
`lastname`,
`platoon`,
`of_num`)
VALUES
('V', 'A', 'Petrov', 222, 205),
('P', 'S', 'Lodarev', 232, 221),
('K', 'V', 'Leontjev', 212, 201),
('R', 'M', 'Duhov', 200, 0)
;

INSERT INTO `army`.`weapon_delivery`
(`soldier_id`,
`weapon_id`,
`officer_id`)
VALUES
(5, 1, 1),
(5, 2, 2),
(6, 1, 3),
(6, 2, 2),
(7, 1, 1),
(7, 2, 2),
(8, 1, 1);


select 	weapon_delivery.id,	soldiers.lastname as фамилия, soldiers.firstname, 
soldiers.middlename, of_num, platoon, 
weapons.name, officers.lastname, ranks.name
from weapon_delivery
join 
soldiers 
on weapon_delivery.soldier_id = soldiers.id
join officers 
on weapon_delivery.officer_id = officers.id
join weapons
on weapon_delivery.weapon_id = weapons.id
join ranks
on officers.rank_id = ranks.id;








select * from ranks;
select * from weapons;
select * from soldiers;
select * from officers;










