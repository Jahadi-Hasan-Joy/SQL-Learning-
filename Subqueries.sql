-- Subqueries

SELECT * 
FROM employee_demographics
WHERE employee_id  
IN 
(SELECT employee_id
	FROM employee_salary
	WHERE dept_id = 1
);

SELECT first_name, salary,
	(SELECT avg(salary)
    FROM employee_salary)
FROM employee_salary
GROUP BY first_name,salary;

SELECT gender, avg(age), MAX(age),MIN(age),count(age)
FROM employee_demographics
GROUP BY gender;



SELECT gender, avg(`MAX(age)`)
FROM
(SELECT gender, avg(age), MAX(age),MIN(age),count(age)
FROM employee_demographics
GROUP BY gender ) as agg_table
GROUP BY gender;

SELECT avg(mx)
FROM
(SELECT gender, avg(age), MAX(age) as mx,MIN(age),count(age)
FROM employee_demographics
GROUP BY gender ) as agg_table
;















