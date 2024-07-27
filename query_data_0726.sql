-- QUERIES
-- Authors: Yi Chen, Lujan Bajracharya
-- This SQL is used to query the specific requirement of the student database

-- 1.Show all studnets data
SELECT * 
	FROM STUDENT_DATA;

-- 2.Retrieve column of name and birth date from student_data table and rename them as requirement
SELECT 
	NAME AS STUDENT_NAME,
	BIRTHDATE AS DOB
	FROM STUDENT_DATA;

-- 3.Retrieve column of name and birth date from student_data table and rename them as requirement
-- Filter the rows to include only birth date is on or before 2006-01-01
SELECT 
	NAME AS STUDENT_NAME,
	BIRTHDATE AS DOB
	FROM STUDENT_DATA
		WHERE (BIRTHDATE <= '2006-01-01')
	ORDER BY BIRTHDATE DESC;

-- 4.Retrieve column of name and birth date from student_data table and rename them as requirement
-- Filter the rows to include only birth date is on or before 2006-01-01
-- and student with gender female
SELECT 
	NAME AS STUDENT_NAME,
	BIRTHDATE AS DOB, 
	gender
	FROM STUDENT_DATA
		WHERE (BIRTHDATE <= '2006-01-01') AND (gender = 'Female')
	ORDER BY BIRTHDATE DESC;

-- 5.Retrieve all colunms and rows from both student_data and legal_guardian_data tables, even if there are no matching.
SELECT * 
	FROM STUDENT_DATA 
	FULL JOIN LEGAL_GUARDIAN_DATA ON STUDENT_DATA.NAME = LEGAL_GUARDIAN_DATA.CHILDREN_RESPONSIBLE_FOR;

-- 6.Join legal_guardian_data and enrollment into student_data table and  retrieve specific columes and rows.
SELECT 
	S.ID, S.NAME AS STUDENT_NAME,
	S.ADDRESS,
	LG.NAME AS LEGAL_GUARDIAN_NAME,
	LG.HOMEPHONE, EN.ACADEMIC_YEAR
	FROM STUDENT_DATA S
	FULL JOIN LEGAL_GUARDIAN_DATA LG 
		ON S.NAME = LG.CHILDREN_RESPONSIBLE_FOR
	FULL JOIN ENROLLMENT EN 
		ON S.ID = EN.STUDENT_ID;
-- 7. Retrieve the average course GPA from all students
SELECT ROUND(AVG(SG.COURSE_GPA), 1) AS AVG_GPA
	FROM STUDENT_DATA S
	JOIN STUDENT_GPA SG ON S.ID = SG.STUDENT_ID; 
-- 8. Retrieve the average course GPA from all students group by course name
SELECT 
	ROUND(AVG(SG.COURSE_GPA),1),
	SG.COURSE_NAME
	FROM STUDENT_DATA S
	JOIN STUDENT_GPA SG ON S.ID = SG.STUDENT_ID
	GROUP BY SG.COURSE_NAME;

-- 9. Retrieve the average course GPA from all 'Male' students group by course name
SELECT 
	SG.COURSE_NAME,
	S.GENDER,
	ROUND(AVG(SG.COURSE_GPA),1) AS AVG_GPA
	FROM STUDENT_DATA S
	JOIN STUDENT_GPA SG ON S.ID = SG.STUDENT_ID
	GROUP BY S.GENDER, SG.COURSE_NAME
	HAVING GENDER ='Male';
	
-- 10. A query that performs a subquery either as part of the WHERE clause or as a derived/virtual 
-- table.
SELECT *
	FROM (
		SELECT 
			NAME AS 
			STUDENT_ID
		FROM STUDENT_DATA
			
-- 11. A query that performs an aggregate with a join and a group by.



