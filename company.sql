CREATE DATABASE company;

USE company;

CREATE TABLE `department` (
	`department_id` INT NOT NULL,
	`department_name` varchar(30) NOT NULL,
	`city` varchar(30) NOT NULL,
	`steet` varchar(40) NOT NULL,
	`building_no` INT(3) NOT NULL,
	PRIMARY KEY (`department_id`)
);

CREATE TABLE `employee` (
	`employee_id` INT NOT NULL,
	`user_name` varchar(30) NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`employment_date` DATE NOT NULL,
	`position` varchar(15) NOT NULL,
	`department_id` INT,
	`rate` FLOAT NOT NULL,
	`bonus` FLOAT,
	`email` varchar(50) NOT NULL,
	`maneger_id` INT,
	PRIMARY KEY (`employee_id`)
);

CREATE TABLE `product` (
	`product_id` INT NOT NULL,
	`product_name` varchar(40) NOT NULL,
	`price` FLOAT NOT NULL,
	`amount` INT,
	`product_type` varchar(15) NOT NULL,
	`manufacture` varchar(30) NOT NULL,
	`category` varchar(15) NOT NULL,
	`product_description` varchar(150) NOT NULL,
	PRIMARY KEY (`product_id`)
);

CREATE TABLE `customer` (
	`customer_id` INT NOT NULL AUTO_INCREMENT,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`phone_number` INT NOT NULL,
	`email` varchar(50) NOT NULL,
	`genger` varchar(1) NOT NULL,
	`discount` INT(2) NOT NULL,
	`birth_date` DATE NOT NULL,
	PRIMARY KEY (`customer_id`)
);

CREATE TABLE `orders` (
	`orders_id` INT NOT NULL AUTO_INCREMENT,
	`transaction_moment` DATETIME NOT NULL,
	`coast` INT NOT NULL,
	`employee_id` INT NOT NULL,
	`product_id` INT NOT NULL,
	`customer_id` INT NOT NULL,
	`transaction_type` INT NOT NULL,
	PRIMARY KEY (`orders_id`)
);

ALTER TABLE `employee` ADD CONSTRAINT `employee_fk0` FOREIGN KEY (`department_id`) REFERENCES `department`(`department_id`);

ALTER TABLE `employee` ADD CONSTRAINT `employee_fk1` FOREIGN KEY (`maneger_id`) REFERENCES `employee`(`employee_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk1` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk2` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`);

CREATE TABLE IF NOT EXISTS `invoice`(
`invoice_id` bigint(15) NOT NULL,
`employee_id` INT NOT NULL,
`customer_id` INT,
`payment_method` INT NOT NULL,
`transaction_moment` DATETIME NOT NULL,
`status` varchar(10) NOT NULL
);

-- ALTER TABLE - ADD Column
 ALTER TABLE
 orders
 ADD
 invoice_id bigint(15)  NOT NULL;
 
  ALTER TABLE
 orders
 ADD
 order_datetime DATETIME NOT NULL;
 
  ALTER TABLE
 orders
 ADD
 quantity INT NOT NULL;
 
 -- ALTER TABLE - DROP COLUMN
 ALTER TABLE
 orders
 DROP COLUMN
 transaction_type;
 
 ALTER TABLE
 orders
 DROP COLUMN
 transaction_moment;
 
 ALTER TABLE
 orders
 DROP COLUMN
 coast;
 
 ALTER TABLE
 department
 DROP COLUMN
 steet;
 
 ALTER TABLE
 department
 ADD
 street varchar(40) NOT NULL;

ALTER TABLE
 employee
 DROP COLUMN
 email;
 
 ALTER TABLE
 orders
 DROP COLUMN
 employee_id;
 
 ALTER TABLE
 orders
 DROP COLUMN
 customer_id;
 
 -- ALTER TABLE - MODTFY COLUMN
ALTER TABLE
customer
MODIFY phone_number BIGINT (15) NOT NULL;

ALTER TABLE
employee
MODIFY position varchar (30) NOT NULL;
 
 ALTER TABLE
department
MODIFY 
street varchar (50) NOT NULL;

ALTER TABLE
department
MODIFY 
building_no INT(4);

ALTER TABLE
invoice
ADD PRIMARY KEY (invoice_id);

ALTER TABLE
orders
DROP FOREIGN KEY orders_fk0;
ALTER TABLE
orders
DROP FOREIGN KEY orders_fk2;

ALTER TABLE
orders
ADD CONSTRAINT
orders_fk3
FOREIGN KEY
(invoice_id)
REFERENCES
invoice(invoice_id);

ALTER TABLE
invoice
ADD CONSTRAINT
invoice_fk0
FOREIGN KEY
(employee_id)
REFERENCES
employee (employee_id);

USE company;
ALTER TABLE
department
ALTER city
SET DEFAULT
'Lviv';
ALTER TABLE
employee
ADD UNIQUE
(user_name);


ALTER TABLE
invoice
ADD CONSTRAINT
invoice_fk1
FOREIGN KEY
(customer_id)
REFERENCES
customer(customer_id);


/* LOAD DATA*/

USE company;
INSERT INTO department(department_id, department_name, city, street, building_no) VALUES 
(1, 'Sun', 'Lviv', 'Gordepartmentodotska', 165),
(2, 'Moon', 'Kiyv', 'Shevchenka', 15),
(3, 'Saturn', 'Lviv', 'Zelena', 210),
(4, 'Mars', 'Rivne', 'Verbova', 57),
(5, 'Mercury', 'Ternopil', 'Lepkogo', 34),
(6, 'Pluton', 'Kiyv', 'Chreschtschatyk', 128);

UPDATE department
SET 
  department_name = CASE 
                      WHEN department_id = 1 THEN 'Sun'
                      WHEN department_id = 2 THEN 'Moon'
                      WHEN department_id = 3 THEN 'Saturn'
                      WHEN department_id = 4 THEN 'Mars'
                      WHEN department_id = 5 THEN 'Mercury'
                      WHEN department_id = 6 THEN 'Pluton'
                    END,
  city = CASE 
           WHEN department_id = 1 THEN 'Lviv'
           WHEN department_id = 2 THEN 'Kiyv'
           WHEN department_id = 3 THEN 'Lviv'
           WHEN department_id = 4 THEN 'Rivne'
           WHEN department_id = 5 THEN 'Ternopil'
           WHEN department_id = 6 THEN 'Kiyv'
         END,
  street = CASE 
             WHEN department_id = 1 THEN 'Gorodotska'
             WHEN department_id = 2 THEN 'Shevchenka'
             WHEN department_id = 3 THEN 'Zelena'
             WHEN department_id = 4 THEN 'Verbova'
             WHEN department_id = 5 THEN 'Lepkogo'
             WHEN department_id = 6 THEN 'Chreschtschatyk'
           END,
  building_no = CASE 
                     WHEN department_id = 1 THEN 165
                     WHEN department_id = 2 THEN 15
                     WHEN department_id = 3 THEN 210
                     WHEN department_id = 4 THEN 57
                     WHEN department_id = 5 THEN 34
                     WHEN department_id = 6 THEN 128
                   END;
    
SET SQL_SAFE_UPDATES = 0;

-- DONE

USE company;

INSERT INTO employee (employee_id, user_name, first_name, last_name, position, employment_date, department_id, maneger_id, rate, bonus) VALUES
(1,'LyubomyrMartynenko','Lyubomyr','Martynenko','CEO','1998-01-01',1,NULL,10000,NULL),
(2,'LinaSirenko','Lina','Sirenko','Financial Analitic','2016-08-20',1,1,8500,NULL),
(3,'OksanaZayika','Oksana','Zayika','Accountant','2007-10-24',1,1,6500,NULL),
(4,'YaroslavTymchuk','Yaroslav','Tymchuk','Human Resources','2018-01-11',1,1,6000,NULL),
(5,'HannaTarasyuk','Hanna','Tarasyuk','Marketing Specialist','2003-02-08',1,1,6000,NULL),
(6,'MarharytaDyachuk','Marharyta','Dyachuk','Administrative assistant','2009-08-11',1,1,4500,NULL),
(7,'SerhijHlavatskykh','Serhij','Hlavatskykh','Service Assistant','2020-01-18',1,1,3200,NULL),
(8,'MykolaBlyznyuk','Mykola','Blyznyuk','Service Assistant','1999-11-01',2,1,2500,NULL),
(9,'VladyslavKryvonis','Vladyslav','Kryvonis','Manager','2013-03-22',1,1,7000,NULL),
(10,'AlinaHrytsenko','Alina','Hrytsenko','Manager','2016-10-04',2,1,7000,NULL),
(11,'MyroslavStepanova','Myroslav','Stepanova','Manager','1999-08-05',3,1,7000,NULL),
(12,'PylypGetman','Pylyp','Getman','Manager','2009-01-08',4,1,7000,NULL),
(13,'OksanaKhomenko','Oksana','Khomenko','Manager','2016-06-14',5,1,7000,NULL),
(14,'ArturZayika','Artur','Zayika','Manager','1999-07-20',NULL,1,7000,NULL),
(15,'StanislavYaskiv','Stanislav','Yaskiv','Manager Assistant','2014-02-18',1,9,5500,NULL),
(16,'JosypYatsenko','Josyp','Yatsenko','Manager Assistant','2016-07-22',1,10,5500,NULL),
(17,'TamaraTymchuk','Tamara','Tymchuk','Manager Assistant','2011-11-29',2,11,5500,NULL),
(18,'ZynayidaKravchenko','Zynayida','Kravchenko','Manager Assistant','2016-05-30',2,12,5500,NULL),
(19,'LidiyaGoncharenko','Lidiya','Goncharenko','Manager Assistant','2014-04-12',3,13,5500,NULL),
(20,'TarasOkhrimenko','Taras','Okhrimenko','Senior Consultant','2012-10-17',1,9,5500,275),
(21,'ViktorKovalov','Viktor','Demchuk','Consultant','2018-05-14',1,9,4500,225), 
(22,'OlhaSayenko','Olha','Sayenko','Assistant Consultant','2006-12-28',1,9,4000,200),
(23,'AntoninaVlasyuk','Antonina','Vlasyuk','Seller','2016-03-08',1,9,3500,175),
(24,'YuliyaSerporiz','Yuliya','Serporiz','Seller','2008-07-20',1,9,3500,175),
(25,'LiliyaPanchenko','Liliya','Panchenko','Senior Consultant','2004-01-20',2,10,5500,275),
(26,'YevheniyaParkhomenko','Yevheniya','Parkhomenko','Consultant','2007-06-16',2,10,4500,225),
(27,'LarysaMusiyenko','Larysa','Musiyenko','Assistant Consultant','2019-02-09',2,10,4000,200),
(28,'StefanKucherenko','Stefan','Kucherenko','Assistant Consultant','2006-07-03',2,10,4000,200),
(29,'IvanFesenko','Ivan','Fesenko','Seller','2017-10-06',2,10,3500,175),
(30,'HenadijNazarenko','Henadij','Nazarenko','Seller','2013-05-26',2,10,3500,175),
(31,'DenysPetrenko','Denys','Petrenko','Seller','2010-05-19',2,10,3500,175),
(32,'NatalyaChernenko','Natalya','Chernenko','Senior Consultant','2004-11-16',3,11,5500,275),
(33,'HannaDudnyk','Hanna','Dudnyk','Consultant','2000-11-11',3,11,4500,225),
(34,'HalynaShirman','Halyna','Shirman','Assistant Consultant','2018-09-02',3,11,4000,200),
(35,'LidiyaPylypenko','Lidiya','Pylypenko','Assistant Consultant','2007-03-30',3,11,4000,200),
(36,'NadiyaMedvid','Nadiya','Medvid','Seller','2007-03-07',3,11,3500,175),
(37,'TarasRudyk','Taras','Rudyk','Seller','2001-08-02',3,11,3500,175),
(38,'ViktorKovalovych','Viktor','Kovalovych','Seller','2002-12-19',3,11,3500,175),
(39,'PanasSirenko','Panas','Sirenko','Senior Consultant','2007-09-15',4,12,5500,275),
(40,'YaroslavLysyuk','Yaroslav','Lysyuk','Consultant','2008-02-10',4,12,4500,225),
(41,'AdamMazurenko','Adam','Mazurenko','Assistant Consultant','2016-11-19',4,12,4000,200),
(42,'AntonVdovychenko','Anton','Vdovychenko','Seller','2004-07-28',5,13,3500,175),
(43,'SofiyaKyrylenko','Sofiya','Kyrylenko','Senior Consultant','2011-12-09',5,13,5500,275),
(44,'UlyanaDyachuk','Ulyana','Dyachuk','Consultant','2012-04-26',5,13,4500,225),
(45,'HeorhijMaksymchuk','Heorhij','Maksymchuk','Assistant Consultant','2016-02-16',5,13,4000,200),
(46,'VladyslavaBuryak','Vladyslava','Buryak','Seller','2016-01-08',5,13,3500,175),
(47,'LidiyaZayika','Lidiya','Zayika','Senior Consultant','2015-03-11',NULL,14,5500,NULL),
(48,'NadiyaSavenko','Nadiya','Savenko','Consultant','2017-09-13',NULL,14,4500,NULL),
(49,'AlinaOsadchuk','Alina','Osadchuk','Assistant Consultant','2014-01-05',NULL,14,4000,NULL),
(50,'DenysKobzar','Denys','Kobzar','Seller','2016-10-17',NULL,14,3500,NULL);

-- DONE

USE company;
INSERT INTO customer (customer_id,first_name,last_name,genger,birth_date,phone_number,email,discount) VALUES
(94, 'Eduard','Usenko','M','1983-01-26',380505552124,'EduardUsenko@mail.com',9),
(5, 'Artem','Shirman','M','1974-11-15',380395550941,'ArtemShirman@mail.com',11),
(21, 'Serhij','Leshchenko','M','1991-10-24',380635556576,'SerhijLeshchenko@mail.com',22),
(43, 'Yukhym','Tarasyuk','M','1997-04-05',380595655581,'YukhymTarasyuk@mail.com',8),
(44, 'Zynovij','Cheban','M','1971-05-29',380401155577,'ZynovijCheban@mail.com',35),
(100, 'Roman','Olijnyk','M','1976-03-31',380635550290,'RomanOlijnyk@mail.com',35),
(67, 'Taras','Solovej','M','1971-02-10',380505558457,'TarasSolovej@mail.com',13),
(22, 'Artur','Kramarenko','M','1975-08-19',380635553581,'ArturKramarenko@mail.com',7),
(83, 'Mykyta','Kosenko','M','1991-04-25',380505559008,'MykytaKosenko@mail.com',17),
(98, 'Stanislav','Voloshchuk','M','1970-04-05',380635553726,'StanislavVoloshchuk@mail.com',31),
(32, 'Yukhym','Lyashko','M','2001-04-26',380395559856,'YukhymLyashko@mail.com',25),
(46, 'Taras','Buhaj','M','1981-11-14',380395552935,'TarasBuhaj@mail.com',26),
(66, 'Yurij','Horban','M','1985-10-24',380635553634,'YurijHorban@mail.com',23),
(73, 'Zynovij','Kohut','M','1990-11-22',380395552599,'ZynovijKohut@mail.com',29),
(37, 'Taras','Ponomarenko','M','1976-03-14',380395556584,'TarasPonomarenko@mail.com',22),
(10, 'Yurij','Mazurenko','M','1991-02-28',380364455541,'YurijMazurenko@mail.com',7),
(87, 'Andrij','Demydenko','M','1979-06-23',380184555727,'AndrijDemydenko@mail.com',23),
(53, 'Orest','Kondratyuk','M','1999-02-28',380635558896,'OrestKondratyuk@mail.com',22),
(39, 'Anton','Ponomarenko','M','1986-06-09',380395555720,'AntonPonomarenko@mail.com',17),
(48, 'Rostyslav','Kolisnyk','M','1975-03-15',380395559615,'RostyslavKolisnyk@mail.com',12),
(51, 'Rostyslav','Rudenko','M','1973-05-24',380195555550,'RostyslavRudenko@mail.com',8),
(56, 'Leonid','Musiyenko','M','1991-06-06','380-63-855-58-20','LeonidMusiyenko@mail.com',25), 
(6, 'Eduard','Shirman','M','1995-10-11',380395550058,'EduardShirman@mail.com',22),
(16, 'Yevhen','Getman','M','1998-10-22',380505550413,'YevhenGetman@mail.com',12),
(26, 'Mykyta','Shevchenko','M','1973-12-29',380395550365,'MykytaShevchenko@mail.com',9),
(4, 'Vsevolod','Chernyak','M','1990-10-06',380395557647,'VsevolodChernyak@mail.com',34),
(23, 'Serhij','Shynkarenko','M','1974-08-29',380395552922,'SerhijShynkarenko@mail.com',35),
(80, 'Taras','Maslyanko','M','1987-11-10',380635554654,'TarasMaslyanko@mail.com',8),
(41, 'Heorhij','Buryak','M','1982-08-09',380635552387,'HeorhijBuryak@mail.com',9),
(31, 'Denys','Holovko','M','1988-01-03',380411255570,'DenysHolovko@mail.com',28),
(88, 'Kyrylo','Fesenko','M','1970-12-08',380635552917,'KyryloFesenko@mail.com',16),
(13, 'Hryhorij','Prykhodko','M','1992-11-08',380566955542,'HryhorijPrykhodko@mail.com',24),
(28, 'Roman','Valenyuk','M','1997-11-17',380635553472,'RomanValenyuk@mail.com',28),
(55, 'Volodymyr','Valenyuk','M','1989-12-19',380395553262,'VolodymyrValenyuk@mail.com',11),
(79, 'Svyatoslav','Serdyuk','M','2000-04-12',380123055564,'SvyatoslavSerdyuk@mail.com',24),
(78, 'Myroslav','Kravchenko','M','1974-12-14',380395552599,'MyroslavKravchenko@mail.com',33),
(76, 'Andrij','Horban','M','1988-11-29',380635559903,'AndrijHorban@mail.com',25),
(59, 'Rostyslav','Havrylyuk','M','1978-08-27',380395551058,'RostyslavHavrylyuk@mail.com',31),
(30, 'Vsevolod','Romanenko','M','1980-03-16',380452155562,'VsevolodRomanenko@mail.com',32),
(54, 'Eduard','Movchan','M','1986-06-22',380573455590,'EduardMovchan@mail.com',8),
(85, 'Zynovij','Kondratyuk','M','1988-09-14',380635550425,'ZynovijKondratyuk@mail.com',31),
(62, 'Dmytro','Movchan','M','1995-08-25',380354455502,'DmytroMovchan@mail.com',35),
(57, 'Myron','Yevtushenko','M','1987-01-27',380395552131,'MyronYevtushenko@mail.com',10),
(18, 'Yevhen','Naumenko','M','1978-01-13',380395550109,'YevhenNaumenko@mail.com',15),
(40, 'Ivan','Movchan','M','1989-03-17',380395559606,'IvanMovchan@mail.com',27),
(74, 'Zynovij','Khudenko','M','1983-02-12',380395552507,'ZynovijKhudenko@mail.com',33),
(15, 'Danylo','Yakymenko','M','1976-06-16',380505551798,'DanyloYakymenko@mail.com',27),
(9, 'Anton','Honchar','M','1990-03-24',380635553745,'AntonHonchar@mail.com',35),
(91, 'Eduard','Kalinichenko','M','1988-08-19',380635550763,'EduardKalinichenko@mail.com',17),
(72, 'Afanasij','Naumenko','M','1973-08-06',380505559583,'AfanasijNaumenko@mail.com',24),
(3, 'Yuliya','Nazarenko','F','1981-12-12',380473155568,'YuliyaNazarenko@mail.com',25),
(17, 'Iryna','Bondarchuk','F','1976-11-19',380635551581,'IrynaBondarchuk@mail.com',35),
(14, 'Olha','Ihnatenko','F','1972-06-27',380395551539,'OlhaIhnatenko@mail.com',21),
(7, 'Oleksandra','Petruk','F','1980-10-29',380395559464,'OleksandraPetruk@mail.com',21),
(11, 'Lyubov','Bojchuk','F','1982-09-05',380635550405,'LyubovBojchuk@mail.com',30),
(71, 'Lyubov','Didyk','F','1999-02-09',380505555052,'LyubovDidyk@mail.com',5),
(36, 'Yevheniya','Morhun','F','1975-09-11',380478255582,'YevheniyaMorhun@mail.com',20),
(47, 'Vladyslava','Naumenko','F','1989-12-13',380582455577,'VladyslavaNaumenko@mail.com',25),
(77, 'Valentyna','Kramarenko','F','1971-06-18',380395551403,'ValentynaKramarenko@mail.com',34),
(58, 'Oksana','Kolisnyk','F','1994-04-15',380395552855,'OksanaKolisnyk@mail.com',18),
(60, 'Alla','Lysyuk','F','1997-12-03',380395555515,'AllaLysyuk@mail.com',22),
(64, 'Kseniya','Tarasyuk','F','1981-11-15',380395555811,'KseniyaTarasyuk@mail.com',25),
(82, 'Lyubov','Kravchuk','F','1971-02-19',380395552225,'LyubovKravchuk@mail.com',26),
(1, 'Myroslava','Kobzar','F','1976-01-15',380505557810,'MyroslavaKobzar@mail.com',28),
(12, 'Oksana','Tokar','F','1987-10-21',380635553472,'OksanaTokar@mail.com',30),
(45, 'Nina','Lebid','F','1999-05-01',380505558986,'NinaLebid@mail.com',23),
(49, 'Liliya','Kondratyuk','F','1992-05-02',380635556249,'LiliyaKondratyuk@mail.com',31),
(33, 'Yuliya','Babych','F','1973-12-16',380180655538,'YuliyaBabych@mail.com',21),
(65, 'Zhanna','Kravets','F','1993-09-05',380395552078,'ZhannaKravets@mail.com',10),
(75, 'Halyna','Yatsenko','F','1996-11-02',380395557364,'HalynaYatsenko@mail.com',18),
(34, 'Ivanna','Slobodyan','F','1975-03-08',380395553711,'IvannaSlobodyan@mail.com',12),
(89, 'Khrystyna','Leshchenko','F','1996-12-21',380505553300,'KhrystynaLeshchenko@mail.com',33),
(38, 'Stanislava','Chernenko','F','2001-02-28',380635554318,'StanislavaChernenko@mail.com',25),
(81, 'Olesya','Omelchuk','F','1993-04-21',380635553735,'OlesyaOmelchuk@mail.com',24),
(70, 'Valentyna','Petruk','F','1981-11-10',380282655503,'ValentynaPetruk@mail.com',8),
(20, 'Stanislava','Vlasyuk','F','1992-05-09',380505559725,'StanislavaVlasyuk@mail.com',15),
(97, 'Liliya','Stepanenko','F','1985-04-28',380161055526,'LiliyaStepanenko@mail.com',34),
(99, 'Yeva','Balko','F','1987-11-29',380505558967,'YevaBalko@mail.com',13),
(27, 'Antonina','Yatsenko','F','1995-05-17',380635555580,'AntoninaYatsenko@mail.com',6),
(2, 'Yevheniya','Kulish','F','1988-07-22',380395551122,'YevheniyaKulish@mail.com',22),
(96, 'Natalya','Demydenko','F','1993-10-26',380635552727,'NatalyaDemydenko@mail.com',28),
(19, 'Tamara','Demchuk','F','1988-04-03',380505559741,'TamaraDemchuk@mail.com',29),
(52, 'Ulyana','Dudnyk','F','2000-03-14',380670555553,'UlyanaDudnyk@mail.com',9),
(50, 'Anzhela','Ponomarenko','F','1971-02-09',380505557748,'AnzhelaPonomarenko@mail.com',23),
(42, 'Ulyana','Sayenko','F','1984-05-09',380395554330,'UlyanaSayenko@mail.com',12),
(35, 'Tayisiya','Serdyuk','F','2001-01-04',380267655559,'TayisiyaSerdyuk@mail.com',30),
(25, 'Yeva','Parkhomenko','F','1998-07-28',380505553585,'YevaParkhomenko@mail.com',30),
(24, 'Oksana','Gorin','F','1971-10-22',380635553834,'OksanaGorin@mail.com',30),
(69, 'Vita','Dudnyk','F','1999-07-17',380505551012,'VitaDudnyk@mail.com',25),
(95, 'Anastasiya','Velychko','F','1988-03-31',380635550112,'AnastasiyaVelychko@mail.com',29),
(63, 'Ulyana','Slobodyan','F','1978-11-21',380395556052,'UlyanaSlobodyan@mail.com',9),
(92, 'Yana','Kysil','F','1981-04-09',380287055562,'YanaKysil@mail.com',27),
(29, 'Tamara','Ilchenko','F','1984-01-14',380113755589,'TamaraIlchenko@mail.com',11),
(68, 'Yuliya','Didyk','F','1978-11-18',380565055504,'YuliyaDidyk@mail.com',25),
(84, 'Hanna','Yevtushenko','F','1988-08-18',380395552481,'HannaYevtushenko@mail.com',7),
(86, 'Svitlana','Fesenko','F','1976-05-26',380505552170,'SvitlanaFesenko@mail.com',14),
(93, 'Nina','Martynenko','F','1983-01-20',380395558991,'NinaMartynenko@mail.com',23),
(8, 'Larysa','Kravchuk','F','1984-10-17',380505559969,'LarysaKravchuk@mail.com',29),
(61, 'Yuliya','Datsenko','F','1994-01-01',380395555551,'YuliyaDatsenko@mail.com',19),
(90, 'Yana','Savenko','F','1994-01-02',380395556307,'YanaSavenko@mail.com',12);


