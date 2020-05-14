DROP DATABASE IF EXISTS `Hospital`;
CREATE DATABASE `Hospital`;
USE `Hospital`;

CREATE TABLE `Patient` (
	`ID` VARCHAR(9) NOT NULL,
    `Name` VARCHAR(45) NOT NULL,
    `Surname` VARCHAR(45) NOT NULL,
    `Birthdate` DATE NOT NULL,
    `Gender` ENUM('Male','Female','Other'),
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Room` (
	`ID` VARCHAR(4) NOT NULL,
    `Type` ENUM('Single Room','Deluxe Room','Intensive Care Unit','Labor') NOT NULL,
    `Doctor` VARCHAR(9) NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Doctor` (
	`ID` VARCHAR(9) NOT NULL,
    `Name` VARCHAR(45) NOT NULL,
    `Surname` VARCHAR(45) NOT NULL,
    `Birthdate` DATE NOT NULL,
    `Gender` ENUM('Male','Female','Other'),
    `Room` VARCHAR(4) NOT NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `Appointment` (
	`ID` INT(11) NOT NULL AUTO_INCREMENT,
    `Reason` VARCHAR(255) NOT NULL,
    `Date` DATE NOT NULL,
    `Patient` VARCHAR(9) NOT NULL,
    `Doctor` VARCHAR(9) NOT NULL,
    `Room` VARCHAR(4) NOT NULL,
    PRIMARY KEY (`ID`)
);

INSERT INTO Patient VALUES ('123456789','Kakyoin','Noriaki','1985/05/09','Male');
INSERT INTO Patient VALUES ('111111111','Felix','Goblino','1997/03/28','Male');
INSERT INTO Patient VALUES ('222222222','Xqc','PC','2003/11/12','Female');
INSERT INTO Patient VALUES ('333333333', 'Giorno', 'Giovanna', '2012-12-30', 'Male');
INSERT INTO Patient VALUES ('444444444', 'Guido', 'Mista', '2001-1-5', 'Male');
INSERT INTO Patient VALUES ('555555555', 'AYAYA', 'Clap', '1955-2-3', 'Female');
INSERT INTO Patient VALUES ('666666666', 'Naruto', 'Uzumaki', '2007-11-22', 'Male');
INSERT INTO Patient VALUES ('777777777', 'Sasuke', 'Uchiha', '2007-11-21', 'Male');
INSERT INTO Patient VALUES ('888888888', 'Minato', 'Uzumaki', '1945-5-6', 'Male');
INSERT INTO Patient VALUES ('999999999', 'Joe', 'Underdog', '1990/05/13', 'Male');

INSERT INTO Room VALUES ('PS-2','Single Room','123456789');
INSERT INTO Room VALUES ('P9-8','Labor','987654321');
INSERT INTO Room VALUES ('PB-4','Intensive Care Unit','121212121');
INSERT INTO Room VALUES ('PS-1','Single Room','242424242');
INSERT INTO Room VALUES ('P1-2','Deluxe Room','707070707');
INSERT INTO Room VALUES ('PB-3','Deluxe Room','989898989');
INSERT INTO Room VALUES ('P3-5','Intensive Care Unit','696969696');
INSERT INTO Room VALUES ('PS-8','Single Room','666777888');
INSERT INTO Room VALUES ('P4-6','Single Room','111222333');
INSERT INTO Room VALUES ('PB-1','Deluxe Room','444555999');

INSERT INTO Appointment VALUES (NULL,'Leg pain','2018/12/30','123456789','123456789','P9-8');
INSERT INTO Appointment VALUES (NULL,'Headache','2019/01/03','111111111','987654321','PB-4');
INSERT INTO Appointment VALUES (NULL,'Monthly check','1994/05/06','222222222','121212121','PS-2');
INSERT INTO Appointment VALUES (NULL,'Urgency','2018/05/01','333333333','242424242','PS-1');
INSERT INTO Appointment VALUES (NULL,'Labor','2019/02/03','444444444','707070707','P1-2');
INSERT INTO Appointment VALUES (NULL,'Vaccine','2018/02/02','555555555','989898989','PB-3');
INSERT INTO Appointment VALUES (NULL,'Broken ankle','2018/11/11','666666666','696969696','P3-5');
INSERT INTO Appointment VALUES (NULL,'Rehab','2019/03/06','777777777','666777888','PS-8');
INSERT INTO Appointment VALUES (NULL,'Card renew','2018/06/13','888888888','111222333','P4-6');
INSERT INTO Appointment VALUES (NULL,'Fever','2018/07/08','999999999','444555999','PB-1');

INSERT INTO Doctor VALUES ('123456789','Johanna','Joester','1990/01/01','Female','P9-8');
INSERT INTO Doctor VALUES ('987654321','Connor','McGregor','1999/01/28','Male','PB-4');
INSERT INTO Doctor VALUES ('121212121','Antoine','Griezmann','1980/02/22','Male','PS-2');
INSERT INTO Doctor VALUES ('242424242','Plastic','Love','1700/10/06','Female','PS-1');
INSERT INTO Doctor VALUES ('707070707','Komm','Susser Tod','1967/07/19','Female','P1-2');
INSERT INTO Doctor VALUES ('989898989','Eren','Jaeger','1990/06/24','Male','PB-3');
INSERT INTO Doctor VALUES ('696969696','Mario','Luigi','1941/02/24','Male','P3-5');
INSERT INTO Doctor VALUES ('666777888','Mikasa','Ackermann','1990/07/21','Female','PS-8');
INSERT INTO Doctor VALUES ('111222333','Coda','Nostalgia','2001/11/12','Female','P4-6');
INSERT INTO Doctor VALUES ('444555999','Lofi','HipHop','2000/12/11','Male','PB-1');

ALTER TABLE `Room` ADD FOREIGN KEY (`Doctor`) REFERENCES `Doctor`(`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Doctor` ADD FOREIGN KEY (`Room`) REFERENCES `Room`(`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Appointment` ADD FOREIGN KEY (`Patient`) REFERENCES `Patient`(`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Appointment` ADD FOREIGN KEY (`Doctor`) REFERENCES `Doctor`(`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Appointment` ADD FOREIGN KEY (`Room`) REFERENCES `Room`(`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
