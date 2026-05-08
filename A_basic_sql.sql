CREATE DATABASE college;
CREATE DATABASE IF NOT EXISTS college;

CREATE DATABASE sample_db;
-- ALTER DATABASE sample_db READ ONLY =1;		 -- edit kora jabe na 
DROP DATABASE IF EXISTS sample_db;

USE college;

SHOW DATABASES;
SHOW TABLES;
DROP TABLE student;

CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO student (rollno,name,marks,grade,city) 
VALUES
(1,"Jahadi",99,"A","Rajshahi"),
(2,"Hasan",74,"B","Rajshahi"),
(3,"Joy",80,"A","Rajshahi"),
(4,"Rini",38,"F","Chuadanga"),
(5,"Aklima",70,"B","Rajshahi"),
(6,"Jabbar",66,"C","Rajshahi"),
(7,"Badhon",96,"A","Dhaka");

ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 20;

UPDATE student
SET age = CASE rollno
    WHEN 1 THEN 26
    WHEN 2 THEN 26
    WHEN 3 THEN 25
    WHEN 4 THEN 23
    WHEN 5 THEN 49
    WHEN 6 THEN 58
    WHEN 7 THEN 28
END;

ALTER TABLE student
DROP COLUMN age;

ALTER TABLE student
MODIFY COLUMN age VARCHAR(3) ;

ALTER TABLE student
CHANGE age student_age int;

SELECT *
FROM student;

SELECT name 
FROM student;

SELECT 
DISTINCT city FROM student;

SELECT name 
FROM student
WHERE grade = "F";

SELECT * 
FROM student
WHERE marks >= 80;

SELECT * 
FROM student
WHERE marks + 10 > 100;

SELECT * 
FROM student
WHERE grade  != "F";

SELECT name, marks
FROM student
ORDER BY marks ASC;

SELECT name, marks
FROM student
ORDER BY marks DESC
LIMIT 3;

SELECT * 
FROM student
WHERE grade = "A" AND marks >= 80;

SELECT * 
FROM student
WHERE grade = "A" OR city = "Rajshahi";

SELECT * 
FROM student
WHERE  city IN ("Rajshahi","Dhaka");

SELECT * 
FROM student
WHERE  city NOT IN ("Chuadanga");

SELECT * 
FROM student
WHERE marks BETWEEN 80 AND 100;

SELECT 5 & 3;
SELECT 5 | 3;
SELECT 5 ^ 3;

-- Aggregate funcion

-- 80 er besi koto jon paise seta dekhte
SELECT max(marks),min(marks),avg(marks), count(*) 	
FROM student;

-- exect count ber korbe  mark er opor base kore  GROUP BY kore count ber korbe
SELECT marks, count(*)  
FROM student
GROUP BY marks;

-- city o koto gula oi namer city ase dekhao
SELECT city,count(city)
FROM student
GROUP BY city;

-- city o koto gula studend oi city te thaka
SELECT city, count(name)
FROM student
GROUP BY city;

SELECT city, avg(marks)
FROM student
GROUP BY city;


-- avg mark kon city er besi dekhao
SELECT city, avg(marks)
FROM student
GROUP BY city 
ORDER BY avg(marks) DESC;



CREATE TABLE order_table (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_method VARCHAR(20),
    city VARCHAR(20)
);

INSERT INTO order_table (customer_id, customer_name, order_method, city)
VALUES
(1, "Rahul", "Online", "Dhaka"),
(2, "Priya", "Offline", "Rajshahi"),
(3, "Karim", "Online", "Chittagong"),
(4, "Suman", "Phone", "Dhaka"),
(5, "Nila", "Online", "Rajshahi"),
(6, "Rahim", "Offline", "Sylhet"),
(7, "Tania", "Phone", "Dhaka"),
(8, "Sabbir", "Online", "Chittagong"),
(9, "Mou", "Offline", "Rajshahi"),
(10, "Farhan", "Phone", "Dhaka");

SELECT *
FROM order_table;

SELECT city, order_method, count(order_method)
FROM order_table
GROUP BY city ,order_method
ORDER BY city;

SELECT grade,count(grade)
FROM student
GROUP BY grade
ORDER BY grade;


-- Having Clause

SELECT city, count(marks)
FROM student 
WHERE grade = "A" 
GROUP BY city 
HAVING max(marks) >= 80
ORDER BY city DESC;


-- UPDATE

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE student
MODIFY COLUMN grade VARCHAR(2);

UPDATE student
SET grade = "B"
WHERE marks BETWEEN 70 AND 79;

SELECT *
FROM student;

-- DELETE

INSERT INTO student 
VALUES(8,"abc", 10, "F", "Homeless");

DELETE FROM student
WHERE marks <33;



START TRANSACTION;

DELETE FROM student
WHERE marks < 50;

-- ভুল হয়ে গেছে! ফিরিয়ে আনো
ROLLBACK;

-- এখন দেখো data ফিরে এসেছে
SELECT * FROM student;

-- New table

CREATE TABLE dept(
d_id INT PRIMARY KEY,
d_name varchar(50)
);

INSERT into dept
VALUES
(101,"CSE"),
(102,"EEE"),
(103,"ICT");

CREATE TABLE teacher(
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id int,
FOREIGN KEY (dept_id) REFERENCES dept(d_id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

DROP TABLE teacher;

INSERT INTO teacher (id, name, dept_id)
VALUES
(1, "Dr. Rahman", 101),
(2, "Prof. Karim", 102),
(3, "Ms. Tania", 101),
(4, "Mr. Sabbir", 103),
(5, "Dr. Priya", 102);

SELECT *
FROM dept;

SELECT *
FROM teacher;

UPDATE dept
SET d_id = 105
WHERE d_id =103;