-- Case Statements

SELECT first_name, last_name,age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 40 THEN 'middle age'
    WHEN age BETWEEN 41 and 50 THEN 'old age'
    ELSE 'Time to go home and take rest'
END as Age_Bracket
FROM employee_demographics;


-- Pay Increase and Bonus
-- <50000 = 5%
-- >=50000 = 7%
-- finance = 10%

SELECT first_name, last_name, salary,
CASE 
	WHEN dept_id = 6 THEN salary * 1.10
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary >= 50000 THEN salary * 1.07
END as New_salary
FROM employee_salary;


SELECT *
FROM parks_departments;










