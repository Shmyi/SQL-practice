-- Create Tables
-- Authors: Yi Chen, Lujan Bajracharya
-- This SQL is used to creat the database table of the students, legial guardian and enrollment information

--Drop if exist
DROP TABLE if exists student_data CASCADE;
DROP TABLE if exists legal_guardian_data CASCADE;
DROP TABLE if exists guardian_data CASCADE;
DROP TABLE if exists enrollment CASCADE;
DROP TABLE if exists student_gpa CASCADE;
--Create Table student_data
CREATE TABLE IF NOT EXISTS student_data(
	id SERIAL PRIMARY KEY,
	name VARCHAR(55) NOT NULL UNIQUE,
	address VARCHAR(100) NOT NULL,
	gender VARCHAR(20) NOT NULL,
	birthdate DATE NOT NULL,
	CONSTRAINT chk_gender CHECK (gender IN ('Male', 'Female', 'Other')),
	CONSTRAINT chk_birthdate CHECK (birthdate <= CURRENT_DATE)
);
--Create Table legal_guardian_data
CREATE TABLE IF NOT EXISTS legal_guardian_data(
	name VARCHAR(55) NOT NULL PRIMARY KEY,
	homephone CHAR(10) NOT NULL,
	address VARCHAR(55) NOT NULL,
	gender VARCHAR(20),
	birthdate DATE,
	children_responsible_for VARCHAR(55) NOT NULL,
	relationship VARCHAR(55) NOT NULL,
	CONSTRAINT chk_legal_guardian_gender CHECK (gender IN ('Male', 'Female', 'Other')),
	CONSTRAINT chk_birthdate CHECK (birthdate <= CURRENT_DATE)
);
--Create Table guardian_data
CREATE TABLE IF NOT EXISTS guardian_data(
	legal_guardian_name VARCHAR(55) NOT NULL,
	legal_guardian_homephone Char(10),
	student_name VARCHAR(55) NOT NULL,
	PRIMARY KEY(legal_guardian_name, student_name),
	FOREIGN KEY (legal_guardian_name) REFERENCES legal_guardian_data(name),
	FOREIGN KEY (student_name) REFERENCES student_data(name)
);
--Create Table enrollment
CREATE TABLE IF NOT EXISTS enrollment(
	enroll_number INT NOT NULL PRIMARY KEY,
	student_id INT NOT NULL,
	academic_year CHAR(5) NOT NULL,
	FOREIGN KEY(student_id) REFERENCES student_data(ID)
	
);
--Create Table student_gpa
CREATE TABLE IF NOT EXISTS student_gpa(
	student_id INT NOT NULL,
	academic_year CHAR(5),
	course_name VARCHAR(55),
	course_gpa DECIMAL(2,1) CHECK (course_gpa>0 AND course_gpa <= 4.0),
	PRIMARY KEY(student_id),
	FOREIGN KEY(student_id) REFERENCES student_data(ID)
);
CREATE SEQUENCE IF NOT EXISTS seq_person
	MINVALUE 1
	START WITH 1
	INCREMENT BY 1
	CACHE 10;

--https://www.postgresql.org/docs/current/functions-formatting.html