-- DONE


USE company;
INSERT INTO product (product_id, product_name, product_description, category, manufacture, product_type, amount, price) VALUES
(1,'ASUS M3700WUAK-BA045W AIO','ASUS AIO PCS - AMD R7 5700U 16G INT 512GB SSD + 1TB HDD 27'' FHD WIN 11 HOME BLACK','AIOs','ASUS','Devices',46,967.37),
(2,'ASUS E5402WHAK-DUO204X','ASUS EXPERT CENTER E5 AIO 24 - I5 11500B 8G INT 512GB SSD DVD 23.8 FHD + KB + MOUSE WIN 11 PRO','AIOs','ASUS','Devices',38,944.85),
(3,'ASUS A5401WRAK-BA022T AIO','ASUS ZEN AIO 24 I5-10 8G INT 512GB SSD WIN 10 HOME EXT DVD','AIOs','ASUS','Devices',35,741.45),
(4,'Dell XPS 27 7760','Dell XPS 27 7760 i7-7700 27-inch 4K Ultra HD Touch, 16GB DDR4 2133MHz, 512GB SSD, Windows 10 Pro','AIOs','DELL','Devices',41,2068.00),
(5,'DELL OPTIPLEX 7460 AIO','DELL OPTIPLEX 7460 AIO INTEL CORE I7-8700 8GB 1TB NON-TOUCH 23.8Windows 10  WIN10-PRO','AIOs','DELL','Devices',42,1757.00),
(6,'HP PROONE 600 G3 AIO','HP PROONE 600 G3 AIO INTEL CORE I5-7500 4GB 500GB NON-TOUCH 21.5Windows 10  WIN10-PRO','AIOs','HP','Devices',37,1611.00),
(7,'HP 400 G4','HP 400 G4 AiO Intel Core i3-8100T 4GB 500GB NON-TOUCH 20Windows 10  WIN10-PRO','AIOs','HP','Devices',43,1193.00),
(8,'LENOVO V530 AIO','LENOVO V530 AIO INTEL CORE I7-8700T 8GB 1TB NON-TOUCH 23.8  WIN10-PRO','AIOs','LENOVO','Devices',9,1089.00),
(9,'LENOVO IC AIO 3 27 /F0FY0067RI','LENOVO AIO 27'' R7-5 8G INT 512GB SSD M2 HDMI IPS AG COMBO BLACK','AIOs','LENOVO','Devices',10,742.20),
(10,'LENOVO IC AIO 3 24 /F0G0006JRI','LENOVO AIO 24'' I5-11 8G INT 512GB SSD M2 HDMI IPS AG COMBO BLACK','AIOs','LENOVO','Devices',46,688.30),
(11,'ASUS ROG STRIX G35CA-WB7830W','ASUS ROG STRIX I7 13700KF 32GB 512GB SSD 2TB HDD RTX 3080 WIN 11 HOME 750W','Desktops','ASUS','Devices',19,2970.53),
(12,'ASUS G35DX-21202W','ASUS ROG STRIX GA35 AMD R9 5900X 32GB 1TB SSD + 1TB HDD RTX3080 LHR 750W GOLD WIN 11 HOME','Desktops','ASUS','Devices',18,2727.99),
(13,'ASUS G22CH-7720W','ASUS ROG G22CH - I7 13700KF 16GB 1TB SSD+512GB SSD RTX3070 WIN 11 HOME','Desktops','ASUS','Devices',39,2385.36),
(14,'ASUS G15CF-WB7822','ASUS ROG TRIX I7 12700F 16G RTX3080 512GB SSD + 1TB HDD 750W','Desktops','ASUS','Devices',43,2002.55),
(15,'ASUS G15CF-WB7636','ASUS ROG STRIX GT15 - I7 12700F 32GB 1TB SSD RTX3060TI 700W BLACK','Desktops','ASUS','Devices',11,1890.33),
(16,'ASUS G15CF-WB5720W','ASUS ROG STRIX I5 12400F 16G RTX3070 512GB SSD + 1TB HDD 700W WIN 11 HOME','Desktops','ASUS','Devices',41,1642.57),
(17,'ASUS G15DK-21302','ASUS AMD R5 5600X 16GB 1TB SSD RTX3070 LHR 750W','Desktops','ASUS','Devices',18,1439.78),
(18,'ASUS G15DK-WB7620','ASUS ROG STRIX AMD R7 5800X 16G RTX3060 512GB SSD + 1 TB HDD WI-FI 5; BT 4.2 500W','Desktops','ASUS','Devices',7,1336.49),
(19,'DELL VOSTRO 3668','DELL VOSTRO 3668 INTEL CORE I3-7100 4GB 500GB WIN10-PRO','Desktops','DELL','Devices',30,2395.00),
(20,'Dell OptiPlex 7060 SFF','Dell OptiPlex 7060 SFF  Intel Core i7-8700 8GB DDR4 2666MHz 1TB HDD Windows 10 Pro','Desktops','DELL','Devices',43,1405.00),
(21,'HP 285 MT G3','HP 285 MT G3 AMD RYZEN 3 2200G 4GB 500GB WIN10-PRO','Desktops','HP','Devices',37,2390.00),
(22,'LENOVO LEGION T7 34/90S2005YRM','LENOVO I9-12 64GB 3TB SSD RTX3080TI','Desktops','LENOVO','Devices',36,3960.89),
(23,'LENOVO LEGION T5 26/90RC01B5RM','LENOVO R9-5 32GB 1TB SSD RTX3070TI','Desktops','LENOVO','Devices',36,2160.34),
(24,'LENOVO V520 TWR','LENOVO V520 TWR INTEL CORE I7-7700 8GB 1TB WIN10-PRO','Desktops','LENOVO','Devices',23,1773.00),
(25,'LENOVO LEGION T5 26/90RC01B6RM','LENOVO R7-5 32GB 512SSD RTX3070','Desktops','LENOVO','Devices',50,1530.25),
(26,'ACER AN517-42-R8SQ NITRO 5','ACER NITRO 5 RYZEN 5 8GB RTX3050TI 512GB SSD 17.3 FHD 144HZ M2 COMBO BLACK KBLIGHT','NOTEBOOK','ACER','Devices',13,1034.86),
(27,'ACER AN515-57-74E6 NITRO 5','ACER NITRO 5 I7-11 8G RTX3060 512GB SSD 15.6 FHD 144HZ M2 COMBO BLACK KBLIGHT','NOTEBOOK','ACER','Devices',3,989.89),
(28,'ASUS G513RM-LN397','ASUS ROG STRIX - AMD R7 6800H 16GB 1TB_SSD RTX3060 15.6'' WQHD 240HZ RGB KB GRAY','NOTEBOOK','ASUS','Devices',13,1512.09),
(29,'ASUS B5602CBN-OLED-UI74D0X','ASUS EXPERTBOOK B5 - I7 1260P 24GB 1TB_SSD ARC A350M 16'' OLED WQUXGA GLOSSY WIN 11 PRO BLACK BACKL','NOTEBOOK','ASUS','Devices',29,1503.07),
(30,'DELL XPS15 (9560)','XPS15  (9560) 7th Generation Intel(R) Core(TM) i7-7700HQ 15.6Windows 10  32GB 1TB SSD','NOTEBOOK','DELL','Devices',18,1435.00),
(31,'Dell Vostro 5471','Dell Vostro 5471 i7-8550U, 8GB 2400MHz DDR4, 256GB M.2 SSD, 14.0Windows 10 , Windows 10 Professional','NOTEBOOK','DELL','Devices',2,905.00),
(32,'HP pavilion','HP pavilion i5-8500 8GB 2666MHz DDR4 256GB HDD Windows 10 Pro','NOTEBOOK','HP','Devices',38,1712.00),
(33,'HP-Compaq','HP-Compaq INTEL CORE I3-7100 4GB 500GB WIN10-PRO','NOTEBOOK','HP','Devices',2,1645.00),
(34,'LENOVO CREATOR 5 / 82L6000EBM','LENOVO R9 32G RTX3050 1TB SSD 16 FHD IPS GRAY KBLIGHT','NOTEBOOK','LENOVO','Devices',46,1439.96),
(35,'LENOVO YOGA 7 14 / 82QF003QBM','LENOVO R7-6 32G INT 1TB SSD 14'' 2.8K OLED IPS GL WIN11 HOME GRAY TOUCH','NOTEBOOK','LENOVO','Devices',19,1439.82),
(36,'MSI SUMMIT E14 FLIP A12MT 093','MSI I7-12 16G INT 1TB SSD 14 QWXGA+ WIN11 HOME M2 PCIE BLACK THIN BACKLIT TOUCH','NOTEBOOK','MSI','Devices',22,1305.01),
(37,'MSI KATANA 17 B12VFK-204BG','MSI I7-12 16G RTX4060 512GB SSD 17.3 FHD 144HZ M2 PCIE BLACK BACKLIT','NOTEBOOK','MSI','Devices',26,1285.05),
(38,'ACER 34 CB342CKCSMIIPHUZX','ACER 34 UW-QHD <100Hz IPS 1ms 21:9 HDMI DP USB FREESYNC AUDIO HDR','MONITOR','ACER','Devices',49,427.12),
(39,'ASUS 23.8 PROART PA248Q','ASUS 24 WUXGA <100Hz IPS 6ms 16:10 HDMI DVI DP D-SUB USB FFREE PIP PIVOT SWIVEL','MONITOR','ASUS','Devices',11,398.27),
(40,'ASUS 31.5 TUF GAMING VG32VQ1BR','ASUS 31.5 FHD 165Hz 1ms 16:9 HDMI DP CURVED','MONITOR','ASUS','Devices',44,343.34),
(41,'27 GB G27Q-EK','GIGABYTE 27 QHD 144Hz IPS 1ms 16:9 HDMI DP USB AUDIO FFREE HDR','MONITOR','GIGABYTE','Devices',25,341.00),
(42,'34 LENOVO G34W-10','LENOVO 34 UW-QHD 144Hz VA 1ms 21:9 HDMI DP FREESYNC FFREE','MONITOR','LENOVO','Devices',26,400.17),
(43,'27 LG 27UP850-W','LG 27 UHD 4K <100 Hz IPS 5ms 16:9 HDMI DP USB-C FREESYNC AUDIO FSAFE HDR PIVOT','MONITOR','LG','Devices',32,434.19),
(44,'MSI 32 OPTIX MAG322CQR','MSI 31.5 WQHD 165Hz VA 1ms 16:9 HDMI DP USB-C FREESYNC FFREE CURVED','MONITOR','MSI','Devices',27,356.62),
(45,'MSI 32 OPTIX G32CQ4 VA CURVED','MSI 31.5 WQHD 165Hz VA 1ms 16:9 HDMI DP FREESYNC FFREE CURVED','MONITOR','MSI','Devices',39,338.58),
(46,'NOKIA 43 SMART TV 4300A 4K','NOKIA 43 UHD 4K HDMI D-SUB USB AUDIO HDR ANDROID TV','MONITOR','NOKIA','Devices',41,422.57),
(47,'NOKIA 43 SMART TV 4300B FHD','NOKIA 43 FHD HDMI D-SUB USB AUDIO HDR ANDROIDTV','MONITOR','NOKIA','Devices',41,350.64),
(48,'A4 B318 BLOODY LIGHT STRIKE BK','A4TECH WIRED BG KBLIGHT','KEYBOARD','A4','Devices',33,29.78),
(49,'A4 B500N BLOODY GRAY','A4TECH WIRED BG KBLIGHT','KEYBOARD','A4','Devices',9,29.70),
(50,'ASUS W5000 WL KB+MOUSE WHITE','ASUS WL COMBO','KEYBOARD','ASUS','Devices',27,37.79),
(51,'CM DEVASTATOR II BLU LED DESKT','COOLER MASTER WIRED COMBO KBLIGHT','KEYBOARD','COOLERMASTER','Devices',38,28.98),
(52,'LENOVO WL DESKTOP 510 BLACK','LENOVO WL COMBO','KEYBOARD','LENOVO','Devices',44,33.11),
(53,'LENOVO LEGIOIN K300 RGB','LENOVO WIRED RGB','KEYBOARD','LENOVO','Devices',26,32.44),
(54,'LOGITECH MK330 WL DESKTOP BK','LOGITECH WL BG COMBO','KEYBOARD','LOGITECH','Devices',34,43.04),
(55,'MS ALL IN ONE MEDIA KB','MICROSOFT WL','KEYBOARD','MICROSOFT','Devices',22,39.42),
(56,'MS WIRELESS DESKTOP 850 AES','MICROSOFT WL COMBO','KEYBOARD','MICROSOFT','Devices',40,35.30),
(57,'OMEGA KB-805 MECH USB GAMING','OMEGA WIRED BG','KEYBOARD','OMEGA','Devices',11,44.35),
(58,'A4 V7M BLOODY GAMING BLACK','A4TECH WIRED OPTICAL BLACK GAMING','MOUSE','A4','Devices',9,16.00),
(59,'A4 X-705K 3-FIRE GAME OPT USB','A4TECH WIRED OPTICAL BLACK GAMING','MOUSE','A4','Devices',11,13.50),
(60,'ACER AMR514 RF2.4 WL OPTICAL','ACER WL OPTICAL BLACK','MOUSE','ACER','Devices',17,14.53),
(61,'ACER PREDATOR GAME PAD 711','ACER MOUSE PAD GAMING','MOUSE','ACER','Devices',45,12.89),
(62,'ASUS NC05 TUF GAMING P3 PAD','ASUS MOUSE PAD GAMING','MOUSE','ASUS','Devices',3,12.80),
(63,'LOGITECH M185 WL / RED','LOGITECH WL OPTICAL RED','MOUSE','LOGITECH','Devices',16,13.88),
(64,'LOGITECH M105 /USB/BLACK','LOGITECH WIRED OPTICAL BLACK','MOUSE','LOGITECH','Devices',18,12.86),
(65,'MS WL MOBILE MOUSE 1850 BLACK','MICROSOFT WL OPTICAL BLACK','MOUSE','MICROSOFT','Devices',5,14.10),
(66,'MSI GAMING CLUTCH GM08','MSI WIRED OPTICAL BLACK GAMING','MOUSE','MSI','Devices',37,14.90),
(67,'OMEGA CMM293RD /7D /BLACK-RED','OMEGA WIRED OPTICAL RED GAMING','MOUSE','OMEGA','Devices',11,13.05),
(68,'CANON MF-461DW AIO LASER','CANON LASER AIO MONO 36PPM 80K DUPLEX LAN WIFI','PRINTER','CANON','Devices',30,325.32),
(69,'CANON MF-463DW AIO LASER','CANON LASER AIO MONO 40PPM 80K DUPLEX LAN WIFI','PRINTER','CANON','Devices',41,340.11),
(70,'CANON MF-752CDW AIO CLR LASER','CANON LASER AIO COLOR 33PPM 30K LAN CLOUD ADF','PRINTER','CANON','Devices',4,389.63),
(71,'A4 PK-930HA 1080P','A4TECH WEBCAM FHD USB2.0 MIC AUTOFOCUS','WEB CAMERA','A4','Devices',16,34.50),
(72,'LENOVO 300 FHD W/MIC','LENOVO WEBCAM FHD USB2.0 MIC','WEB CAMERA','LENOVO','Devices',45,31.10),
(73,'LOGITECH HD PRO WEBCAM C920','LOGITECH WEBCAM FHD USB2.0 MIC','WEB CAMERA','LOGITECH','Devices',4,80.82),
(74,'REP EXT CAMERA CASE TH-500','REPOTEC ACCESSORIES EXTERNAL CAMERA CASE','WEB CAMERA','REPOTEC','Devices',42,6.00),
(75,'TENDA K4W-3TC 4CH WL HD VIDEO','TENDA WIFI HD 4PCS USB2.0 MIC IP66','WEB CAMERA','TENDA','Devices',3,156.68),
(76,'ASROCK B650 PG LIGHTNING /AM5','ASROCK B650 4xDDR5 4xSATA3 RAID HDMI DVI 2xM2 GLAN 2xPCIEx16 2xPCIEx1','MAIN BOARD','ASROCK','Hardware',22,200.50),
(77,'ASROCK B550 PHANTOM GAM-ITX/AX','ASROCK B550 2xDDR4 4xSATA3 RAID HDMI DP 2xM2 GLAN 1xPCIEx16 WiFi','MAIN BOARD','ASROCK','Hardware',32,185.00),
(78,'ASUS ROG STRIX B560-A GAMIN WF','ASUS B560 4xDDR4 6xSATA3 HDMI DP 2xM2 GLAN 2xPCIEx16 3xPCIEx1 WiFi','MAIN BOARD','ASUS','Hardware',25,203.00),
(79,'ASUS ROG STRIX B560-G GAMIN WF','ASUS B560 4xDDR4 6xSATA3 HDMI DP 2xM2 GLAN 2xPCIEx16 2xPCIEx1 WiFi','MAIN BOARD','ASUS','Hardware',41,195.00),
(80,'GB Z690 UD /LGA1700','GB Z690 4xDDR5 6xSATA3 RAID HDMI DP 3xM2 GLAN 3xPCIEx16 3xPCIEx1 WiFI','MAIN BOARD','GIGABYTE','Hardware',7,196.00),
(81,'GB B550 AORUS PRO AC /AM4','GB B550 4xDDR4 6xSATA3 RAID HDMI 2xM2 GLAN 3xPCIEx16 2xPCIEx1','MAIN BOARD','GIGABYTE','Hardware',23,187.00),
(82,'MSI MAG Z490 TOMAHAWK /LGA1200','MSI Z490 4xDDR4 6xSATA3 RAID HDMI DP 3xM2 GLAN 2xPCIEx16 2xPCIEx1','MAIN BOARD','MSI','Hardware',42,207.40),
(83,'MSI PRO Z690-A DDR4 /LGA1700','MSI Z690 4xDDR4 6xSATA3 RAID HDMI DP 4xM2 1XGLAN 3xPCIEx16 1xPCIEx1','MAIN BOARD','MSI','Hardware',4,204.00),
(84,'AMD RYZEN 5 2400G','AMD RYZEN 5 2400G 3.9 GHZ CPU 4 CORE 8 THREAD 6 MB CACHE SKT AM4 WITH RX VEGA GRAPHICS','CPUs','AMD','Hardware',48,111.00),
(85,'THREADRIPPER 2920X','AMD RYZEN THREADRIPPER 2920X 4.3 GHZ CPU 12 CORE 24 THREAD 38 MB CACHE SKT TR4','CPUs','AMD','Hardware',39,134.00),
(86,'THREADRIPPER 2970X','AMD RYZEN THREADRIPPER 2970X 4.2 GHZ CPU 24 CORE 48 THREAD 76 MB CACHE SKT TR4','CPUs','AMD','Hardware',38,134.00),
(87,'Intel Core i5 9600K','Intel Core i5 9600K 3.70 GHZ, Turbo   4.6GHZ, 6 Core, 6 Thread, 9MB Smartcache, 95W TDP','CPUs','INTEL','Hardware',17,89.00),
(88,'Intel Core i7 9700K','Intel Core i7 9700K 3.60 GHZ, Turbo   4.9GHZ, 8 Core, 8 Thread, 12MB Smartcache, 95W TDP','CPUs','INTEL','Hardware',47,80.00),
(89,'Intel Core i9 9900K','Intel Core i9 9900K 3.60 GHZ, Turbo   5.0GHZ, 8 Core, 16 Thread, 16MB Smartcache, 95W TDP','CPUs','INTEL','Hardware',35,136.00),
(90,'GW RTX3080TI PHANTOM 12G','GAINWARD NVIDIA RTX3080TI HDMI DP 384B 12GB ACTIVE','VIDEO CARD','GAINWARD','Hardware',27,1232.00),
(91,'GB N3090GAMING OC-24GD','GB NVIDIA RTX3090 HDMI DP 384B 24GB ACTIVE','VIDEO CARD','GIGABYTE','Hardware',47,1325.00),
(92,'GB N308TGAMING OC-12GD','GB NVIDIA RTX3080TI HDMI DP 384B 12GB ACTIVE','VIDEO CARD','GIGABYTE','Hardware',43,1137.00),
(93,'GB R69XTGAMING OC-16GD','GB AMD RX6900XT HDMI DP 256B 16GB ACTIVE','VIDEO CARD','GIGABYTE','Hardware',38,1130.00),
(94,'GB R695XTGAMING OC-16GD','GIGABYTE AMD RX6950XT HDMI DP 256B 16GB ACTIVE','VIDEO CARD','GIGABYTE','Hardware',26,1047.00),
(95,'MSI RTX3080 VENT3X PLUS 12 OC','MSI NVIDIA RTX3080 HDMI DP 384B 12GB ACTIVE','VIDEO CARD','MSI','Hardware',13,1242.00),
(96,'MSI RTX3080TI VENTUS 3X 12G OC','MSI NVIDIA RTX3080TI HDMI DP 384B 12GB ACTIVE','VIDEO CARD','MSI','Hardware',14,1178.00),
(97,'MSI RX6950XT GAMING X TRIO 16G','MSI AMD RX6950XT HDMI DP 256B 16GB ACTIVE','VIDEO CARD','MSI','Hardware',9,1085.00),
(98,'PALIT RTX3090TI GAMEROCK 24G','PALIT NVIDIA RTX3090TI HDMI DP 384B 24GB ACTIVE','VIDEO CARD','PALIT','Hardware',6,1255.00),
(99,'PALIT RTX3080TI GAMEROCK 12G','PALIT NVIDIA RTX3080TI HDMI DP 384B 12GB ACTIVE','VIDEO CARD','PALIT','Hardware',40,1059.00),
(100,'4G DDR4 2666 ADATA','ADATA DESKTOP 4GB DDR4 2666MHZ','RAM','ADATA','Hardware',48,10.60),
(101,'8G DDR4 3200 ADATA','ADATA DESKTOP 8GB DDR4 3200MHZ','RAM','ADATA','Hardware',35,17.10),
(102,'8GB DDR5 5200 ADATA HUNTER','ADATA DESKTOP 8GB DDR5 5200MHZ HEAT SINK','RAM','ADATA','Hardware',16,27.60),
(103,'16G DDR4 2666 ADATA','ADATA DESKTOP 16GB DDR4 2666MHZ','RAM','ADATA','Hardware',20,29.10),
(104,'4G DDR4 3200 KINGST FURY BEAST','KINGSTON DESKTOP 4GB DDR4 3200MHZ HEAT SINK','RAM','KINGSTON','Hardware',6,18.80),
(105,'8G DDR4 2666 KINGSTON','KINGSTON DESKTOP 8GB DDR4 2666MHZ','RAM','KINGSTON','Hardware',41,18.70),
(106,'8GB DDR5 4800 KINGSTON','KINGSTON DESKTOP 8GB DDR5 4800MHZ','RAM','KINGSTON','Hardware',31,30.80),
(107,'4G DDR3 1600 TEAM ELITE','TEAM GROUP 4GB DDR3 1600MHZ','RAM','TEAM','Hardware',7,19.90),
(108,'8GB DDR3 1600 TEAM ELITE','TEAM GROUP 8GB DDR3 1600MHZ','RAM','TEAM','Hardware',31,20.40),
(109,'16G DDR4 3200 TEAM ELITE','TEAM GROUP DESKTOP 16GB DDR4 3200MHZ','RAM','TEAM','Hardware',35,29.20),
(110,'Antec C40','Antec C40 92mm CPU Cooler','CPU Cooler','ANTEC','Hardware',1,10.00),
(111,'NEPTON 280L','COOLERMASTER NEPTON 280L LIQUID CPU COOLER 280MM RADIATOR','CPU Cooler','COOLERMASTER','Hardware',50,31.00),
(112,'INTEL AIR','INTEL AIR COOLING SOLUTION FOR INTEL LGA 2011 V3','CPU Cooler','INTEL','Hardware',4,24.00),
(113,'CPU COOLER FOR INTEL I5 /1151','INTEL AIR CPU ACTIVE FAN 92MM LGA 1156 1155 1151 1150','CPU Cooler','INTEL','Hardware',35,9.60),
(114,'XEON 26XX BXSTS200PNRW TRM SOL','INTEL AIR CPU PASSIVE','CPU Cooler','INTEL','Hardware',34,6.00),
(115,'BITFENIX SPECTRE ADDR RGB 12CM','BITFENIX AIR CASE FAN 120MM RGB','CASE fan','BITFENIX','Hardware',36,10.25),
(116,'BITFENIX SPECTRE RGB 12CM','BITFENIX AIR CASE FAN 120MM RGB','CASE fan','BITFENIX','Hardware',23,9.09),
(117,'CM 20CM CASE FAN/SILENT BLUE','COOLER MASTER AIR CASE FAN 200MM BLUE','CASE fan','COOLERMASTER','Hardware',13,13.40),
(118,'CM MASTERFAN MF140R ARGB','COOLER MASTER AIR CASE FAN 140MM RGB','CASE fan','COOLERMASTER','Hardware',27,12.90),
(119,'CM MF120R ARGB 120MM','COOLER MASTER AIR CASE FAN 120MM RGB','CASE fan','COOLERMASTER','Hardware',10,12.80),
(120,'CM 20CM CASE FAN/SILENT RED','COOLER MASTER AIR CASE FAN 200MM RED','CASE fan','COOLERMASTER','Hardware',29,12.80);

