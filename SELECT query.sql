-- Show all from the table 
SELECT * FROM
Parks_and_Recreation.employee_demographics;

-- Show specific column
SELECT first_name,
last_name,
birth_date,
age,
age + 10
FROM Parks_and_Recreation.employee_demographics ;

-- Show distint values
SELECT distinct	 gender
from Parks_and_Recreation.employee_demographics;

-- Show distint values combine two column
SELECT distinct	 first_name, gender
from Parks_and_Recreation.employee_demographics;