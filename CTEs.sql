-- CTEs

WITH CTE_Example (Gender, AVG_Sal, MAX_Sal, MIN_Sal, COUNT_Sal) as
(
SELECT gender, AVG(salary)  AVG_Sal,MAX(salary)  max_sal,MIN(salary)  min_sal ,count(salary)  count_sal
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(AVG_Sal)
FROM CTE_Example;

SELECT AVG(avgs)
from (SELECT gender, AVG(salary) as avgs,MAX(salary),MIN(salary),count(salary)
FROM employee_demographics as dem
JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) as example;



WITH CTE_Example as
(
SELECT employee_id,birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 as
(
SELECT employee_id,salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example
Join CTE_Example2
	on CTE_Example.employee_id = CTE_Example2.employee_id;








