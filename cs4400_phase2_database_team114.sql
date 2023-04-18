DROP DATABASE IF EXISTS delivery_service;
CREATE DATABASE delivery_service;
USE delivery_service;

DROP TABLE IF EXISTS user;
CREATE TABLE user
(username	VARCHAR(20)	NOT NULL,
address		VARCHAR(500),
birthdate	DATE	NOT NULL,
first_name	VARCHAR(100)	NOT NULL,
last_name	VARCHAR(100)	NOT NULL,
PRIMARY KEY (username));

INSERT INTO user VALUES 
('agarcia7', '710 Living Water Drive', '1966-10-29', 'Alejandro', 'Garcia'),
('awilson5', '220 Peachtree Street', '1963-11-11', 'Aaron', 'Wilson'),
('bsummers4', '5105 Dragon Star Circle', '1976-02-09', 'Brie', 'Summers'),
('cjordan5', '77 Infinite Stars Road', '1966-06-05', 'Clark', 'Jordan'),
('ckann5', '64 Knights Square Trail', '1972-09-01', 'Carrot', 'Kann'),
('csoares8', '706 Living Stone Way', '1965-09-03', 'Claire', 'Soares'),
('echarles19', '22 Peachtree Street', '1974-05-06', 'Ella', 'Charles'),
('eross10', '22 Peachtree Street', '1975-04-02', 'Erica', 'Ross'),
('fprefontaine6', '10 Hitch Hikers Lane', '1961-01-28','Ford', 'Prefontaine'),
('hstark16', '53 Tanker Top Lane', '1971-10-27', 'Harmon', 'Stark'),
('jstone5', '101 Five Finger Way', '1961-01-06', 'Jared', 'Stone'),
('lrodriguez5', '360 Corkscrew Circle', '1975-04-02', 'Lina', 'Rodriguez'),
('mrobot1', '10 Autonomy Trace', '1988-11-02', 'Mister', 'Robot'),
('mrobot2', '10 Clone Me Circle', '1988-11-02', 'Mister', 'Robot'),
('rlopez6', '8 Queens Route', '1999-09-03', 'Radish', 'Lopez'),
('sprince6', '22 Peachtree Street', '1968-06-15', 'Sarah', 'Prince'),
('tmccall5', '360 Corkscrew Circle', '1973-03-19', 'Trey', 'McCall');



DROP TABLE IF EXISTS owner;
CREATE TABLE owner
(username VARCHAR(20) NOT NULL,
PRIMARY KEY (username),
CONSTRAINT fk1 FOREIGN KEY (username) REFERENCES user(username));

INSERT INTO owner VALUES 
('cjordan5'),
('jstone5'), 
('sprince6');




DROP TABLE IF EXISTS employee;
CREATE TABLE employee
(username VARCHAR(20) NOT NULL,
taxID CHAR(11),
experience INT,
hired DATE,
salary DECIMAL(10, 2),
PRIMARY KEY (username),
CONSTRAINT fk2 FOREIGN KEY (username) REFERENCES user(username),
UNIQUE (taxID));

INSERT INTO employee VALUES
('agarcia7', '999-99-9999', 24, '2019-03-17', 41000),
('awilson5', '111-11-1111', 9, '2020-03-15', 46000),
('bsummers4', '000-00-0000', 17, '2018-12-06', 35000),
('ckann5', '640-81-2357', 27, '2019-08-03', 46000),
('csoares8', '888-88-8888', 26, '2019-02-25', 57000),
('echarles19', '777-77-7777', 3, '2021-01-02', 27000),
('eross10', '444-44-4444', 10, '2020-04-17', 61000),
('fprefontaine6', '121-21-2121', 5, '2020-04-17', 20000),
('hstark16', '555-55-5555', 20, '2018-07-23', 59000),
('mrobot1', '101-01-0101', 8, '2015-05-27', 38000),
('rlopez6', '123-58-1321', 51, '2017-02-05', 64000),
('tmccall5', '333-33-3333', 29, '2018-10-17', 33000);