-- DONE


USE company;

INSERT INTO invoice (invoice_id, employee_id, customer_id, payment_method,transaction_moment,status) VALUES
('20220902081028',24,73,1, '2022-09-02 08:10:28',2),
('20220903091341',26,69,3, '2022-09-03 09:13:41',3),
('20220904085624',34,94,2, '2022-09-04 08:56:24',4),
('20220905101747',40,NULL,3, '2022-09-05 10:17:47',3),
('20220906092712',22,91,3, '2022-09-06 09:27:12',2),
('20220907093931',41,29,1, '2022-09-07 09:39:31',2),
('20220908082145',46,78,1, '2022-09-08 08:21:45',1),
('20220909092219',28,62,1, '2022-09-09 09:22:19',2),
('20220910093446',39,91,2, '2022-09-10 09:34:46',4),
('20220911110411',21,89,1, '2022-09-11 11:04:11',2),
('20220912081145',39,49,2, '2022-09-12 08:11:45',4),
('20220913081549',41,75,2, '2022-09-13 08:15:49',3),
('20220914092546',30,13,1, '2022-09-14 09:25:46',4),
('20220915081136',32,90,1, '2022-09-15 08:11:36',3),
('20220916080537',32,5,2, '2022-09-16 08:05:37',4),
('20220918103356',20,NULL,1, '2022-09-18 10:33:56',3),
('20220919105726',23,97,2, '2022-09-19 10:57:26',4),
('20220920153633',37,37,1, '2022-09-20 15:36:33',4),
('20220921095638',30,92,1, '2022-09-21 09:56:38',2),
('20220922155604',29,75,2, '2022-09-22 15:56:04',1),
('20220923092352',30,15,2, '2022-09-23 09:23:52',2),
('20220924092429',40,58,1, '2022-09-24 09:24:29',1),
('20220925100217',24,86,2, '2022-09-25 10:02:17',3),
('20220926083546',31,87,2, '2022-09-26 08:35:46',2),
('20220927115121',36,74,3, '2022-09-27 11:51:21',2),
('20220928080404',42,33,1, '2022-09-28 08:04:04',1),
('20220929105613',34,62,3, '2022-09-29 10:56:13',4),
('20220930094807',41,5,3, '2022-09-30 09:48:07',4),
('20221001134721',38,36,3, '2022-10-01 13:47:21',2),
('20221002095538',24,NULL,2, '2022-10-02 09:55:38',1),
('20221003105755',21,7,1, '2022-10-03 10:57:55',1),
('20221004080619',34,92,1, '2022-10-04 08:06:19',4),
('20221005080305',31,5,1, '2022-10-05 08:03:05',4),
('20221006093945',30,31,3, '2022-10-06 09:39:45',4),
('20221007100219',33,23,2, '2022-10-07 10:02:19',3),
('20221008154504',21,35,3, '2022-10-08 15:45:04',3),
('20221009101650',26,28,2, '2022-10-09 10:16:50',1),
('20221010140111',30,43,2, '2022-10-10 14:01:11',2),
('20221011081948',32,28,3, '2022-10-11 08:19:48',4),
('20221012104850',21,26,2, '2022-10-12 10:48:50',4),
('20221013093549',27,9,2, '2022-10-13 09:35:49',1),
('20221014112444',20,71,3, '2022-10-14-11:24:44',2),
('20221016101556',34,99,3, '2022-10-16 10:15:56',2),
('20221017122555',45,54,3, '2022-10-17 12:25:55',4),
('20221018144516',33,NULL,2, '2022-10-18 14:45:16',4),
('20221020113719',29,42,1, '2022-10-20 11:37:19',3),
('20221021115347',27,90,2, '2022-10-21 11:53:47',2),
('20221022113941',30,99,3, '2022-10-22 11:39:41',2),
('20221023084709',30,55,3, '2022-10-23 08:47:09',4),
('20221024131046',28,36,2, '2022-10-24 13:10:46',2),
('20221026091220',29,67,2, '2022-10-26 09:12:20',2),
('20221027111157',46,60,2, '2022-10-27 11:11:57',2),
('20221028141533',22,79,3, '2022-10-28 14:15:33',4),
('20221029132027',27,23,2, '2022-10-29 13:20:27',4),
('20221030103637',37,76,1, '2022-10-30 10:36:37',1),
('20221031104020',39,70,3, '2022-10-31 10:40:20',3),
('20221101153719',43,55,2, '2022-11-01 15:37:19',3),
('20221102111635',24,15,3, '2022-11-02 11:16:35',2),
('20221103082018',40,40,1, '2022-11-03 08:20:18',3),
('20221104115909',24,12,2, '2022-11-04 11:59:09',4),
('20221105080227',20,90,2, '2022-11-05 08:02:27',4),
('20221106145123',27,43,3, '2022-11-06 14:51:23',2),
('20221107081502',28,52,3, '2022-11-07 08:15:02',3),
('20221108085357',34,17,2, '2022-11-08 08:53:57',1),
('20221109102344',44,73,1, '2022-11-09 10:23:44',4),
('20221110101127',30,NULL,1, '2022-11-10 10:11:27',3),
('20221111090355',40,11,2, '2022-11-11 09:03:55',3),
('20221112093242',34,20,2, '2022-11-12 09:32:42',3),
('20221113092817',45,61,1, '2022-11-13 09:28:17',3),
('20221114092513',31,51,2, '2022-11-14 09:25:13',3),
('20221115143633',42,36,2, '2022-11-15 14:36:33',2),
('20221116092459',30,5,2, '2022-11-16 09:24:59',1),
('20221117082845',39,43,1, '2022-11-17 08:28:45',4),
('20221118093805',22,43,3, '2022-11-18 09:38:05',4),
('20221119140200',41,30,3, '2022-11-19 14:02:00',1),
('20221120123719',45,90,1, '2022-11-20 12:37:19',3),
('20221121114007',45,55,2, '2022-11-21 11:40:07',1),
('20221122084227',33,22,3, '2022-11-22 08:42:27',4),
('20221123080527',29,92,1, '2022-11-23 08:05:27',2),
('20221124080423',45,30,1, '2022-11-24 08:04:23',2),
('20221125134853',33,91,2, '2022-11-25 13:48:53',3),
('20221126081608',21,15,1, '2022-11-26 08:16:08',1),
('20221127090845',36,40,2, '2022-11-27 09:08:45',2),
('20221128112837',34,NULL,3, '2022-11-28 11:28:37',4),
('20221129082457',20,68,3, '2022-11-29 08:24:57',4),
('20221130135643',31,70,2, '2022-11-30 13:56:43',1),
('20221201095932',45,78,1, '2022-12-01 09:59:32',2),
('20221202105037',25,14,1, '2022-12-02 10:50:37',3),
('20221203121755',26,8,3, '2022-12-03 12:17:55',2),
('20221204110626',42,7,2, '2022-12-04 11:06:26',3),
('20221205121237',24,43,2, '2022-12-05 12:12:37',1),
('20221206114818',43,NULL,1, '2022-12-06 11:48:18',4),
('20221207085637',28,92,3, '2022-12-07 08:56:37',4),
('20221208102938',25,87,2, '2022-12-08 10:29:38',4),
('20221209163708',44,55,3, '2022-12-09 16:37:08',1),
('20221211093930',32,100,1, '2022-12-11 09:39:30',3),
('20221212090437',42,64,3, '2022-12-12 09:04:37',1),
('20221213124544',21,59,3, '2022-12-13 12:45:44',3),
('20221216091652',38,85,2, '2022-12-16 09:16:52',4),
('20221217095904',33,65,1, '2022-12-17 09:59:04',2),
('20221218120730',25,70,1, '2022-12-18 12:07:30',4),
('20221219120810',43,87,1, '2022-12-19 12:08:10',3),
('20221220091814',45,50,3, '2022-12-20 09:18:14',1),
('20221221082948',28,23,2, '2022-12-21 08:29:48',3),
('20221222160400',34,21,2, '2022-12-22 16:04:00',2),
('20221223095737',23,84,1, '2022-12-23 09:57:37',4),
('20221224101939',46,26,3, '2022-12-24 10:19:39',2),
('20221225083835',32,95,3, '2022-12-25 08:38:35',2),
('20221226084017',42,NULL,2, '2022-12-26 08:40:17',3),
('20221227152900',42,68,1, '2022-12-27 15:29:00',2),
('20221228114228',37,35,2, '2022-12-28 11:42:28',2),
('20221229085643',40,42,2, '2022-12-29 08:56:43',3),
('20221230163731',35,27,3, '2022-12-30 16:37:31',2),
('20221231103940',23,29,3, '2022-12-31 10:39:40',2),
('20230101102853',20,78,2, '2023-01-01 10:28:53',3),
('20230102080948',44,86,1, '2023-01-02 08:09:48',4),
('20230103103555',30,NULL,1, '2023-01-03 10:35:55',4),
('20230104084729',33,86,2, '2023-01-04 08:47:29',4),
('20230105130740',36,51,1, '2023-01-05 13:07:40',1),
('20230106080232',24,88,2, '2023-01-06 08:02:32',4),
('20230107094704',26,62,3, '2023-01-07 09:47:04',1),
('20230108082225',27,29,2, '2023-01-08 08:22:25',2),
('20230109102730',44,21,3, '2023-01-09 10:27:30',1),
('20230110100054',28,67,1, '2023-01-10 10:00:54',3),
('20230111091748',20,21,1, '2023-01-11 09:17:48',3),
('20230112093456',29,95,1, '2023-01-12 09:34:56',3),
('20230113110653',36,NULL,2, '2023-01-13 11:06:53',3),
('20230114102800',41,73,3, '2023-01-14 10:28:00',2),
('20230115085946',39,53,1, '2023-01-15 08:59:46',4),
('20230116091324',35,8,3, '2023-01-16 09:13:24',4),
('20230117095246',33,31,1, '2023-01-17 09:52:46',2),
('20230120103303',36,91,2, '2023-01-20 10:33:03',3),
('20230121085140',35,83,1, '2023-01-21 08:51:40',2),
('20230122085029',42,24,1, '2023-01-22 08:50:29',2),
('20230124080430',32,87,1, '2023-01-24 08:04:30',3),
('20230125123428',21,36,1, '2023-01-25 12:34:28',3),
('20230126084739',44,17,3, '2023-01-26 08:47:39',4),
('20230127115130',21,53,2, '2023-01-27 11:51:30',4),
('20230128082400',32,1,2, '2023-01-28 08:24:00',1),
('20230129154928',25,99,3, '2023-01-29 15:49:28',3),
('20230131161140',31,99,1, '2023-01-31 16:11:40',2),
('20230201094338',25,19,2, '2023-02-01 09:43:38',2),
('20230202120247',31,73,2, '2023-02-02 12:02:47',2),
('20230203082836',44,82,1, '2023-02-03 08:28:36',1),
('20230204081831',21,45,3, '2023-02-04 08:18:31',2),
('20230205080833',30,52,3, '2023-02-05 08:08:33',1),
('20230206150923',31,90,2, '2023-02-06 15:09:23',4),
('20230207142655',35,64,2, '2023-02-07 14:26:55',3),
('20230208094200',40,58,2, '2023-02-08 09:42:00',1),
('20230211093131',33,41,2, '2023-02-11 09:31:31',2),
('20230212140457',46,4,3, '2023-02-12 14:04:57',2),
('20230213083301',43,91,3, '2023-02-13 08:33:01',1),
('20230215093002',20,64,3, '2023-02-15 09:30:02',1),
('20230216131850',32,NULL,2, '2023-02-16 13:18:50',1),
('20230217121250',44,72,3, '2023-02-17 12:12:50',4),
('20230218091837',29,3,2, '2023-02-18 09:18:37',3),
('20230219110144',30,93,2, '2023-02-19 11:01:44',4),
('20230221115150',36,19,2, '2023-02-21 11:51:50',4),
('20230222103047',32,21,3, '2023-02-22 10:30:47',3),
('20230223094246',39,66,3, '2023-02-23 09:42:46',3),
('20230225165417',31,28,2, '2023-02-25 16:54:17',2),
('20230226091819',36,61,2, '2023-02-26 09:18:19',1),
('20230227101742',21,19,3, '2023-02-27 10:17:42',3),
('20230228153809',28,NULL,3, '2023-02-28 15:38:09',4),
('20230301112636',30,70,1, '2023-03-01 11:26:36',3),
('20230303082405',37,6,2, '2023-03-03 08:24:05',2),
('20230304085525',36,48,2, '2023-03-04 08:55:25',3),
('20230305135650',24,52,1, '2023-03-05 13:56:50',3),
('20230306113208',30,20,3, '2023-03-06 11:32:08',3),
('20230307110043',40,18,2, '2023-03-07 11:00:43',3),
('20230308094818',38,10,2, '2023-03-08 09:48:18',2),
('20230310112732',34,83,3, '2023-03-10 11:27:32',4),
('20230311080909',25,83,1, '2023-03-11 08:09:09',1),
('20230312090442',22,50,3, '2023-03-12 09:04:42',1),
('20230313111207',42,29,1, '2023-03-13 11:12:07',1),
('20230314143737',20,2,2, '2023-03-14 14:37:37',1),
('20230315091032',29,74,2, '2023-03-15 09:10:32',4),
('20230316122131',32,85,1, '2023-03-16 12:21:31',4),
('20230318090750',43,100,2, '2023-03-18 09:07:50',1),
('20230319085143',45,20,3, '2023-03-19 08:51:43',2),
('20230320090914',46,43,2, '2023-03-20 09:09:14',4),
('20230321094839',41,100,1, '2023-03-21 09:48:39',1),
('20230322084916',38,32,1, '2023-03-22 08:49:16',2),
('20230323084347',26,63,3, '2023-03-23 08:43:47',1),
('20230324133653',23,44,2, '2023-03-24 13:36:53',2),
('20230325090519',40,19,2, '2023-03-25 09:05:19',1),
('20230326095155',43,73,2, '2023-03-26 09:51:55',1),
('20230327094802',37,27,1, '2023-03-27 09:48:02',3),
('20230328084434',35,71,3, '2023-03-28 08:44:34',1),
('20230329162535',33,78,2, '2023-03-29 16:25:35',2),
('20230330090712',38,90,2, '2023-03-30 09:07:12',3),
('20230331115304',24,52,3, '2023-03-31 11:53:04',3),
('20230401150704',44,15,1, '2023-04-01 15:07:04',3),
('20230402082820',46,15,2, '2023-04-02 08:28:20',1),
('20230403110024',20,17,2, '2023-04-03 11:00:24',4),
('20230404090307',34,67,2, '2023-04-04 09:03:07',4),
('20230405093058',26,66,3, '2023-04-05 09:30:58',1),
('20230406110600',45,36,3, '2023-04-06 11:06:00',3),
('20230407105619',34,46,1, '2023-04-07 10:56:19',3),
('20230408124714',36,55,1, '2023-04-08 12:47:14',2),
('20230409113133',38,25,3, '2023-04-09 11:31:33',1),
('20230410082807',27,80,1, '2023-04-10 08:28:07',4),
('20230411083933',25,21,3, '2023-04-11 08:39:33',2),
('20230412164105',40,41,1, '2023-04-12 16:41:05',3),
('20230413082152',43,2,3, '2023-04-13 08:21:52',2),
('20230414084442',31,18,3, '2023-04-14 08:44:42',3),
('20230415104310',20,34,3, '2023-04-15 10:43:10',2),
('20230416130721',23,72,1, '2023-04-16 13:07:21',4),
('20230417102936',23,84,1, '2023-04-17 10:29:36',4),
('20230418121036',31,21,2, '2023-04-18 12:10:36',3),
('20230419122942',35,68,1, '2023-04-19 12:29:42',4),
('20230420092126',25,24,1, '2023-04-20 09:21:26',4),
('20230421083926',33,76,2, '2023-04-21 08:39:26',3),
('20230422125427',43,80,2, '2023-04-22 12:54:27',3),
('20230423080107',42,50,3, '2023-04-23 08:01:07',2),
('20230424091510',31,85,3, '2023-04-24 09:15:10',4),
('20230425143519',44,12,1, '2023-04-25 14:35:19',1),
('20230426091737',29,58,1, '2023-04-26 09:17:37',2),
('20230427101411',44,45,3, '2023-04-27 10:14:11',1),
('20230428084649',32,39,2, '2023-04-28 08:46:49',2),
('20230429161938',26,14,2, '2023-04-29 16:19:38',2),
('20230430090559',38,5,2, '2023-04-30 09:05:59',3),
('20230501145515',33,94,1, '2023-05-01 14:55:15',3),
('20230502162642',43,19,1, '2023-05-02 16:26:42',2),
('20230503094044',39,43,2, '2023-05-03 09:40:44',4),
('20230504140551',25,88,1, '2023-05-04 14:05:51',1),
('20230505081757',21,30,1, '2023-05-05 08:17:57',4),
('20230507083734',38,91,3, '2023-05-07 08:37:34',2),
('20230508081239',41,21,2, '2023-05-08 08:12:39',3),
('20230510140617',34,64,3, '2023-05-10 14:06:17',2),
('20230511102613',37,84,2, '2023-05-11 10:26:13',4),
('20230512080653',27,20,1, '2023-05-12 08:06:53',4),
('20230513115948',20,28,3, '2023-05-13 11:59:48',3),
('20230514164300',26,78,1, '2023-05-14 16:43:00',1),
('20230515095721',23,34,3, '2023-05-15 09:57:21',1),
('20230517094409',22,49,3, '2023-05-17 09:44:09',2),
('20230518150804',35,29,1, '2023-05-18 15:08:04',3),
('20230519165526',45,13,1, '2023-05-19 16:55:26',3),
('20230520151216',45,87,1, '2023-05-20 15:12:16',4),
('20230521080645',24,36,2, '2023-05-21 08:06:45',1),
('20230522085836',44,85,2, '2023-05-22 08:58:36',3),
('20230523112156',29,5,3, '2023-05-23 11:21:56',2),
('20230524121423',41,32,1, '2023-05-24 12:14:23',4),
('20230525104235',21,8,1, '2023-05-25 10:42:35',3),
('20230526090132',38,8,1, '2023-05-26 09:01:32',4),
('20230527092304',39,66,3, '2023-05-27 09:23:04',3),
('20230528152203',23,45,3, '2023-05-28 15:22:03',3),
('20230529085914',31,79,1, '2023-05-29 08:59:14',3),
('20230530141015',44,65,2, '2023-05-30 14:10:15',1),
('20230531090427',45,27,3, '2023-05-31 09:04:27',3),
('20230601135524',37,3,2, '2023-06-01 13:55:24',1),
('20230602165607',30,57,1, '2023-06-02 16:56:07',2),
('20230603080928',32,10,2, '2023-06-03 08:09:28',1),
('20230604121603',45,78,2, '2023-06-04 12:16:03',1),
('20230606153442',21,55,2, '2023-06-06 15:34:42',1),
('20230607082024',43,54,3, '2023-06-07 08:20:24',4),
('20230608082747',38,44,1, '2023-06-08 08:27:47',3),
('20230609124014',44,78,2, '2023-06-09 12:40:14',3),
('20230610142847',30,57,1, '2023-06-10 14:28:47',2),
('20230611105402',42,55,2, '2023-06-11 10:54:02',1),
('20230612092140',46,81,2, '2023-06-12 09:21:40',4),
('20230613111256',20,96,3, '2023-06-13 11:12:56',2),
('20230614115905',32,53,1, '2023-06-14 11:59:05',1),
('20230615110452',36,42,1, '2023-06-15 11:04:52',2),
('20230616144919',31,97,2, '2023-06-16 14:49:19',4),
('20230617091037',37,21,2, '2023-06-17 09:10:37',2),
('20230619081635',26,50,2, '2023-06-19 08:16:35',4),
('20230620154928',45,86,1, '2023-06-20 15:49:28',4),
('20230621081800',26,78,3, '2023-06-21 08:18:00',3),
('20230622085539',36,38,2, '2023-06-22 08:55:39',4),
('20230623165149',40,7,1, '2023-06-23 16:51:49',1),
('20230624090512',30,22,2, '2023-06-24 09:05:12',1),
('20230625101421',43,64,1, '2023-06-25 10:14:21',1),
('20230626101455',35,64,3, '2023-06-26 10:14:55',2),
('20230627142906',29,46,1, '2023-06-27 14:29:06',1),
('20230629100705',25,12,1, '2023-06-29 10:07:05',3),
('20230630114627',31,48,2, '2023-06-30 11:46:27',1),
('20230701085510',22,12,1, '2023-07-01 08:55:10',1),
('20230703084052',22,3,1, '2023-07-03 08:40:52',3),
('20230704101119',36,9,3, '2023-07-04 10:11:19',3),
('20230705104825',24,99,1, '2023-07-05 10:48:25',1),
('20230706150307',23,56,3, '2023-07-06 15:03:07',2),
('20230707142729',34,12,1, '2023-07-07 14:27:29',4),
('20230708090056',39,23,2, '2023-07-08 09:00:56',2),
('20230709133020',32,46,1, '2023-07-09 13:30:20',4),
('20230710085712',29,24,1, '2023-07-10 08:57:12',4),
('20230711090132',33,40,2, '2023-07-11 09:01:32',1),
('20230712100440',22,36,2, '2023-07-12 10:04:40',4),
('20230713111653',33,55,1, '2023-07-13 11:16:53',4),
('20230714111007',21,55,3, '2023-07-14 11:10:07',1),
('20230715095745',25,71,2, '2023-07-15 09:57:45',1),
('20230716092852',26,52,1, '2023-07-16 09:28:52',3),
('20230717095235',45,7,1, '2023-07-17 09:52:35',3),
('20230718095332',40,82,2, '2023-07-18 09:53:32',1),
('20230719085240',32,44,3, '2023-07-19 08:52:40',3),
('20230720083913',26,47,3, '2023-07-20 08:39:13',1),
('20230722165308',23,55,1, '2023-07-22 16:53:08',4),
('20230723110619',37,37,2, '2023-07-23 11:06:19',1),
('20230724095022',33,57,3, '2023-07-24 09:50:22',2),
('20230725103649',35,9,1, '2023-07-25 10:36:49',3),
('20230726101959',27,45,3, '2023-07-26 10:19:59',2),
('20230727122620',42,29,2, '2023-07-27 12:26:20',4),
('20230728091306',23,9,2, '2023-07-28 09:13:06',3),
('20230729101655',39,12,2, '2023-07-29 10:16:55',2),
('20230730155039',23,98,1, '2023-07-30 15:50:39',1),
('20230731145746',26,40,1, '2023-07-31 14:57:46',1),
('20230801092906',26,54,3, '2023-08-01 09:29:06',4),
('20230802084728',30,98,3, '2023-08-02 08:47:28',4),
('20230803082351',44,35,3, '2023-08-03 08:23:51',2),
('20230804081504',21,65,3, '2023-08-04 08:15:04',3),
('20230805083423',45,76,2, '2023-08-05 08:34:23',4),
('20230806103330',41,47,1, '2023-08-06 10:33:30',1),
('20230807154957',26,93,3, '2023-08-07 15:49:57',2),
('20230808113204',42,66,2, '2023-08-08 11:32:04',2),
('20230810083928',44,17,1, '2023-08-10 08:39:28',3),
('20230811085146',29,8,1, '2023-08-11 08:51:46',2),
('20230812092037',24,6,1, '2023-08-12 09:20:37',1),
('20230813084348',22,17,3, '2023-08-13 08:43:48',4),
('20230814105019',41,62,2, '2023-08-14 10:50:19',1),
('20230815135815',33,56,3, '2023-08-15 13:58:15',2),
('20230816141832',27,13,1, '2023-08-16 14:18:32',1),
('20230817090340',36,98,3, '2023-08-17 09:03:40',1),
('20230818085320',35,19,2, '2023-08-18 08:53:20',4),
('20230819084942',20,95,3, '2023-08-19 08:49:42',1),
('20230820121227',31,42,2, '2023-08-20 12:12:27',2),
('20230821082602',30,89,3, '2023-08-21 08:26:02',2),
('20230822132342',20,8,1, '2023-08-22 13:23:42',1),
('20230823113617',22,33,3, '2023-08-23 11:36:17',1),
('20230824080755',39,75,2, '2023-08-24 08:07:55',1),
('20230825134330',35,97,1, '2023-08-25 13:43:30',2),
('20230826104905',37,69,3, '2023-08-26 10:49:05',4),
('20230827121117',45,57,1, '2023-08-27 12:11:17',2),
('20230828140218',27,2,3, '2023-08-28 14:02:18',3),
('20230829112926',30,95,2, '2023-08-29 11:29:26',4),
('20230830085705',38,66,3, '2023-08-30 08:57:05',1),
('20230831092715',24,85,2, '2023-08-31 09:27:15',3),
('20230901124414',32,82,3, '2023-09-01 12:44:14',1),
('20230902083100',42,55,3, '2023-09-02 08:31:00',3),
('20230903093633',46,17,1, '2023-09-03 09:36:33',1),
('20230904093315',27,40,3, '2023-09-04 09:33:15',3),
('20230905094958',27,71,3, '2023-09-05 09:49:58',4),
('20230906083348',23,11,3, '2023-09-06 08:33:48',1),
('20230907131653',21,49,1, '2023-09-07 13:16:53',1),
('20230908114334',35,15,3, '2023-09-08 11:43:34',2),
('20230909085407',29,9,2, '2023-09-09 08:54:07',2),
('20230910121439',45,67,3, '2023-09-10 12:14:39',4),
('20230912100021',21,14,1, '2023-09-12 10:00:21',2),
('20230913150043',39,25,1, '2023-09-13 15:00:43',1),
('20230914095933',37,31,1, '2023-09-14 09:59:33',3),
('20230915083445',42,32,2, '2023-09-15 08:34:45',3),
('20230916100600',23,28,2, '2023-09-16 10:06:00',4),
('20230917155306',42,45,3, '2023-09-17 15:53:06',3),
('20230918081052',22,10,2, '2023-09-18 08:10:52',2),
('20230919130759',25,26,1, '2023-09-19 13:07:59',4),
('20230920123759',22,33,3, '2023-09-20 12:37:59',2),
('20230921091036',32,99,2, '2023-09-21 09:10:36',1),
('20230922111119',35,3,3, '2023-09-22 11:11:19',4),
('20230923115601',43,43,1, '2023-09-23 11:56:01',3),
('20230924114050',44,53,2, '2023-09-24 11:40:50',3),
('20230925102003',36,100,3, '2023-09-25 10:20:03',2),
('20230926085404',20,25,2, '2023-09-26 08:54:04',1),
('20230927122133',39,18,1, '2023-09-27 12:21:33',4),
('20230928103729',30,78,2, '2023-09-28 10:37:29',3),
('20230929090346',23,63,3, '2023-09-29 09:03:46',2),
('20230930120601',26,7,1, '2023-09-30 12:06:01',3),
('20231001081816',30,25,1, '2023-10-01 08:18:16',2);




