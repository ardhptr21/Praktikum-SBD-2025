CREATE TABLE Member (
	Member_ID INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(100),
	Phone VARCHAR(20) UNIQUE,
	Pin_BBM_Member VARCHAR(10) UNIQUE,
	Member_DOB DATE
);

ALTER TABLE Member ADD (
	Gender ENUM('Male', 'Female'),
	Joining_Date DATE DEFAULT (CURRENT_DATE)
);

ALTER TABLE Member ADD
Member_Type CHAR(12);

CREATE TABLE Trainer (
	Trainer_ID INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(100),
	Gender ENUM('Male', 'Female'),
	Specialization VARCHAR(100),
	Phone VARCHAR(20) UNIQUE,
	DOB DATE,
	Pin_BBM_Trainer VARCHAR(10) UNIQUE
);

CREATE TABLE Class (
	Class_ID INT AUTO_INCREMENT PRIMARY KEY,
	Class_Name VARCHAR(100),
	Class_Date DATE,
	Class_Time TIME,
	Trainer_ID INT NOT NULL,
	
	FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID)
);

ALTER TABLE Member MODIFY
Member_Type ENUM('Bronze', 'Silver', 'Gold');

CREATE TABLE Participant (
	Participant_ID INT AUTO_INCREMENT PRIMARY KEY,
	Member_ID INT NOT NULL,
	Class_ID INT NOT NULL,
	
	FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID) ON DELETE CASCADE,
	FOREIGN KEY (Class_ID) REFERENCES Class(Class_ID) ON DELETE CASCADE
);

ALTER TABLE Member
RENAME COLUMN Name TO Member_Name,
RENAME COLUMN Phone TO Member_Phone,
RENAME COLUMN Gender TO Member_Gender;

ALTER TABLE Trainer
RENAME COLUMN Name TO Trainer_Name,
RENAME COLUMN Gender TO Trainer_Gender,
RENAME COLUMN Phone TO Trainer_Phone,
RENAME COLUMN DOB TO Trainer_DOB,
RENAME COLUMN Specialization TO Trainer_Specialization;

INSERT INTO 
	Member (Member_Name, Member_Phone, Pin_BBM_Member, Member_DOB, Member_Gender, Joining_Date, Member_Type)
VALUES
	('Spongebob', '6281234567891', '7F8E9D6A', '1999-07-14', 'Male', '2021-06-15', 'Gold'),
	('Patrick', '6282378881111', 'A1B2C3D4', '1998-03-01', 'Male', '2022-03-10', 'Silver'),
	('Sandy', '6281355554444', '9C0B1A2E', '1997-10-23', 'Female', '2023-01-08', 'Bronze'),
	('Squidward', '6281777321035', 'D3E4F5A6', '1995-04-12', 'Male', '2020-11-25', 'Silver'),
	('Mr Krab', '6281837814312', '5B4C3D2A', '1980-09-25', 'Male', '2021-09-30', 'Gold'),
	('Plankton', '6281898307588', '1A9E3C7F', '1982-11-05', 'Male', '2024-02-12', 'Bronze'),
	('Karen', '6281958800865', 'B4F1D2C3', '1990-12-20', 'Female', '2022-07-04', 'Bronze'),
	('Larry', '6282019294141', 'C0D9A8B1', '2001-02-16', 'Male', '2023-08-21', 'Silver'),
	('Pearl', '6282079787418', 'A9B8C7D6', '1993-06-18', 'Female', '2021-04-18', 'Bronze'),
	('Garry', '6282140280694', '7E2A1F3D', '2000-08-30', 'Male', '2020-12-05', 'Gold');

INSERT INTO
	Trainer (Trainer_Name, Trainer_Gender, Trainer_Specialization, Trainer_Phone, Trainer_DOB)
VALUES
	('Minion', 'Male', 'Cardio', '6281234567890', '1997-03-21'),
	('Kuromi', 'Female', 'Yoga', '6282234567891', '1990-07-15'),
	('Arlo', 'Male', 'Weightlifting', '6283334567892', '1993-12-10'),
	('Panji', 'Male', 'Zumba', '6284434567893', '1993-05-28'),
	('Melody', 'Female', 'Pilates', '6285534567894', '1998-09-05');

INSERT INTO
	Class (Class_Name, Class_Date, Class_Time, Trainer_ID)
VALUES
	('Morning Cardio', '2025-04-20', '7:00', 1),
	('Yoga for Beginners', '2025-04-21', '8:30', 2),
	('Zumba Energy', '2025-04-22', '17:00', 4),
	('Heavy Lifting', '2025-04-23', '9:00', 3),
	('Evening Yoga', '2025-04-20', '17:00', 2),
	('Pilates Advance', '2025-04-25', '8:00', 5);

INSERT INTO
	Participant (Member_ID, Class_ID)
VALUES
	(3, 1),
	(7, 1),
	(10, 1),
	(5, 1),
	(4, 1),
	(8, 2),
	(9, 2),
	(1, 2),
	(2, 2),
	(4, 2),
	(3, 2),
	(6, 3),
	(8, 3),
	(4, 3),
	(2, 3),
	(9, 3),
	(1, 3),
	(7, 4),
	(3, 4),
	(10, 4),
	(10, 4),
	(2, 4),
	(10, 5),
	(5, 5),
	(2, 5),
	(9, 5),
	(5, 6),
	(9, 6),
	(10, 6);

ALTER TABLE Member DROP COLUMN Pin_BBM_Member;
ALTER TABLE Trainer DROP COLUMN Pin_BBM_Trainer;

SELECT * FROM Member WHERE YEAR(Member_DOB) < 1990;
DELETE FROM Member WHERE Member_ID IN (5, 6);

SELECT * FROM Class WHERE Class_Date='2025-04-20';

SELECT * FROM Member WHERE Member_Type='Gold';

TRUNCATE TABLE Participant;