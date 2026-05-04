-- Window Function

SELECT dem.first_name, dem.last_name,  gender, avg(salary) as avg_salary
FROM employee_demographics as dem
JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name,  gender;   -- avg is not working at this way


SELECT dem.first_name,gender, avg(salary) OVER(PARTITION BY gender)
FROM employee_demographics as dem
JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
SELECT dem.first_name,gender, salary,
sum(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) as rolling_total	-- rolling total
FROM employee_demographics as dem
JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
SELECT dem.first_name,dem.employee_id,gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) as row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) as rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) as Dense_rank_num
FROM employee_demographics as dem
JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id;

