-- DONE

INSERT INTO orders (orders_id, invoice_id, product_id, order_datetime, quantity) VALUES
(1,'20220902081028',107,'2022-09-02 08:10:28',5),
(2,'20220902081028',78,'2022-09-02 11:01:44',1),
(3,'20220902081028',42,'2022-09-02 14:18:33',1),
(4,'20220902081028',73,'2022-09-02 16:46:07',2),
(5,'20220903091341',86,'2022-09-03 09:13:41',3),
(6,'20220903091341',80,'2022-09-03 16:25:38',4),
(7,'20220904085624',15,'2022-09-04 08:56:24',5),
(8,'20220905101747',61,'2022-09-05 10:17:47',4),
(9,'20220905101747',42,'2022-09-05 11:08:51',4),
(10,'20220905101747',89,'2022-09-05 16:38:11',3),
(11,'20220906092712',68,'2022-09-06 09:27:12',5),
(12,'20220906092712',98,'2022-09-06 09:35:06',5),
(13,'20220906092712',48,'2022-09-06 09:40:47',5),
(14,'20220907093931',50,'2022-09-07 09:39:31',1),
(15,'20220907093931',43,'2022-09-07 10:26:14',5),
(16,'20220907093931',94,'2022-09-07 13:39:58',2),
(17,'20220907093931',91,'2022-09-07 15:58:46',4),
(18,'20220908082145',14,'2022-09-08 08:21:45',1),
(19,'20220908082145',17,'2022-09-08 10:28:59',4),
(20,'20220909092219',73,'2022-09-09 09:22:19',1),
(21,'20220909092219',80,'2022-09-09 10:36:48',2),
(22,'20220909092219',45,'2022-09-09 11:12:11',1),
(23,'20220910093446',28,'2022-09-10 09:34:46',1),
(24,'20220911110411',73,'2022-09-11 11:04:11',5),
(25,'20220911110411',47,'2022-09-11 14:21:31',1),
(26,'20220912081145',52,'2022-09-12 08:11:45',2),
(27,'20220912081145',27,'2022-09-12 09:02:51',1),
(28,'20220912081145',97,'2022-09-12 09:22:08',3),
(29,'20220912081145',24,'2022-09-12 15:43:06',4),
(30,'20220913081549',47,'2022-09-13 08:15:49',1),
(31,'20220914092546',17,'2022-09-14 09:25:46',2),
(32,'20220914092546',15,'2022-09-14 12:41:09',5),
(33,'20220914092546',102,'2022-09-14 12:41:59',5),
(34,'20220915081136',80,'2022-09-15 08:11:36',3),
(35,'20220915081136',38,'2022-09-15 10:15:59',1),
(36,'20220915081136',17,'2022-09-15 10:30:39',3),
(37,'20220915081136',16,'2022-09-15 12:48:36',4),
(38,'20220915081136',61,'2022-09-15 14:57:03',1),
(39,'20220915081136',99,'2022-09-15 15:53:18',4),
(40,'20220916080537',14,'2022-09-16 08:05:37',3),
(41,'20220916080537',93,'2022-09-16 11:30:07',4),
(42,'20220916080537',59,'2022-09-16 12:00:10',4),
(43,'20220916080537',42,'2022-09-16 12:41:01',5),
(44,'20220916080537',97,'2022-09-16 12:43:51',1),
(45,'20220916080537',35,'2022-09-16 16:17:52',3),
(46,'20220918103356',77,'2022-09-18 10:33:56',1),
(47,'20220918103356',97,'2022-09-18 12:35:08',1),
(48,'20220919105726',16,'2022-09-19 10:57:26',3),
(49,'20220919105726',51,'2022-09-19 11:31:45',5),
(50,'20220919105726',82,'2022-09-19 12:44:17',5),
(51,'20220919105726',40,'2022-09-19 14:49:09',5),
(52,'20220919105726',100,'2022-09-19 15:52:42',1),
(53,'20220920153633',103,'2022-09-20 15:36:33',1),
(54,'20220921095638',42,'2022-09-21 09:56:38',1),
(55,'20220921095638',60,'2022-09-21 10:19:21',1),
(56,'20220921095638',62,'2022-09-21 16:08:56',4),
(57,'20220922155604',11,'2022-09-22 15:56:04',5),
(58,'20220923092352',44,'2022-09-23 09:23:52',2),
(59,'20220923092352',105,'2022-09-23 12:34:21',4),
(60,'20220923092352',80,'2022-09-23 13:26:44',2),
(61,'20220923092352',42,'2022-09-23 15:56:26',2),
(62,'20220924092429',93,'2022-09-24 09:24:29',2),
(63,'20220924092429',38,'2022-09-24 09:58:33',2),
(64,'20220924092429',102,'2022-09-24 13:42:33',4),
(65,'20220925100217',61,'2022-09-25 10:02:17',3),
(66,'20220925100217',15,'2022-09-25 10:18:03',5),
(67,'20220925100217',46,'2022-09-25 10:21:42',1),
(68,'20220925100217',44,'2022-09-25 13:03:06',3),
(69,'20220926083546',77,'2022-09-26 08:35:46',4),
(70,'20220926083546',26,'2022-09-26 08:55:44',2),
(71,'20220926083546',40,'2022-09-26 09:19:08',4),
(72,'20220927115121',58,'2022-09-27 11:51:21',1),
(73,'20220927115121',78,'2022-09-27 12:31:17',2),
(74,'20220927115121',41,'2022-09-27 16:28:36',2),
(75,'20220928080404',27,'2022-09-28 08:04:04',5),
(76,'20220928080404',90,'2022-09-28 10:59:53',4),
(77,'20220928080404',45,'2022-09-28 13:11:46',3),
(78,'20220928080404',106,'2022-09-28 13:39:00',3),
(79,'20220928080404',74,'2022-09-28 15:53:28',3),
(80,'20220929105613',22,'2022-09-29 10:56:13',1),
(81,'20220929105613',45,'2022-09-29 16:31:29',2),
(82,'20220929105613',15,'2022-09-29 16:58:45',5),
(83,'20220930094807',79,'2022-09-30 09:48:07',1),
(84,'20220930094807',59,'2022-09-30 12:52:49',2),
(85,'20220930094807',20,'2022-09-30 14:47:44',2),
(86,'20220930094807',63,'2022-09-30 15:33:52',4),
(87,'20221001134721',90,'2022-10-01 13:47:21',5),
(88,'20221002095538',18,'2022-10-02 09:55:38',5),
(89,'20221002095538',75,'2022-10-02 11:53:15',4),
(90,'20221002095538',17,'2022-10-02 12:17:45',2),
(91,'20221002095538',19,'2022-10-02 15:09:49',1),
(92,'20221003105755',78,'2022-10-03 10:57:55',2),
(93,'20221003105755',35,'2022-10-03 14:33:17',4),
(94,'20221004080619',16,'2022-10-04 08:06:19',1),
(95,'20221004080619',94,'2022-10-04 09:52:48',5),
(96,'20221004080619',17,'2022-10-04 12:55:39',2),
(97,'20221004080619',15,'2022-10-04 14:33:52',5),
(98,'20221005080305',63,'2022-10-05 08:03:05',5),
(99,'20221005080305',81,'2022-10-05 14:32:57',3),
(100,'20221006093945',94,'2022-10-06 09:39:45',1),
(101,'20221006093945',45,'2022-10-06 10:13:15',2),
(102,'20221006093945',83,'2022-10-06 12:25:08',3),
(103,'20221007100219',27,'2022-10-07 10:02:19',3),
(104,'20221007100219',31,'2022-10-07 10:49:06',2),
(105,'20221007100219',90,'2022-10-07 15:14:12',1),
(106,'20221007100219',72,'2022-10-07 15:51:51',5),
(107,'20221007100219',83,'2022-10-07 16:36:51',3),
(108,'20221008154504',48,'2022-10-08 15:45:04',4),
(109,'20221008154504',45,'2022-10-08 16:21:38',5),
(110,'20221009101650',94,'2022-10-09 10:16:50',2),
(111,'20221010140111',93,'2022-10-10 14:01:11',2),
(112,'20221011081948',30,'2022-10-11 08:19:48',1),
(113,'20221011081948',67,'2022-10-11 10:41:25',1),
(114,'20221011081948',69,'2022-10-11 11:37:02',4),
(115,'20221011081948',63,'2022-10-11 11:43:40',2),
(116,'20221011081948',43,'2022-10-11 14:00:43',3),
(117,'20221011081948',102,'2022-10-11 16:34:19',5),
(118,'20221012104850',57,'2022-10-12 10:48:50',2),
(119,'20221012104850',102,'2022-10-12 11:13:02',2),
(120,'20221012104850',94,'2022-10-12 16:40:00',5),
(121,'20221013093549',67,'2022-10-13 09:35:49',4),
(122,'20221013093549',74,'2022-10-13 16:54:50',1),
(123,'20221014112444',12,'2022-10-14 11:24:44',1),
(124,'20221014112444',29,'2022-10-14 13:49:49',2),
(125,'20221014112444',74,'2022-10-14 13:51:05',2),
(126,'20221016101556',29,'2022-10-16 10:15:56',1),
(127,'20221016101556',64,'2022-10-16 14:21:44',5),
(128,'20221016101556',83,'2022-10-16 16:54:27',3),
(129,'20221017122555',48,'2022-10-17 12:25:55',4),
(130,'20221018144516',30,'2022-10-18 14:45:16',4),
(131,'20221020113719',53,'2022-10-20 11:37:19',4),
(132,'20221020113719',26,'2022-10-20 12:55:08',3),
(133,'20221020113719',94,'2022-10-20 13:57:50',3),
(134,'20221020113719',105,'2022-10-20 15:34:16',3),
(135,'20221020113719',39,'2022-10-20 16:41:03',4),
(136,'20221021115347',96,'2022-10-21 11:53:47',4),
(137,'20221021115347',26,'2022-10-21 15:43:33',1),
(138,'20221022113941',16,'2022-10-22 11:39:41',1),
(139,'20221022113941',38,'2022-10-22 14:56:31',5),
(140,'20221023084709',41,'2022-10-23 08:47:09',1),
(141,'20221023084709',14,'2022-10-23 08:49:53',4),
(142,'20221023084709',38,'2022-10-23 11:06:21',2),
(143,'20221023084709',58,'2022-10-23 15:27:45',5),
(144,'20221024131046',90,'2022-10-24 13:10:46',1),
(145,'20221024131046',56,'2022-10-24 14:40:29',2),
(146,'20221026091220',106,'2022-10-26 09:12:20',5),
(147,'20221026091220',68,'2022-10-26 15:11:50',5),
(148,'20221027111157',97,'2022-10-27 11:11:57',2),
(149,'20221027111157',50,'2022-10-27 12:11:39',1),
(150,'20221027111157',23,'2022-10-27 15:09:17',4),
(151,'20221027111157',29,'2022-10-27 15:51:50',3),
(152,'20221028141533',58,'2022-10-28 14:15:33',2),
(153,'20221029132027',78,'2022-10-29 13:20:27',4),
(154,'20221030103637',99,'2022-10-30 10:36:37',4),
(155,'20221030103637',40,'2022-10-30 11:18:32',4),
(156,'20221031104020',44,'2022-10-31 10:40:20',4),
(157,'20221031104020',63,'2022-10-31 13:09:15',3),
(158,'20221101153719',93,'2022-11-01 15:37:19',3),
(159,'20221102111635',17,'2022-11-02 11:16:35',2),
(160,'20221102111635',65,'2022-11-02 14:57:18',4),
(161,'20221103082018',103,'2022-11-03 08:20:18',2),
(162,'20221103082018',27,'2022-11-03 11:32:36',5),
(163,'20221104115909',98,'2022-11-04 11:59:09',4),
(164,'20221104115909',30,'2022-11-04 12:27:38',1),
(165,'20221105080227',34,'2022-11-05 08:02:27',3),
(166,'20221105080227',81,'2022-11-05 11:50:07',5),
(167,'20221105080227',92,'2022-11-05 14:27:58',2),
(168,'20221105080227',76,'2022-11-05 16:38:28',2),
(169,'20221106145123',66,'2022-11-06 14:51:23',4),
(170,'20221107081502',97,'2022-11-07 08:15:02',1),
(171,'20221107081502',91,'2022-11-07 09:19:09',2),
(172,'20221107081502',42,'2022-11-07 13:21:09',3),
(173,'20221107081502',76,'2022-11-07 14:09:44',1),
(174,'20221107081502',13,'2022-11-07 16:43:23',1),
(175,'20221108085357',25,'2022-11-08 08:53:57',3),
(176,'20221108085357',33,'2022-11-08 09:22:44',1),
(177,'20221109102344',70,'2022-11-09 10:23:44',4),
(178,'20221109102344',17,'2022-11-09 11:26:22',5),
(179,'20221109102344',11,'2022-11-09 13:03:32',4),
(180,'20221109102344',59,'2022-11-09 15:25:39',5),
(181,'20221110101127',105,'2022-11-10 10:11:27',1),
(182,'20221110101127',28,'2022-11-10 13:28:13',5),
(183,'20221110101127',56,'2022-11-10 15:28:56',5),
(184,'20221111090355',55,'2022-11-11 09:03:55',3),
(185,'20221111090355',102,'2022-11-11 13:30:58',4),
(186,'20221111090355',21,'2022-11-11 15:13:27',2),
(187,'20221111090355',84,'2022-11-11 16:17:52',4),
(188,'20221112093242',50,'2022-11-12 09:32:42',1),
(189,'20221113092817',28,'2022-11-13 09:28:17',3),
(190,'20221113092817',65,'2022-11-13 11:08:02',1),
(191,'20221114092513',65,'2022-11-14 09:25:13',2),
(192,'20221114092513',12,'2022-11-14 11:18:38',2),
(193,'20221114092513',81,'2022-11-14 11:45:39',4),
(194,'20221115143633',41,'2022-11-15 14:36:33',1),
(195,'20221115143633',25,'2022-11-15 14:48:25',3),
(196,'20221116092459',56,'2022-11-16 09:24:59',4),
(197,'20221117082845',54,'2022-11-17 08:28:45',5),
(198,'20221117082845',60,'2022-11-17 13:13:24',1),
(199,'20221117082845',71,'2022-11-17 13:37:33',4),
(200,'20221117082845',32,'2022-11-17 14:26:43',4),
(201,'20221118093805',11,'2022-11-18 09:38:05',1),
(202,'20221118093805',52,'2022-11-18 11:45:40',1),
(203,'20221118093805',74,'2022-11-18 12:51:46',2),
(204,'20221118093805',19,'2022-11-18 16:21:02',4),
(205,'20221119140200',78,'2022-11-19 14:02:00',3),
(206,'20221120123719',62,'2022-11-20 12:37:19',3),
(207,'20221121114007',15,'2022-11-21 11:40:07',5),
(208,'20221122084227',103,'2022-11-22 08:42:27',4),
(209,'20221122084227',30,'2022-11-22 09:13:04',4),
(210,'20221122084227',16,'2022-11-22 10:53:14',2),
(211,'20221123080527',18,'2022-11-23 08:05:27',1),
(212,'20221123080527',63,'2022-11-23 09:17:40',4),
(213,'20221123080527',54,'2022-11-23 12:06:53',3),
(214,'20221123080527',79,'2022-11-23 12:19:19',4),
(215,'20221124080423',92,'2022-11-24 08:04:23',5),
(216,'20221124080423',93,'2022-11-24 13:01:36',2),
(217,'20221124080423',87,'2022-11-24 16:10:34',2),
(218,'20221125134853',44,'2022-11-25 13:48:53',5),
(219,'20221125134853',73,'2022-11-25 16:48:57',3),
(220,'20221125134853',29,'2022-11-25 16:59:39',4),
(221,'20221126081608',97,'2022-11-26 08:16:08',4),
(222,'20221126081608',93,'2022-11-26 09:16:33',3),
(223,'20221126081608',70,'2022-11-26 10:15:17',1),
(224,'20221126081608',61,'2022-11-26 12:49:56',4),
(225,'20221126081608',35,'2022-11-26 15:20:38',2),
(226,'20221126081608',75,'2022-11-26 16:36:37',5),
(227,'20221127090845',98,'2022-11-27 09:08:45',3),
(228,'20221127090845',35,'2022-11-27 10:47:43',1),
(229,'20221128112837',101,'2022-11-28 11:28:37',3),
(230,'20221128112837',88,'2022-11-28 11:38:25',1),
(231,'20221128112837',42,'2022-11-28 14:36:30',5),
(232,'20221128112837',57,'2022-11-28 15:22:50',3),
(233,'20221128112837',109,'2022-11-28 16:04:40',4),
(234,'20221128112837',79,'2022-11-28 16:06:28',1),
(235,'20221128112837',65,'2022-11-28 16:49:44',1),
(236,'20221129082457',105,'2022-11-29 08:24:57',3),
(237,'20221129082457',18,'2022-11-29 16:58:58',4),
(238,'20221130135643',38,'2022-11-30 13:56:43',4),
(239,'20221201095932',19,'2022-12-01 09:59:32',2),
(240,'20221201095932',41,'2022-12-01 10:00:05',1),
(241,'20221201095932',54,'2022-12-01 11:21:24',4),
(242,'20221201095932',57,'2022-12-01 11:23:45',5),
(243,'20221202105037',23,'2022-12-02 10:50:37',4),
(244,'20221203121755',94,'2022-12-03 12:17:55',5),
(245,'20221203121755',85,'2022-12-03 12:39:12',4),
(246,'20221203121755',93,'2022-12-03 14:26:39',2),
(247,'20221204110626',34,'2022-12-04 11:06:26',5),
(248,'20221204110626',92,'2022-12-04 13:57:40',3),
(249,'20221205121237',103,'2022-12-05 12:12:37',3),
(250,'20221205121237',82,'2022-12-05 16:37:34',3),
(251,'20221206114818',105,'2022-12-06 11:48:18',5),
(252,'20221206114818',90,'2022-12-06 15:05:26',3),
(253,'20221207085637',76,'2022-12-07 08:56:37',5),
(254,'20221207085637',39,'2022-12-07 10:30:27',3),
(255,'20221207085637',15,'2022-12-07 12:32:40',1),
(256,'20221207085637',105,'2022-12-07 14:54:02',2),
(257,'20221208102938',32,'2022-12-08 10:29:38',3),
(258,'20221208102938',104,'2022-12-08 11:56:53',2),
(259,'20221209163708',38,'2022-12-09 16:37:08',4),
(260,'20221211093930',12,'2022-12-11 09:39:30',3),
(261,'20221211093930',44,'2022-12-11 09:51:03',4),
(262,'20221211093930',85,'2022-12-11 12:14:53',2),
(263,'20221212090437',29,'2022-12-12 09:04:37',3),
(264,'20221212090437',73,'2022-12-12 15:07:49',4),
(265,'20221213124544',25,'2022-12-13 12:45:44',3),
(266,'20221216091652',85,'2022-12-16 09:16:52',2),
(267,'20221216091652',70,'2022-12-16 10:20:25',1),
(268,'20221216091652',89,'2022-12-16 14:13:22',4),
(269,'20221217095904',89,'2022-12-17 09:59:04',2),
(270,'20221217095904',27,'2022-12-17 13:49:41',1),
(271,'20221218120730',51,'2022-12-18 12:07:30',1),
(272,'20221218120730',68,'2022-12-18 13:23:07',1),
(273,'20221219120810',34,'2022-12-19 12:08:10',4),
(274,'20221220091814',63,'2022-12-20 09:18:14',4),
(275,'20221220091814',30,'2022-12-20 11:13:57',5),
(276,'20221220091814',21,'2022-12-20 13:12:14',3),
(277,'20221220091814',100,'2022-12-20 13:55:25',2),
(278,'20221221082948',50,'2022-12-21 08:29:48',4),
(279,'20221221082948',68,'2022-12-21 08:48:08',2),
(280,'20221222160400',36,'2022-12-22 16:04:00',5),
(281,'20221222160400',62,'2022-12-22 16:39:03',1),
(282,'20221223095737',38,'2022-12-23 09:57:37',1),
(283,'20221223095737',108,'2022-12-23 13:28:04',3),
(284,'20221223095737',108,'2022-12-23 16:03:44',4),
(285,'20221224101939',41,'2022-12-24 10:19:39',1),
(286,'20221224101939',51,'2022-12-24 16:24:11',4),
(287,'20221225083835',96,'2022-12-25 08:38:35',3),
(288,'20221225083835',95,'2022-12-25 11:15:23',5),
(289,'20221225083835',70,'2022-12-25 12:15:46',1),
(290,'20221225083835',51,'2022-12-25 12:51:05',1),
(291,'20221225083835',45,'2022-12-25 15:43:54',5),
(292,'20221226084017',37,'2022-12-26 08:40:17',1),
(293,'20221226084017',22,'2022-12-26 12:49:48',1),
(294,'20221227152900',86,'2022-12-27 15:29:00',1),
(295,'20221228114228',68,'2022-12-28 11:42:28',3),
(296,'20221228114228',54,'2022-12-28 13:34:22',4),
(297,'20221228114228',37,'2022-12-28 14:42:18',4),
(298,'20221229085643',56,'2022-12-29 08:56:43',4),
(299,'20221229085643',73,'2022-12-29 10:31:49',1),
(300,'20221229085643',30,'2022-12-29 13:13:08',2),
(301,'20221230163731',74,'2022-12-30 16:37:31',3),
(302,'20221231103940',60,'2022-12-31 10:39:40',4),
(303,'20221231103940',53,'2022-12-31 11:57:11',5),
(304,'20230101102853',38,'2023-01-01 10:28:53',2),
(305,'20230101102853',90,'2023-01-01 11:40:06',1),
(306,'20230101102853',21,'2023-01-01 12:18:01',4),
(307,'20230101102853',72,'2023-01-01 14:10:55',4),
(308,'20230102080948',36,'2023-01-02 08:09:48',2),
(309,'20230102080948',32,'2023-01-02 10:27:46',5),
(310,'20230102080948',22,'2023-01-02 12:09:29',1),
(311,'20230103103555',74,'2023-01-03 10:35:55',4),
(312,'20230104084729',23,'2023-01-04 08:47:29',2),
(313,'20230104084729',94,'2023-01-04 10:04:02',3),
(314,'20230104084729',36,'2023-01-04 10:49:26',1),
(315,'20230104084729',31,'2023-01-04 12:40:36',1),
(316,'20230104084729',80,'2023-01-04 15:33:17',3),
(317,'20230104084729',71,'2023-01-04 16:23:51',5),
(318,'20230104084729',94,'2023-01-04 16:56:19',2),
(319,'20230105130740',61,'2023-01-05 13:07:40',1),
(320,'20230105130740',59,'2023-01-05 14:52:18',1),
(321,'20230106080232',77,'2023-01-06 08:02:32',3),
(322,'20230106080232',44,'2023-01-06 11:49:40',3),
(323,'20230107094704',83,'2023-01-07 09:47:04',1),
(324,'20230107094704',78,'2023-01-07 14:25:48',5),
(325,'20230108082225',37,'2023-01-08 08:22:25',3),
(326,'20230108082225',31,'2023-01-08 11:14:51',1),
(327,'20230108082225',37,'2023-01-08 13:56:49',3),
(328,'20230108082225',68,'2023-01-08 15:15:35',3),
(329,'20230109102730',99,'2023-01-09 10:27:30',1),
(330,'20230109102730',83,'2023-01-09 10:35:39',2),
(331,'20230110100054',96,'2023-01-10 10:00:54',4),
(332,'20230110100054',106,'2023-01-10 11:21:12',1),
(333,'20230110100054',54,'2023-01-10 13:12:30',4),
(334,'20230110100054',70,'2023-01-10 13:57:42',4),
(335,'20230111091748',47,'2023-01-11 09:17:48',5),
(336,'20230112093456',57,'2023-01-12 09:34:56',3),
(337,'20230112093456',16,'2023-01-12 10:55:44',5),
(338,'20230112093456',81,'2023-01-12 12:20:10',3),
(339,'20230112093456',95,'2023-01-12 12:28:53',5),
(340,'20230112093456',104,'2023-01-12 12:31:03',4),
(341,'20230113110653',88,'2023-01-13 11:06:53',2),
(342,'20230113110653',35,'2023-01-13 13:54:32',1),
(343,'20230114102800',49,'2023-01-14 10:28:00',1),
(344,'20230114102800',39,'2023-01-14 10:45:21',1),
(345,'20230115085946',17,'2023-01-15 08:59:46',1),
(346,'20230115085946',75,'2023-01-15 10:33:03',1),
(347,'20230116091324',55,'2023-01-16 09:13:24',4),
(348,'20230117095246',61,'2023-01-17 09:52:46',2),
(349,'20230117095246',64,'2023-01-17 09:53:54',4),
(350,'20230117095246',106,'2023-01-17 14:50:32',2),
(351,'20230117095246',64,'2023-01-17 15:17:31',1),
(352,'20230120103303',67,'2023-01-20 10:33:03',1),
(353,'20230120103303',97,'2023-01-20 15:31:56',2),
(354,'20230121085140',46,'2023-01-21 08:51:40',5),
(355,'20230121085140',92,'2023-01-21 15:32:40',3),
(356,'20230122085029',101,'2023-01-22 08:50:29',4),
(357,'20230122085029',102,'2023-01-22 09:46:57',1),
(358,'20230122085029',102,'2023-01-22 13:19:00',4),
(359,'20230124080430',50,'2023-01-24 08:04:30',1),
(360,'20230124080430',29,'2023-01-24 11:06:11',2),
(361,'20230125123428',89,'2023-01-25 12:34:28',3),
(362,'20230126084739',23,'2023-01-26 08:47:39',1),
(363,'20230126084739',97,'2023-01-26 12:18:07',4),
(364,'20230127115130',101,'2023-01-27 11:51:30',4),
(365,'20230127115130',93,'2023-01-27 12:24:59',4),
(366,'20230127115130',11,'2023-01-27 13:48:54',2),
(367,'20230127115130',12,'2023-01-27 15:02:31',5),
(368,'20230127115130',106,'2023-01-27 16:33:07',4),
(369,'20230128082400',82,'2023-01-28 08:24:00',2),
(370,'20230128082400',48,'2023-01-28 11:13:22',3),
(371,'20230128082400',73,'2023-01-28 13:00:38',4),
(372,'20230129154928',29,'2023-01-29 15:49:28',3),
(373,'20230131161140',12,'2023-01-31 16:11:40',5),
(374,'20230131161140',98,'2023-01-31 16:26:12',3),
(375,'20230201094338',70,'2023-02-01 09:43:38',2),
(376,'20230201094338',93,'2023-02-01 10:35:06',2),
(377,'20230201094338',74,'2023-02-01 12:56:31',1),
(378,'20230201094338',91,'2023-02-01 16:39:39',5),
(379,'20230202120247',107,'2023-02-02 12:02:47',2),
(380,'20230203082836',49,'2023-02-03 08:28:36',2),
(381,'20230203082836',31,'2023-02-03 10:36:34',3),
(382,'20230203082836',52,'2023-02-03 14:37:38',2),
(383,'20230203082836',18,'2023-02-03 16:11:49',5),
(384,'20230203082836',29,'2023-02-03 16:57:54',2),
(385,'20230204081831',20,'2023-02-04 08:18:31',5),
(386,'20230204081831',64,'2023-02-04 09:04:04',1),
(387,'20230204081831',12,'2023-02-04 15:09:13',2),
(388,'20230205080833',13,'2023-02-05 08:08:33',5),
(389,'20230205080833',105,'2023-02-05 11:33:21',1),
(390,'20230205080833',47,'2023-02-05 16:56:04',4),
(391,'20230206150923',59,'2023-02-06 15:09:23',5),
(392,'20230207142655',105,'2023-02-07 14:26:55',3),
(393,'20230207142655',49,'2023-02-07 14:29:19',4),
(394,'20230207142655',70,'2023-02-07 16:55:17',1),
(395,'20230208094200',78,'2023-02-08 09:42:00',1),
(396,'20230208094200',96,'2023-02-08 13:30:17',2),
(397,'20230208094200',13,'2023-02-08 14:32:45',3),
(398,'20230211093131',89,'2023-02-11 09:31:31',1),
(399,'20230211093131',51,'2023-02-11 10:56:52',1),
(400,'20230212140457',37,'2023-02-12 14:04:57',5),
(401,'20230212140457',96,'2023-02-12 14:25:31',1),
(402,'20230213083301',24,'2023-02-13 08:33:01',3),
(403,'20230213083301',97,'2023-02-13 09:09:02',3),
(404,'20230213083301',43,'2023-02-13 11:32:08',3),
(405,'20230215093002',64,'2023-02-15 09:30:02',4),
(406,'20230215093002',96,'2023-02-15 12:22:22',5),
(407,'20230216131850',14,'2023-02-16 13:18:50',3),
(408,'20230216131850',89,'2023-02-16 15:41:29',3),
(409,'20230217121250',60,'2023-02-17 12:12:50',4),
(410,'20230217121250',76,'2023-02-17 12:50:12',4),
(411,'20230217121250',19,'2023-02-17 15:26:10',1),
(412,'20230218091837',70,'2023-02-18 09:18:37',3),
(413,'20230218091837',63,'2023-02-18 10:32:07',2),
(414,'20230218091837',60,'2023-02-18 11:24:56',3),
(415,'20230218091837',24,'2023-02-18 15:52:24',3),
(416,'20230219110144',99,'2023-02-19 11:01:44',5),
(417,'20230219110144',23,'2023-02-19 12:12:30',1),
(418,'20230221115150',87,'2023-02-21 11:51:50',2),
(419,'20230221115150',62,'2023-02-21 13:04:17',4),
(420,'20230221115150',103,'2023-02-21 14:19:20',5),
(421,'20230221115150',69,'2023-02-21 14:24:53',1),
(422,'20230221115150',105,'2023-02-21 15:13:03',5),
(423,'20230222103047',13,'2023-02-22 10:30:47',2),
(424,'20230222103047',17,'2023-02-22 10:32:55',3),
(425,'20230223094246',38,'2023-02-23 09:42:46',3),
(426,'20230223094246',28,'2023-02-23 12:22:30',2),
(427,'20230223094246',39,'2023-02-23 15:00:05',4),
(428,'20230223094246',45,'2023-02-23 15:35:24',1),
(429,'20230225165417',40,'2023-02-25 16:54:17',4),
(430,'20230226091819',68,'2023-02-26 09:18:19',1),
(431,'20230226091819',92,'2023-02-26 13:48:58',5),
(432,'20230226091819',95,'2023-02-26 16:10:12',3),
(433,'20230227101742',66,'2023-02-27 10:17:42',1),
(434,'20230227101742',45,'2023-02-27 12:47:34',5),
(435,'20230227101742',105,'2023-02-27 15:34:51',3),
(436,'20230228153809',83,'2023-02-28 15:38:09',1),
(437,'20230301112636',24,'2023-03-01 11:26:36',4),
(438,'20230301112636',24,'2023-03-01 16:59:38',2),
(439,'20230303082405',19,'2023-03-03 08:24:05',2),
(440,'20230303082405',12,'2023-03-03 13:03:43',4),
(441,'20230303082405',62,'2023-03-03 13:14:14',2),
(442,'20230304085525',68,'2023-03-04 08:55:25',5),
(443,'20230304085525',37,'2023-03-04 13:19:13',1),
(444,'20230305135650',78,'2023-03-05 13:56:50',2),
(445,'20230305135650',90,'2023-03-05 15:14:01',3),
(446,'20230306113208',106,'2023-03-06 11:32:08',1),
(447,'20230306113208',62,'2023-03-06 16:58:31',4),
(448,'20230307110043',104,'2023-03-07 11:00:43',1),
(449,'20230307110043',18,'2023-03-07 11:20:42',3),
(450,'20230307110043',46,'2023-03-07 12:04:26',3),
(451,'20230307110043',37,'2023-03-07 12:43:06',5),
(452,'20230307110043',104,'2023-03-07 16:16:54',5),
(453,'20230308094818',78,'2023-03-08 09:48:18',3),
(454,'20230308094818',78,'2023-03-08 10:43:13',1),
(455,'20230308094818',79,'2023-03-08 11:00:19',3),
(456,'20230310112732',55,'2023-03-10 11:27:32',2),
(457,'20230310112732',19,'2023-03-10 11:43:44',5),
(458,'20230310112732',53,'2023-03-10 14:29:30',2),
(459,'20230311080909',101,'2023-03-11 08:09:09',5),
(460,'20230311080909',100,'2023-03-11 12:00:07',1),
(461,'20230312090442',24,'2023-03-12 09:04:42',1),
(462,'20230312090442',95,'2023-03-12 10:00:29',5),
(463,'20230312090442',65,'2023-03-12 10:06:56',2),
(464,'20230312090442',96,'2023-03-12 11:09:55',3),
(465,'20230312090442',21,'2023-03-12 14:55:49',3),
(466,'20230313111207',67,'2023-03-13 11:12:07',4),
(467,'20230313111207',54,'2023-03-13 11:49:41',5),
(468,'20230313111207',92,'2023-03-13 15:55:05',5),
(469,'20230314143737',68,'2023-03-14 14:37:37',3),
(470,'20230314143737',63,'2023-03-14 15:03:30',4),
(471,'20230314143737',18,'2023-03-14 15:28:30',5),
(472,'20230315091032',39,'2023-03-15 09:10:32',4),
(473,'20230315091032',30,'2023-03-15 09:16:45',5),
(474,'20230315091032',67,'2023-03-15 10:55:06',2),
(475,'20230315091032',51,'2023-03-15 16:24:01',1),
(476,'20230316122131',28,'2023-03-16 12:21:31',4),
(477,'20230316122131',86,'2023-03-16 15:55:59',3),
(478,'20230318090750',71,'2023-03-18 09:07:50',5),
(479,'20230318090750',59,'2023-03-18 11:40:41',3),
(480,'20230319085143',47,'2023-03-19 08:51:43',5),
(481,'20230319085143',24,'2023-03-19 12:41:47',3),
(482,'20230319085143',13,'2023-03-19 13:15:48',1),
(483,'20230319085143',16,'2023-03-19 16:03:05',5),
(484,'20230320090914',42,'2023-03-20 09:09:14',1),
(485,'20230320090914',51,'2023-03-20 09:46:18',4),
(486,'20230320090914',70,'2023-03-20 11:39:14',3),
(487,'20230320090914',63,'2023-03-20 12:30:47',2),
(488,'20230320090914',41,'2023-03-20 14:11:44',1),
(489,'20230321094839',65,'2023-03-21 09:48:39',5),
(490,'20230321094839',46,'2023-03-21 10:50:15',5),
(491,'20230321094839',56,'2023-03-21 10:54:11',5),
(492,'20230321094839',84,'2023-03-21 11:32:04',2),
(493,'20230322084916',104,'2023-03-22 08:49:16',5),
(494,'20230322084916',28,'2023-03-22 10:51:46',1),
(495,'20230322084916',56,'2023-03-22 14:14:10',3),
(496,'20230323084347',13,'2023-03-23 08:43:47',3),
(497,'20230323084347',59,'2023-03-23 12:29:25',2),
(498,'20230323084347',86,'2023-03-23 14:38:15',2),
(499,'20230323084347',49,'2023-03-23 15:53:58',5),
(500,'20230323084347',82,'2023-03-23 16:31:16',4),
(501,'20230324133653',100,'2023-03-24 13:36:53',5),
(502,'20230324133653',45,'2023-03-24 15:55:49',1),
(503,'20230324133653',50,'2023-03-24 16:10:55',2),
(504,'20230324133653',103,'2023-03-24 16:18:22',2),
(505,'20230325090519',61,'2023-03-25 09:05:19',1),
(506,'20230325090519',28,'2023-03-25 09:17:56',2),
(507,'20230325090519',48,'2023-03-25 10:08:43',2),
(508,'20230325090519',48,'2023-03-25 12:11:14',3),
(509,'20230325090519',47,'2023-03-25 14:13:44',1),
(510,'20230326095155',88,'2023-03-26 09:51:55',5),
(511,'20230326095155',51,'2023-03-26 09:55:44',1),
(512,'20230326095155',102,'2023-03-26 11:02:01',3),
(513,'20230326095155',23,'2023-03-26 12:48:10',5),
(514,'20230326095155',35,'2023-03-26 14:25:40',1),
(515,'20230326095155',15,'2023-03-26 14:38:41',4),
(516,'20230327094802',101,'2023-03-27 09:48:02',4),
(517,'20230327094802',48,'2023-03-27 10:35:35',3),
(518,'20230327094802',48,'2023-03-27 14:00:14',5),
(519,'20230327094802',18,'2023-03-27 16:48:57',2),
(520,'20230328084434',44,'2023-03-28 08:44:34',5),
(521,'20230328084434',69,'2023-03-28 10:39:03',4),
(522,'20230328084434',79,'2023-03-28 12:08:38',3),
(523,'20230328084434',54,'2023-03-28 16:18:19',4),
(524,'20230329162535',56,'2023-03-29 16:25:35',4),
(525,'20230330090712',66,'2023-03-30 09:07:12',1),
(526,'20230330090712',95,'2023-03-30 16:24:26',3),
(527,'20230331115304',35,'2023-03-31 11:53:04',2),
(528,'20230331115304',64,'2023-03-31 12:09:53',1),
(529,'20230401150704',90,'2023-04-01 15:07:04',1),
(530,'20230402082820',28,'2023-04-02 08:28:20',2),
(531,'20230402082820',47,'2023-04-02 09:05:23',5),
(532,'20230402082820',68,'2023-04-02 15:01:06',4),
(533,'20230402082820',93,'2023-04-02 16:56:37',4),
(534,'20230403110024',38,'2023-04-03 11:00:24',5),
(535,'20230403110024',55,'2023-04-03 14:19:53',1),
(536,'20230404090307',97,'2023-04-04 09:03:07',4),
(537,'20230404090307',88,'2023-04-04 10:42:30',1),
(538,'20230404090307',92,'2023-04-04 13:44:29',4),
(539,'20230405093058',50,'2023-04-05 09:30:58',3),
(540,'20230405093058',36,'2023-04-05 10:19:07',3),
(541,'20230405093058',46,'2023-04-05 11:57:47',4),
(542,'20230405093058',98,'2023-04-05 12:16:41',3),
(543,'20230406110600',38,'2023-04-06 11:06:00',1),
(544,'20230406110600',39,'2023-04-06 12:17:33',3),
(545,'20230406110600',82,'2023-04-06 12:39:46',4),
(546,'20230407105619',70,'2023-04-07 10:56:19',5),
(547,'20230407105619',21,'2023-04-07 12:22:35',1),
(548,'20230407105619',52,'2023-04-07 14:06:52',5),
(549,'20230407105619',67,'2023-04-07 16:18:08',4),
(550,'20230407105619',80,'2023-04-07 16:18:27',3),
(551,'20230407105619',38,'2023-04-07 16:29:16',1),
(552,'20230408124714',27,'2023-04-08 12:47:14',5),
(553,'20230409113133',29,'2023-04-09 11:31:33',1),
(554,'20230409113133',41,'2023-04-09 13:06:14',4),
(555,'20230409113133',36,'2023-04-09 14:43:20',3),
(556,'20230409113133',41,'2023-04-09 15:58:09',3),
(557,'20230410082807',65,'2023-04-10 08:28:07',4),
(558,'20230410082807',22,'2023-04-10 15:26:36',1),
(559,'20230410082807',28,'2023-04-10 16:55:00',1),
(560,'20230411083933',68,'2023-04-11 08:39:33',3),
(561,'20230411083933',108,'2023-04-11 13:24:58',5),
(562,'20230411083933',55,'2023-04-11 14:31:54',4),
(563,'20230411083933',12,'2023-04-11 15:21:56',5),
(564,'20230412164105',89,'2023-04-12 16:41:05',5),
(565,'20230413082152',57,'2023-04-13 08:21:52',2),
(566,'20230413082152',37,'2023-04-13 09:08:58',2),
(567,'20230413082152',72,'2023-04-13 11:34:14',1),
(568,'20230413082152',54,'2023-04-13 13:09:39',2),
(569,'20230413082152',69,'2023-04-13 13:31:17',1),
(570,'20230414084442',17,'2023-04-14 08:44:42',1),
(571,'20230414084442',33,'2023-04-14 11:28:40',3),
(572,'20230414084442',45,'2023-04-14 12:47:02',4),
(573,'20230414084442',15,'2023-04-14 13:55:08',4),
(574,'20230414084442',79,'2023-04-14 15:38:15',2),
(575,'20230414084442',87,'2023-04-14 15:54:00',5),
(576,'20230415104310',83,'2023-04-15 10:43:10',3),
(577,'20230415104310',29,'2023-04-15 11:24:57',3),
(578,'20230415104310',87,'2023-04-15 14:57:11',1),
(579,'20230415104310',13,'2023-04-15 16:19:44',2),
(580,'20230415104310',43,'2023-04-15 16:59:43',5),
(581,'20230416130721',29,'2023-04-16 13:07:21',2),
(582,'20230416130721',40,'2023-04-16 14:03:27',4),
(583,'20230417102936',83,'2023-04-17 10:29:36',2),
(584,'20230418121036',38,'2023-04-18 12:10:36',3),
(585,'20230418121036',47,'2023-04-18 16:29:03',5),
(586,'20230419122942',33,'2023-04-19 12:29:42',4),
(587,'20230419122942',77,'2023-04-19 15:52:07',1),
(588,'20230419122942',95,'2023-04-19 16:36:09',2),
(589,'20230420092126',37,'2023-04-20 09:21:26',3),
(590,'20230420092126',20,'2023-04-20 12:30:48',5),
(591,'20230421083926',52,'2023-04-21 08:39:26',5),
(592,'20230421083926',90,'2023-04-21 13:53:28',1),
(593,'20230422125427',104,'2023-04-22 12:54:27',2),
(594,'20230423080107',73,'2023-04-23 08:01:07',1),
(595,'20230423080107',73,'2023-04-23 08:49:20',2),
(596,'20230423080107',101,'2023-04-23 09:05:59',5),
(597,'20230423080107',45,'2023-04-23 12:28:08',2),
(598,'20230424091510',66,'2023-04-24 09:15:10',5),
(599,'20230424091510',68,'2023-04-24 12:19:28',1),
(600,'20230424091510',40,'2023-04-24 13:17:08',4),
(601,'20230424091510',98,'2023-04-24 14:46:49',4),
(602,'20230424091510',16,'2023-04-24 16:26:43',1),
(603,'20230425143519',78,'2023-04-25 14:35:19',3),
(604,'20230425143519',96,'2023-04-25 16:16:32',4),
(605,'20230426091737',79,'2023-04-26 09:17:37',3),
(606,'20230426091737',44,'2023-04-26 10:48:18',5),
(607,'20230426091737',28,'2023-04-26 14:36:09',3),
(608,'20230427101411',76,'2023-04-27 10:14:11',2),
(609,'20230427101411',61,'2023-04-27 13:52:48',1),
(610,'20230427101411',100,'2023-04-27 16:12:46',1),
(611,'20230428084649',53,'2023-04-28 08:46:49',4),
(612,'20230428084649',80,'2023-04-28 16:34:42',4),
(613,'20230429161938',21,'2023-04-29 16:19:38',5),
(614,'20230430090559',67,'2023-04-30 09:05:59',4),
(615,'20230430090559',49,'2023-04-30 12:17:57',3),
(616,'20230430090559',93,'2023-04-30 15:01:41',4),
(617,'20230430090559',44,'2023-04-30 15:18:29',1),
(618,'20230430090559',31,'2023-04-30 16:18:00',3),
(619,'20230501145515',75,'2023-05-01 14:55:15',2),
(620,'20230501145515',100,'2023-05-01 14:57:05',4),
(621,'20230501145515',83,'2023-05-01 14:59:32',2),
(622,'20230502162642',93,'2023-05-02 16:26:42',1),
(623,'20230503094044',77,'2023-05-03 09:40:44',4),
(624,'20230503094044',72,'2023-05-03 15:48:03',1),
(625,'20230504140551',85,'2023-05-04 14:05:51',2),
(626,'20230504140551',100,'2023-05-04 14:11:42',1),
(627,'20230504140551',70,'2023-05-04 15:55:41',2),
(628,'20230504140551',99,'2023-05-04 16:47:24',5),
(629,'20230505081757',50,'2023-05-05 08:17:57',1),
(630,'20230505081757',99,'2023-05-05 14:51:01',3),
(631,'20230507083734',86,'2023-05-07 08:37:34',5),
(632,'20230507083734',52,'2023-05-07 16:55:23',1),
(633,'20230508081239',42,'2023-05-08 08:12:39',3),
(634,'20230508081239',68,'2023-05-08 14:56:38',3),
(635,'20230508081239',20,'2023-05-08 16:21:57',3),
(636,'20230510140617',64,'2023-05-10 14:06:17',3),
(637,'20230510140617',31,'2023-05-10 16:09:27',5),
(638,'20230511102613',39,'2023-05-11 10:26:13',2),
(639,'20230511102613',28,'2023-05-11 16:38:42',2),
(640,'20230512080653',97,'2023-05-12 08:06:53',3),
(641,'20230512080653',19,'2023-05-12 10:09:06',3),
(642,'20230512080653',79,'2023-05-12 10:15:36',5),
(643,'20230512080653',49,'2023-05-12 13:06:07',5),
(644,'20230512080653',35,'2023-05-12 13:19:57',4),
(645,'20230512080653',19,'2023-05-12 14:43:50',4),
(646,'20230512080653',85,'2023-05-12 15:01:09',2),
(647,'20230513115948',99,'2023-05-13 11:59:48',1),
(648,'20230513115948',100,'2023-05-13 16:08:35',3),
(649,'20230514164300',101,'2023-05-14 16:43:00',1),
(650,'20230515095721',80,'2023-05-15 09:57:21',1),
(651,'20230515095721',91,'2023-05-15 11:49:18',2),
(652,'20230515095721',95,'2023-05-15 14:05:24',2),
(653,'20230517094409',24,'2023-05-17 09:44:09',2),
(654,'20230517094409',43,'2023-05-17 12:12:07',3),
(655,'20230517094409',36,'2023-05-17 12:32:39',4),
(656,'20230517094409',57,'2023-05-17 14:19:14',2),
(657,'20230518150804',83,'2023-05-18 15:08:04',4),
(658,'20230519165526',41,'2023-05-19 16:55:26',5),
(659,'20230520151216',86,'2023-05-20 15:12:16',4),
(660,'20230521080645',11,'2023-05-21 08:06:45',5),
(661,'20230521080645',105,'2023-05-21 08:17:26',1),
(662,'20230521080645',56,'2023-05-21 08:44:11',4),
(663,'20230521080645',25,'2023-05-21 08:46:39',4),
(664,'20230521080645',36,'2023-05-21 11:26:19',1),
(665,'20230522085836',36,'2023-05-22 08:58:36',3),
(666,'20230522085836',95,'2023-05-22 09:35:47',2),
(667,'20230523112156',89,'2023-05-23 11:21:56',5),
(668,'20230524121423',69,'2023-05-24 12:14:23',4),
(669,'20230524121423',81,'2023-05-24 12:41:06',4),
(670,'20230525104235',58,'2023-05-25 10:42:35',5),
(671,'20230526090132',102,'2023-05-26 09:01:32',5),
(672,'20230526090132',45,'2023-05-26 13:20:57',4),
(673,'20230526090132',33,'2023-05-26 13:45:12',1),
(674,'20230527092304',87,'2023-05-27 09:23:04',4),
(675,'20230527092304',106,'2023-05-27 10:32:29',2),
(676,'20230527092304',50,'2023-05-27 11:17:09',5),
(677,'20230528152203',36,'2023-05-28 15:22:03',3),
(678,'20230529085914',14,'2023-05-29 08:59:14',4),
(679,'20230529085914',99,'2023-05-29 13:13:46',5),
(680,'20230529085914',91,'2023-05-29 14:48:21',1),
(681,'20230530141015',28,'2023-05-30 14:10:15',3),
(682,'20230530141015',97,'2023-05-30 15:50:02',4),
(683,'20230531090427',109,'2023-05-31 09:04:27',1),
(684,'20230531090427',26,'2023-05-31 11:57:58',1),
(685,'20230601135524',94,'2023-06-01 13:55:24',4),
(686,'20230602165607',92,'2023-06-02 16:56:07',5),
(687,'20230603080928',90,'2023-06-03 08:09:28',5),
(688,'20230603080928',72,'2023-06-03 09:41:59',1),
(689,'20230603080928',40,'2023-06-03 09:48:24',1),
(690,'20230603080928',101,'2023-06-03 13:06:19',1),
(691,'20230603080928',30,'2023-06-03 13:34:45',2),
(692,'20230603080928',71,'2023-06-03 16:18:51',5),
(693,'20230603080928',40,'2023-06-03 16:50:50',5),
(694,'20230604121603',101,'2023-06-04 12:16:03',3),
(695,'20230606153442',105,'2023-06-06 15:34:42',3),
(696,'20230607082024',100,'2023-06-07 08:20:24',2),
(697,'20230608082747',17,'2023-06-08 08:27:47',5),
(698,'20230609124014',74,'2023-06-09 12:40:14',4),
(699,'20230610142847',84,'2023-06-10 14:28:47',1),
(700,'20230610142847',83,'2023-06-10 16:27:46',1),
(701,'20230610142847',77,'2023-06-10 16:29:59',5),
(702,'20230611105402',91,'2023-06-11 10:54:02',1),
(703,'20230611105402',96,'2023-06-11 12:58:45',3),
(704,'20230611105402',53,'2023-06-11 13:42:16',5),
(705,'20230612092140',52,'2023-06-12 09:21:40',4),
(706,'20230612092140',74,'2023-06-12 10:41:31',5),
(707,'20230612092140',43,'2023-06-12 11:14:53',1),
(708,'20230612092140',69,'2023-06-12 12:22:37',5),
(709,'20230612092140',16,'2023-06-12 12:34:20',3),
(710,'20230612092140',99,'2023-06-12 14:55:37',3),
(711,'20230612092140',67,'2023-06-12 16:36:32',3),
(712,'20230613111256',11,'2023-06-13 11:12:56',5),
(713,'20230613111256',26,'2023-06-13 13:42:54',1),
(714,'20230614115905',56,'2023-06-14 11:59:05',5),
(715,'20230614115905',30,'2023-06-14 13:58:38',5),
(716,'20230614115905',11,'2023-06-14 14:29:33',3),
(717,'20230614115905',70,'2023-06-14 15:27:36',1),
(718,'20230615110452',42,'2023-06-15 11:04:52',3),
(719,'20230615110452',74,'2023-06-15 16:36:00',3),
(720,'20230616144919',96,'2023-06-16 14:49:19',3),
(721,'20230616144919',22,'2023-06-16 15:27:57',2),
(722,'20230617091037',29,'2023-06-17 09:10:37',1),
(723,'20230617091037',48,'2023-06-17 12:02:39',5),
(724,'20230617091037',94,'2023-06-17 16:09:34',4),
(725,'20230619081635',64,'2023-06-19 08:16:35',1),
(726,'20230619081635',91,'2023-06-19 12:33:52',2),
(727,'20230619081635',20,'2023-06-19 13:33:12',4),
(728,'20230619081635',83,'2023-06-19 14:52:32',1),
(729,'20230619081635',55,'2023-06-19 16:21:44',2),
(730,'20230620154928',97,'2023-06-20 15:49:28',2),
(731,'20230620154928',33,'2023-06-20 15:49:50',5),
(732,'20230621081800',13,'2023-06-21 08:18:00',1),
(733,'20230621081800',70,'2023-06-21 12:17:12',3),
(734,'20230622085539',19,'2023-06-22 08:55:39',4),
(735,'20230622085539',35,'2023-06-22 09:13:29',5),
(736,'20230622085539',65,'2023-06-22 10:57:42',1),
(737,'20230622085539',11,'2023-06-22 12:11:07',3),
(738,'20230623165149',32,'2023-06-23 16:51:49',3),
(739,'20230624090512',51,'2023-06-24 09:05:12',3),
(740,'20230624090512',48,'2023-06-24 13:49:58',4),
(741,'20230624090512',55,'2023-06-24 14:22:05',3),
(742,'20230625101421',33,'2023-06-25 10:14:21',1),
(743,'20230626101455',55,'2023-06-26 10:14:55',2),
(744,'20230626101455',82,'2023-06-26 14:40:55',5),
(745,'20230626101455',26,'2023-06-26 15:48:14',5),
(746,'20230627142906',11,'2023-06-27 14:29:06',2),
(747,'20230627142906',54,'2023-06-27 16:01:23',3),
(748,'20230629100705',55,'2023-06-29 10:07:05',5),
(749,'20230629100705',103,'2023-06-29 12:15:45',2),
(750,'20230630114627',33,'2023-06-30 11:46:27',2),
(751,'20230701085510',57,'2023-07-01 08:55:10',3),
(752,'20230701085510',104,'2023-07-01 12:46:16',4),
(753,'20230703084052',15,'2023-07-03 08:40:52',2),
(754,'20230703084052',67,'2023-07-03 10:17:26',3),
(755,'20230703084052',104,'2023-07-03 11:56:11',3),
(756,'20230704101119',61,'2023-07-04 10:11:19',4),
(757,'20230704101119',59,'2023-07-04 12:16:18',5),
(758,'20230704101119',46,'2023-07-04 12:38:54',3),
(759,'20230704101119',50,'2023-07-04 13:28:28',5),
(760,'20230705104825',63,'2023-07-05 10:48:25',4),
(761,'20230705104825',26,'2023-07-05 14:10:28',1),
(762,'20230705104825',75,'2023-07-05 15:58:17',5),
(763,'20230706150307',104,'2023-07-06 15:03:07',3),
(764,'20230707142729',17,'2023-07-07 14:27:29',4),
(765,'20230707142729',72,'2023-07-07 15:26:50',4),
(766,'20230708090056',91,'2023-07-08 09:00:56',5),
(767,'20230708090056',14,'2023-07-08 14:50:33',2),
(768,'20230709133020',27,'2023-07-09 13:30:20',4),
(769,'20230709133020',49,'2023-07-09 15:11:24',2),
(770,'20230710085712',18,'2023-07-10 08:57:12',1),
(771,'20230710085712',24,'2023-07-10 14:00:39',2),
(772,'20230711090132',14,'2023-07-11 09:01:32',4),
(773,'20230711090132',97,'2023-07-11 09:53:05',5),
(774,'20230711090132',47,'2023-07-11 11:58:59',2),
(775,'20230712100440',59,'2023-07-12 10:04:40',3),
(776,'20230712100440',32,'2023-07-12 11:53:30',2),
(777,'20230713111653',19,'2023-07-13 11:16:53',5),
(778,'20230714111007',34,'2023-07-14 11:10:07',4),
(779,'20230714111007',47,'2023-07-14 11:36:29',1),
(780,'20230714111007',95,'2023-07-14 12:13:15',3),
(781,'20230715095745',21,'2023-07-15 09:57:45',1),
(782,'20230715095745',24,'2023-07-15 12:01:33',2),
(783,'20230715095745',60,'2023-07-15 16:33:35',4),
(784,'20230716092852',33,'2023-07-16 09:28:52',5),
(785,'20230716092852',18,'2023-07-16 12:48:53',4),
(786,'20230716092852',26,'2023-07-16 13:39:03',2),
(787,'20230716092852',105,'2023-07-16 14:19:40',4),
(788,'20230717095235',67,'2023-07-17 09:52:35',1),
(789,'20230717095235',38,'2023-07-17 12:05:28',1),
(790,'20230718095332',81,'2023-07-18 09:53:32',2),
(791,'20230718095332',61,'2023-07-18 12:56:43',2),
(792,'20230718095332',102,'2023-07-18 14:05:36',2),
(793,'20230718095332',79,'2023-07-18 15:27:06',5),
(794,'20230719085240',85,'2023-07-19 08:52:40',3),
(795,'20230720083913',86,'2023-07-20 08:39:13',3),
(796,'20230720083913',108,'2023-07-20 10:17:29',3),
(797,'20230720083913',29,'2023-07-20 10:39:05',1),
(798,'20230722165308',32,'2023-07-22 16:53:08',3),
(799,'20230723110619',84,'2023-07-23 11:06:19',3),
(800,'20230723110619',65,'2023-07-23 12:39:37',1),
(801,'20230724095022',88,'2023-07-24 09:50:22',3),
(802,'20230724095022',109,'2023-07-24 14:52:45',1),
(803,'20230724095022',31,'2023-07-24 16:21:07',5),
(804,'20230725103649',94,'2023-07-25 10:36:49',2),
(805,'20230725103649',94,'2023-07-25 13:46:18',1),
(806,'20230726101959',69,'2023-07-26 10:19:59',1),
(807,'20230726101959',72,'2023-07-26 12:55:41',3),
(808,'20230727122620',85,'2023-07-27 12:26:20',4),
(809,'20230728091306',33,'2023-07-28 09:13:06',5),
(810,'20230728091306',50,'2023-07-28 11:08:02',5),
(811,'20230728091306',101,'2023-07-28 14:15:05',3),
(812,'20230729101655',53,'2023-07-29 10:16:55',2),
(813,'20230729101655',94,'2023-07-29 13:31:36',3),
(814,'20230730155039',57,'2023-07-30 15:50:39',4),
(815,'20230731145746',104,'2023-07-31 14:57:46',2),
(816,'20230801092906',17,'2023-08-01 09:29:06',2),
(817,'20230801092906',67,'2023-08-01 13:16:48',4),
(818,'20230801092906',93,'2023-08-01 14:47:52',3),
(819,'20230801092906',103,'2023-08-01 16:26:19',4),
(820,'20230802084728',53,'2023-08-02 08:47:28',2),
(821,'20230802084728',38,'2023-08-02 14:56:10',1),
(822,'20230803082351',97,'2023-08-03 08:23:51',4),
(823,'20230803082351',27,'2023-08-03 09:01:38',4),
(824,'20230803082351',99,'2023-08-03 09:46:50',2),
(825,'20230803082351',96,'2023-08-03 10:05:37',3),
(826,'20230803082351',47,'2023-08-03 13:07:40',5),
(827,'20230803082351',66,'2023-08-03 13:17:36',5),
(828,'20230803082351',49,'2023-08-03 16:21:57',2),
(829,'20230804081504',105,'2023-08-04 08:15:04',5),
(830,'20230804081504',43,'2023-08-04 08:36:01',3),
(831,'20230804081504',30,'2023-08-04 11:00:58',4),
(832,'20230804081504',16,'2023-08-04 11:25:39',3),
(833,'20230804081504',67,'2023-08-04 16:15:53',3),
(834,'20230805083423',84,'2023-08-05 08:34:23',5),
(835,'20230805083423',16,'2023-08-05 09:38:02',5),
(836,'20230805083423',32,'2023-08-05 11:37:44',4),
(837,'20230805083423',84,'2023-08-05 13:05:26',2),
(838,'20230806103330',103,'2023-08-06 10:33:30',5),
(839,'20230806103330',13,'2023-08-06 12:45:17',2),
(840,'20230807154957',27,'2023-08-07 15:49:57',1),
(841,'20230807154957',31,'2023-08-07 16:36:59',4),
(842,'20230807154957',37,'2023-08-07 16:47:10',1),
(843,'20230808113204',39,'2023-08-08 11:32:04',4),
(844,'20230810083928',17,'2023-08-10 08:39:28',4),
(845,'20230810083928',62,'2023-08-10 10:54:55',1),
(846,'20230810083928',65,'2023-08-10 16:46:54',4),
(847,'20230811085146',70,'2023-08-11 08:51:46',5),
(848,'20230811085146',45,'2023-08-11 09:27:36',5),
(849,'20230811085146',42,'2023-08-11 10:18:59',5),
(850,'20230811085146',35,'2023-08-11 10:49:06',5),
(851,'20230811085146',65,'2023-08-11 15:31:24',2),
(852,'20230812092037',81,'2023-08-12 09:20:37',2),
(853,'20230812092037',68,'2023-08-12 15:37:10',4),
(854,'20230813084348',81,'2023-08-13 08:43:48',1),
(855,'20230813084348',49,'2023-08-13 09:32:04',1),
(856,'20230813084348',27,'2023-08-13 10:16:10',4),
(857,'20230814105019',54,'2023-08-14 10:50:19',1),
(858,'20230814105019',51,'2023-08-14 11:48:57',4),
(859,'20230814105019',59,'2023-08-14 12:09:15',1),
(860,'20230814105019',40,'2023-08-14 12:16:16',4),
(861,'20230814105019',109,'2023-08-14 12:53:02',1),
(862,'20230814105019',101,'2023-08-14 13:11:53',5),
(863,'20230814105019',83,'2023-08-14 13:20:15',5),
(864,'20230814105019',14,'2023-08-14 14:45:11',2),
(865,'20230815135815',26,'2023-08-15 13:58:15',2),
(866,'20230816141832',99,'2023-08-16 14:18:32',1),
(867,'20230816141832',34,'2023-08-16 14:54:52',5),
(868,'20230816141832',35,'2023-08-16 16:13:01',2),
(869,'20230817090340',57,'2023-08-17 09:03:40',1),
(870,'20230817090340',92,'2023-08-17 09:31:17',3),
(871,'20230817090340',19,'2023-08-17 15:59:11',3),
(872,'20230817090340',19,'2023-08-17 16:25:02',1),
(873,'20230817090340',47,'2023-08-17 16:57:12',3),
(874,'20230818085320',88,'2023-08-18 08:53:20',4),
(875,'20230818085320',109,'2023-08-18 11:23:07',5),
(876,'20230818085320',70,'2023-08-18 13:34:16',5),
(877,'20230819084942',59,'2023-08-19 08:49:42',4),
(878,'20230820121227',23,'2023-08-20 12:12:27',3),
(879,'20230820121227',21,'2023-08-20 15:34:36',3),
(880,'20230821082602',72,'2023-08-21 08:26:02',5),
(881,'20230821082602',37,'2023-08-21 09:40:56',5),
(882,'20230821082602',90,'2023-08-21 11:59:16',4),
(883,'20230821082602',41,'2023-08-21 13:06:17',2),
(884,'20230821082602',92,'2023-08-21 16:13:52',3),
(885,'20230822132342',23,'2023-08-22 13:23:42',1),
(886,'20230823113617',35,'2023-08-23 11:36:17',2),
(887,'20230824080755',15,'2023-08-24 08:07:55',4),
(888,'20230824080755',94,'2023-08-24 09:25:09',4),
(889,'20230825134330',85,'2023-08-25 13:43:30',3),
(890,'20230826104905',23,'2023-08-26 10:49:05',4),
(891,'20230826104905',93,'2023-08-26 12:21:48',1),
(892,'20230827121117',91,'2023-08-27 12:11:17',2),
(893,'20230827121117',12,'2023-08-27 13:04:22',2),
(894,'20230828140218',107,'2023-08-28 14:02:18',4),
(895,'20230828140218',68,'2023-08-28 15:54:41',1),
(896,'20230828140218',89,'2023-08-28 16:38:03',4),
(897,'20230829112926',107,'2023-08-29 11:29:26',3),
(898,'20230829112926',104,'2023-08-29 11:39:03',5),
(899,'20230829112926',63,'2023-08-29 15:04:56',4),
(900,'20230830085705',63,'2023-08-30 08:57:05',5),
(901,'20230830085705',84,'2023-08-30 12:09:56',2),
(902,'20230830085705',106,'2023-08-30 12:33:43',4),
(903,'20230830085705',67,'2023-08-30 12:40:01',5),
(904,'20230830085705',32,'2023-08-30 14:12:46',2),
(905,'20230831092715',43,'2023-08-31 09:27:15',5),
(906,'20230831092715',16,'2023-08-31 11:49:51',2),
(907,'20230831092715',32,'2023-08-31 13:17:14',5),
(908,'20230831092715',67,'2023-08-31 15:14:01',1),
(909,'20230831092715',71,'2023-08-31 16:22:47',5),
(910,'20230901124414',83,'2023-09-01 12:44:14',5),
(911,'20230901124414',95,'2023-09-01 13:47:31',4),
(912,'20230901124414',17,'2023-09-01 15:09:52',2),
(913,'20230902083100',35,'2023-09-02 08:31:00',1),
(914,'20230902083100',51,'2023-09-02 09:45:15',5),
(915,'20230902083100',77,'2023-09-02 15:09:31',2),
(916,'20230903093633',47,'2023-09-03 09:36:33',3),
(917,'20230903093633',38,'2023-09-03 10:09:59',1),
(918,'20230903093633',40,'2023-09-03 13:14:54',1),
(919,'20230904093315',71,'2023-09-04 09:33:15',2),
(920,'20230904093315',72,'2023-09-04 09:38:43',2),
(921,'20230904093315',51,'2023-09-04 09:59:33',4),
(922,'20230904093315',77,'2023-09-04 14:06:51',4),
(923,'20230905094958',20,'2023-09-05 09:49:58',1),
(924,'20230905094958',89,'2023-09-05 13:11:06',2),
(925,'20230905094958',55,'2023-09-05 14:41:21',4),
(926,'20230905094958',45,'2023-09-05 16:00:44',3),
(927,'20230906083348',84,'2023-09-06 08:33:48',5),
(928,'20230906083348',15,'2023-09-06 10:46:51',2),
(929,'20230906083348',60,'2023-09-06 15:35:57',1),
(930,'20230907131653',109,'2023-09-07 13:16:53',3),
(931,'20230907131653',104,'2023-09-07 13:23:34',2),
(932,'20230908114334',98,'2023-09-08 11:43:34',1),
(933,'20230908114334',103,'2023-09-08 12:49:06',1),
(934,'20230908114334',71,'2023-09-08 15:04:07',1),
(935,'20230909085407',12,'2023-09-09 08:54:07',1),
(936,'20230909085407',11,'2023-09-09 12:11:47',1),
(937,'20230909085407',103,'2023-09-09 14:07:28',1),
(938,'20230910121439',69,'2023-09-10 12:14:39',5),
(939,'20230910121439',90,'2023-09-10 13:31:12',1),
(940,'20230912100021',102,'2023-09-12 10:00:21',2),
(941,'20230912100021',18,'2023-09-12 10:15:00',5),
(942,'20230912100021',35,'2023-09-12 11:02:20',5),
(943,'20230912100021',36,'2023-09-12 13:58:12',1),
(944,'20230912100021',31,'2023-09-12 16:15:48',3),
(945,'20230912100021',69,'2023-09-12 16:58:28',5),
(946,'20230913150043',24,'2023-09-13 15:00:43',1),
(947,'20230913150043',29,'2023-09-13 15:53:03',4),
(948,'20230914095933',77,'2023-09-14 09:59:33',5),
(949,'20230914095933',63,'2023-09-14 13:09:22',2),
(950,'20230914095933',72,'2023-09-14 14:34:44',3),
(951,'20230915083445',27,'2023-09-15 08:34:45',2),
(952,'20230915083445',33,'2023-09-15 12:42:55',5),
(953,'20230915083445',51,'2023-09-15 12:56:36',4),
(954,'20230916100600',77,'2023-09-16 10:06:00',3),
(955,'20230916100600',93,'2023-09-16 10:57:09',3),
(956,'20230916100600',87,'2023-09-16 11:19:13',1),
(957,'20230916100600',68,'2023-09-16 12:19:54',3),
(958,'20230916100600',88,'2023-09-16 14:40:49',2),
(959,'20230917155306',95,'2023-09-17 15:53:06',4),
(960,'20230917155306',81,'2023-09-17 16:29:10',4),
(961,'20230918081052',21,'2023-09-18 08:10:52',5),
(962,'20230918081052',88,'2023-09-18 14:09:59',3),
(963,'20230918081052',27,'2023-09-18 14:59:19',3),
(964,'20230918081052',92,'2023-09-18 16:07:29',4),
(965,'20230919130759',106,'2023-09-19 13:07:59',4),
(966,'20230920123759',71,'2023-09-20 12:37:59',4),
(967,'20230920123759',17,'2023-09-20 12:55:52',5),
(968,'20230920123759',102,'2023-09-20 15:43:03',1),
(969,'20230921091036',79,'2023-09-21 09:10:36',2),
(970,'20230921091036',78,'2023-09-21 15:36:13',2),
(971,'20230922111119',38,'2023-09-22 11:11:19',2),
(972,'20230922111119',23,'2023-09-22 12:56:12',3),
(973,'20230922111119',59,'2023-09-22 13:00:18',2),
(974,'20230922111119',77,'2023-09-22 14:44:47',5),
(975,'20230923115601',28,'2023-09-23 11:56:01',1),
(976,'20230923115601',57,'2023-09-23 14:23:02',4),
(977,'20230923115601',15,'2023-09-23 15:05:21',3),
(978,'20230924114050',105,'2023-09-24 11:40:50',2),
(979,'20230924114050',99,'2023-09-24 14:46:53',4),
(980,'20230925102003',54,'2023-09-25 10:20:03',3),
(981,'20230925102003',24,'2023-09-25 15:04:18',2),
(982,'20230926085404',27,'2023-09-26 08:54:04',3),
(983,'20230926085404',74,'2023-09-26 11:09:43',1),
(984,'20230926085404',109,'2023-09-26 16:10:43',4),
(985,'20230927122133',24,'2023-09-27 12:21:33',5),
(986,'20230927122133',42,'2023-09-27 12:54:32',4),
(987,'20230927122133',92,'2023-09-27 13:38:56',2),
(988,'20230927122133',76,'2023-09-27 15:25:38',2),
(989,'20230928103729',79,'2023-09-28 10:37:29',1),
(990,'20230928103729',12,'2023-09-28 13:26:50',3),
(991,'20230928103729',51,'2023-09-28 15:30:22',2),
(992,'20230929090346',55,'2023-09-29 09:03:46',4),
(993,'20230930120601',79,'2023-09-30 12:06:01',3),
(994,'20230930120601',42,'2023-09-30 12:29:44',4),
(995,'20230930120601',56,'2023-09-30 13:30:22',1),
(996,'20231001081816',59,'2023-10-01 08:18:16',4),
(997,'20231001081816',109,'2023-10-01 09:18:49',5),
(998,'20231001081816',41,'2023-10-01 10:03:10',3),
(999,'20231001081816',13,'2023-10-01 11:46:25',3),
(1000,'20231001081816',91,'2023-10-01 11:58:40',3);


