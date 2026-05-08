-- Show all from the table 
SELECT * 
FROM employee_demographics;

-- Show specific column
SELECT first_name, last_name, birth_date, age, age + 10
FROM employee_demographics ;

-- Show distint values
SELECT distinct	 gender, count(gender)
from employee_demographics
GROUP BY gender;

-- Show distint values combine two column
SELECT distinct	 first_name, gender
from employee_demographics;












