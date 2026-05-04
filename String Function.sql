-- String Function

SELECT length('Joy');

SELECT first_name, length(first_name)
FROM employee_demographics
ORDER BY length(first_name);

SELECT upper(first_name) 
FROM employee_demographics;

SELECT lower('JOY');
SELECT trim('         joy       '); -- left(ltrim) , right (rtrim) 

SELECT first_name, left(first_name,3) -- right() , will show 3 charecter from right side
FROM employee_demographics;

SELECT first_name,
substring(first_name,3,2),	-- start at 3rd position and show 2 character
substring(birth_date,6,2) as birth_month
FROM employee_demographics;

SELECT first_name, replace(first_name,'a','Z') as chane_name
FROM employee_demographics;

SELECT locate('y', 'joy');

SELECT first_name, locate('a',first_name) as found_at
FROM employee_demographics;


SELECT first_name,last_name,
concat(first_name,' ',last_name) as full_name
FROM employee_demographics;




