-- Завдання 4.1: Показати список всіх співробітників та наявної інформації про них 
-- Вивести всі атрибути (поля) працівника.
USE company;
SELECT
*
FROM 
employee;

-- Завдання 4.2: Показати список всіх співробітників та наявної інформації про них.
-- Деталі: Вивести ідентифікаційний номер, назву користувача, імя, прізвище працівника та займану ним посаду. 
SELECT 
employee_id,
first_name, 
last_name, 
position
FROM 
employee;

-- Завдання 4.3: Показати список перших семи співробітників та наявної інформації про них.
-- Деталі: Вивести ідентифікаційний номер, назву користувача, імя, прізвище працівника та займану ним посаду. 
SELECT 
employee_id,
first_name,
last_name, 
position
FROM 
employee
LIMIT 7;

-- Завдання 4.4: Показати список уніальних посад.
-- Деталі: Вивести перелік унікальних значень для поля посада (position).
SELECT DISTINCT
position
FROM 
employee;


-- Завдання 4.5: Показати список уніальних посад відсортувавши їх.
-- Деталі: Вивести перелік унікальних значень для поля посада (position) відсортованих в алфавітному та зворотньому порядку.
SELECT DISTINCT
position
FROM 
employee
ORDER By
position ASC;

SELECT DISTINCT
position
FROM
employee
ORDER By
position DESC;