DROP TABLE IF EXISTS pilot;
CREATE TABLE pilot
(username VARCHAR(20) NOT NULL,
license_type VARCHAR(100) NOT NULL,
experience INT NOT NULL,
taxID CHAR(11),
PRIMARY KEY (username),
CONSTRAINT fk3 FOREIGN KEY (username) REFERENCES user(username),
UNIQUE (taxID),
CONSTRAINT fk4 FOREIGN KEY (taxID) REFERENCES employee(taxID));

INSERT INTO pilot VALUES
('agarcia7', '610623', 38, '999-99-9999'),
('awilson5', '314159', 41, '111-11-1111'),
('bsummers4', '411911', 35, '000-00-0000'),
('csoares8', '343563', 7, '888-88-8888'),
('echarles19', '236001', 10, '777-77-7777'),
('fprefontaine6', '657483', 2, '121-21-2121'),
('lrodriguez5','287182', 67, NULL),
('mrobot1','101010', 18, '101-01-0101'),
('rlopez6','235711', 58, '123-58-1321'),
('tmccall5','181633', 10,'333-33-3333');



DROP TABLE IF EXISTS worker;
CREATE TABLE worker
(username VARCHAR(20) NOT NULL,
taxID CHAR(11),
PRIMARY KEY (username),
CONSTRAINT fk5 FOREIGN KEY (username) REFERENCES user(username),
UNIQUE (taxID),
CONSTRAINT fk6 FOREIGN KEY (taxID) REFERENCES employee(taxID));

INSERT INTO worker VALUES 
('ckann5', '640-81-2357'),
('csoares8', '888-88-8888'),
('echarles19', '777-77-7777'),
('eross10', NULL),
('hstark16', NULL),
('mrobot2', NULL),
('tmccall5', NULL);



DROP TABLE IF EXISTS location;
CREATE TABLE location
(label varchar(40) NOT NULL, 
x_coord	int	NOT NULL, 
y_coord	int	NOT NULL, 
space int,
PRIMARY KEY (label));

INSERT INTO location VALUES
('plaza',-4,-3,10),
('buckhead',7,10,8),
('avalon',2,15,NULL),
('mercedes',-8,5,NULL),
('midtown',2,1,7),
('southside',1,-16,5),
('airport',15,5,-6),
('highpoint',4,11,3);



DROP TABLE IF EXISTS restaurant;
CREATE TABLE restaurant
(name varchar(40) NOT NULL,
rating int,
spent int,
PRIMARY KEY (name));

INSERT INTO restaurant VALUES
('Bishoku',5,10),
('Casi Cielo',5,30),
('Ecco',3,0),
('Fogo de Chao',4,30),
('Hearth',4,0),
('Il Giallo',4,10),
('Lure',5,20),
('Micks',2,0),
('South City Kitchen',5,30),
('Tre Vele',4,10);



DROP TABLE IF EXISTS service;
CREATE TABLE service
(ID varchar(40) NOT NULL,
name varchar(40),
manager varchar(40),
PRIMARY KEY (ID),
CONSTRAINT fk7 FOREIGN KEY (manager) REFERENCES worker(username));

INSERT INTO service VALUES
('hf','Herban Feast','hstark16'),
('osf','On Safari Foods','eross10'),
('rr','Ravishing Radish','echarles19');



DROP TABLE IF EXISTS ingredient;
CREATE TABLE ingredient 
(barcode char(13) NOT NULL,
iname char(30),
weight int,
PRIMARY KEY (barcode));

INSERT INTO ingredient VALUES
('bv_4U5L7M', 'balsamic vinegar', 4),
('clc_4T9U25X', 'caviar', 5),
('ap_9T25E36L', 'foie gras', 4),
('pr_3C6A9R', 'prosciutto', 6),
('ss_2D4E6L', 'saffron', 3),
('hs_5E7L23M', 'truffles', 3); 



DROP TABLE IF EXISTS drone;
CREATE TABLE drone 
(service_ID char(5) NOT NULL,
tag int,
fuel int,
capacity int,
sales int,
pilot_username varchar(20),
swarm_lead_ID char(5),
swarm_lead_tag int,
hover char(10) NOT NULL,
PRIMARY KEY (service_ID, tag),
CONSTRAINT fk8 FOREIGN KEY (service_ID) REFERENCES service (ID),
CONSTRAINT fk9 FOREIGN KEY (pilot_username) REFERENCES pilot (username), 
CONSTRAINT fk10 FOREIGN KEY (swarm_lead_ID) REFERENCES service (ID),
CONSTRAINT fk11 FOREIGN KEY (hover) REFERENCES location (label));

