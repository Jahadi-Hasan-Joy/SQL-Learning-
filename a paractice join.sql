SHOW DATABASES;
SHOW TABLES;

USE parks_and_recreation;

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
FROM parks_departments;

SELECT *
FROM employee_demographics as emp_demo
INNER JOIN employee_salary as emp_sal    -- inner join == join
ON emp_demo.employee_id = emp_sal.employee_id;


SELECT *
FROM employee_demographics as emp_demo
LEFT JOIN employee_salary as emp_sal
ON emp_demo.employee_id = emp_sal.employee_id;

SELECT *
FROM employee_demographics as emp_demo
RIGHT JOIN employee_salary as emp_sal
ON emp_demo.employee_id = emp_sal.employee_id;



SELECT *
FROM employee_demographics as emp_demo
LEFT JOIN employee_salary as emp_sal
ON emp_demo.employee_id = emp_sal.employee_id
UNION
SELECT *
FROM employee_demographics as emp_demo
RIGHT JOIN employee_salary as emp_sal
ON emp_demo.employee_id = emp_sal.employee_id;



