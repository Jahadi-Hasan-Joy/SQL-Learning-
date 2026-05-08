-- Where Clause

SELECT * 
FROM employee_salary
WHERE first_name = 'Leslie';

SELECT * 
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM employee_demographics
WHERE gender != 'female';

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01';


-- AND OR NOT -- Logical Operators

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01' AND gender = 'male';

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01' OR gender = 'male';

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01' AND NOT gender = 'male';

SELECT *
FROM employee_demographics
WHERE (first_name = 'Tom' AND age = 36) OR age > 60;


-- LIKE
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%'; 

 -- before the 'a%' have to match
 -- inside the '%a%' have to match
 -- after the '%a' have to match
 
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__'; 
 -- after the 'a__' have to 2 charecter
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__%';