INSERT INTO drone VALUES
('hf', 1, 100, 6, 0, 'fprefontaine6', NULL, NULL, 'southside'),
('hf', 5, 27, 7, 100, 'fprefontaine6', NULL, NULL, 'buckhead'),
('hf', 8, 100, 8, 0 , 'bsummers4', NULL, NULL, 'southside'),
('hf', 11, 25, 10, 0, NULL, 'hf', 5, 'buckhead'),
('hf', 16, 17, 5, 40, 'fprefontaine6', NULL, NULL, 'buckhead'),
('osf', 1, 100, 9, 0, 'awilson5', NULL, NULL, 'airport'),
('osf', 2, 75, 7, 0, NULL, 'osf', 1, 'airport'),
('rr', 3, 100, 5, 50, 'agarcia7', NULL, NULL, 'avalon'),
('rr', 7, 53, 5, 100, 'agarcia7', NULL, NULL, 'avalon'),
('rr', 8, 100, 6, 0, 'agarcia7', NULL, NULL, 'highpoint'),
('rr', 11, 90, 6, 0, NULL, 'rr', 8, 'highpoint');


DROP TABLE IF EXISTS contain;
CREATE TABLE contain 
(ingredient_barcode char(13) NOT NULL,
service_ID char(5) NOT NULL,
drone_tag int NOT NULL,
price int,
quantity int,
PRIMARY KEY (ingredient_barcode, service_ID, drone_tag),
CONSTRAINT fk12 FOREIGN KEY (ingredient_barcode) REFERENCES ingredient (barcode),
CONSTRAINT fk13 FOREIGN KEY (service_ID, drone_tag) REFERENCES drone (service_ID, tag));

INSERT INTO contain VALUES
('clc_4T9U25X', 'rr', 3, 2, 28),
('clc_4T9U25X', 'hf', 5, 1, 30),
('pr_3C6A9R', 'osf', 1, 5, 20),
('pr_3C6A9R', 'hf', 8, 4, 18),
('ss_2D4E6L', 'osf', 1, 3, 23),
('ss_2D4E6L', 'hf', 11, 3, 19),
('ss_2D4E6L', 'hf', 1, 6, 27),
('hs_5E7L23M', 'osf', 2, 7, 14),
('hs_5E7L23M', 'rr', 3, 2, 15),
('hs_5E7L23M', 'hf', 5, 4, 17);



DROP TABLE IF EXISTS fund;
CREATE TABLE fund
(username varchar(20) NOT NULL,
restaurant_name varchar(40) NOT NULL,
amount_invested int,
dt_made date,
PRIMARY KEY (username, restaurant_name),
CONSTRAINT fk14 FOREIGN KEY (username) REFERENCES user(username),
CONSTRAINT fk15 FOREIGN KEY (restaurant_name) REFERENCES restaurant(name));
    
INSERT INTO fund VALUES
('jstone5','Ecco',20,'2022-10-25'),
('sprince6','Il Giallo',10,'2022-03-06'),
('jstone5','Lure',30,'2022-09-08'),
('jstone5','South City Kitchen',5,'2022-07-25');



DROP TABLE IF EXISTS works_for;
CREATE TABLE works_for
(username varchar(20) NOT NULL,
works_for varchar(40) NOT NULL,
PRIMARY KEY (username, works_for),
CONSTRAINT fk16 FOREIGN KEY (username) REFERENCES user(username),
CONSTRAINT fk17 FOREIGN KEY (works_for) REFERENCES service(ID));

INSERT INTO works_for VALUES
('agarcia7','rr'),
('awilson5','osf'),
('bsummers4','hf'),
('ckann5','osf'),
('echarles19','rr'),
('eross10','osf'),
('fprefontaine6','hf'),
('hstark16','hf'),
('mrobot1','osf'),
('mrobot1','rr'),
('rlopez6','rr'),
('tmccall5','hf');