-- Завдання 4.6: Показати список працівників що займають посаду Seller відсортованих по даті прийому на роботу.
-- Деталі: Вивести ідентифікаційний номер, назву користувача, імя, прізвище працівника та займану ним посаду та дату прийому на роботу відсортованих в алфавітному.
SELECT
employee_id, 
last_name, 
first_name, 
position, 
employment_date
FROM 
employee
WHERE
position = 'Seller'
ORDER By
employment_date ASC;


-- Завдання 4.7: Показати список працівників що займають посади Seller і Consultant які були прийняті на роботу після 1 січня 2013 року відсортованих по даті прийому на роботу.
-- Деталі: Вивести ідентифікаційний номер, назву користувача, імя, прізвище працівника та займану ним посаду та дату прийому на роботу відсортованих в зворотньому порядку.
SELECT
employee_id,
last_name, 
first_name, 
position, 
employment_date
FROM 
employee
WHERE
(
position = 'Seller'
OR
position = 'Consultant'
)
AND 
employment_date > '2013-01-01'
ORDER By
employment_date DESC;


-- Завдання 4.8: Показати список працівників що займають посади Seller, Consultant і Senior Consultant) які були прийняті на роботу після 1 січня 2013 року відсортованих по даті прийому на роботу.
-- Деталі: Вивести імя, прізвище працівника та займану ним посаду та дату прийому на роботу відсортованих в зворотньому порядку.

-- Solution 1
SELECT
last_name, 
first_name, 
position, 
employment_date
FROM 
employee
WHERE
(
position LIKE 'Seller'
OR 
position IN ('Senior Consultant', 'Consultant')

)
AND 
employment_date > '2013-01-01'
ORDER By
employment_date DESC;

-- Solution 2
SELECT
-- employee_id, 
last_name, 
first_name, 
position, 
employment_date
FROM 
employee
WHERE
( position LIKE 'S_____'
OR
( position LIKE '%Consultant'
AND 
position NOT LIKE 'A%'
))
AND 
employment_date > '2013-01-01'
ORDER By
employment_date DESC;


-- Завдання 4.9: Показати список працівників які належать до певного департаменту і вклучити до переліку таких що не мають прямого підпорядкування(не мають менеджера).
-- Деталі: Вивести імя, прізвище працівника ідинтифікаційний номер керівника та департаменту відсортованих по ідинтифікаційному номеру керівника.
SELECT
employee_id, 
last_name, 
first_name, 
position, 
maneger_id, 
department_id
FROM 
employee
WHERE 
maneger_id IS NULL
OR 
department_id IS NOT NULL
ORDER By
maneger_id ASC;


-- Завдання 4.10: Показати список співробітників, які отримали премію та були прийняті на роботу в 2016 році.
-- Деталі: Вивести імя, прізвище, посада, дата прийняття на роботу, премія.

-- Solution 1
SELECT 
last_name,
first_name, 
position, 
employment_date,
bonus
FROM 
employee
WHERE
bonus IS NOT NULL
AND 
(
employment_date > '2015-12-31'
and 
employment_date < '2016-12-31'

)
ORDER By 
last_name ASC;

-- Solution 2
SELECT
last_name, 
first_name, 
position, 
employment_date, 
bonus
FROM 
employee
WHERE
bonus IS NOT NULL
AND 
employment_date
BETWEEN '2015-12-31'
AND '2016-12-31'
ORDER By 
last_name ASC;

-- Завдання 4.11: Відобразити залученість до процесу продажу за посадою співробітника.
-- Деталі: Вивести імя, прізвище, посада, Взаємодія з клієнтом.
SELECT
-- employee_id, 
last_name, 
first_name, 
position,
CASE
WHEN position = 'Senior Consultant' THEN 'Can Seles, Consulting and Lead'
WHEN position IN ('Senior Consultant', 'Consultant') THEN 'Can Seles and Consulting'
WHEN position like 'Assistant Consultant' THEN 'Can only Consulting'
WHEN position LIKE 'Seller' THEN 'Can only Sale'
ELSE 'Service Roles'
END AS 'Relation to Customer'
FROM 
employee
ORDER By 
last_name;


-- Завдання 4.12: Відобразити звіт про працівників змінивши назву колонок .
-- Деталі: Вивести імя, прізвище, посада, дата прийому на роботу.
-- Rename headings of column in report.
-- last_name -> Last Name
-- first_name -> First Name
-- position -> Title
-- employment_date -> Hire Date

SELECT
-- employee_id, 
last_name "Last Name", 
first_name 'First Name', 
position Title,
employment_date AS 'Hire Date'
FROM 
employee;



-- 1. Дізнайтеся, які клієнти були зареєстровані в нашій компанії (показати всі доступні поля). Відсортуйте список за Прізвищем.
SELECT
*
FROM
customer
ORDER By 
last_name;


-- 2. Вивести унікальні назви виробників (manufacture ) з таблиці продуктів в одному запиті, впорядкованому за алфавітом.
SELECT DISTINCT
manufacture
FROM
product
ORDER By 
manufacture ASC; 


-- 3. Отримати коротку інформацію про продукти (назва_продукту, виробник, категорія, тип_продукту, ціна), 
-- вироблені компанією 'DELL', з таблиці продуктів в одному запиті, впорядкованому за назвою продукту в алфавітному порядку.
SELECT 
product_name,
manufacture,
category,
product_type,
price
FROM 
product
WHERE 
manufacture = 'DELL'
ORDER By
product_name ASC;


-- 4. Отримати інформацію про клієнтів-жінок 1990-2000 років народження (ім'я, прізвище, стать, дата народження, номер телефону) 
-- з таблиці customer в одному запиті, відсортовану за прізвищем в алфавітному порядку.
SELECT
  first_name,
  last_name,
  genger,
  birth_date,
  phone_number
FROM
  customer
WHERE
  genger = 'F'
AND
  birth_date
  BETWEEN '1990-01-01' 
  AND '2000-12-31'
ORDER By
last_name ASC;


-- 5. Отримати інформацію з таблиці товарів про наявні на складі ноутбуки, які оснащені дисковими накопичувачами об'ємом 512 ГБ.
SELECT
*
FROM
  product
WHERE
  category = 'NOTEBOOK'
AND 
  product_description LIKE '%512GB%';
  
  
-- 6. Отримати інформацію з таблиці товарів про наявні на складі ноутбуки або настільні комп'ютери, які оснащені дисковими накопичувачами 512 ГБ або 1 ТБ.
SELECT
*
FROM
  product
WHERE
 (
 category = 'NOTEBOOK'
 OR
 category = 'Desktops'
 )
AND 
  (
  product_description LIKE '%512GB%'
  OR 
product_description LIKE '%1TB%'
);


-- 7. Отримати інформацію з таблиці рахунків-фактур (invoice ) про всі покупки, зроблені неавторизованими покупцями (customer_id NULL).
SELECT 
*
FROM
invoice
WHERE
customer_id IS NULL;