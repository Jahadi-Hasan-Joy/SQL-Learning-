-- Where Clause

select * 
from employee_salary
where first_name = 'Leslie';

select * 
from employee_salary
where salary <= 50000;


select *
from employee_demographics
where gender != 'female';

select *
from employee_demographics
where birth_date > '1985-07-26';




-- AND OR NOT -- Logical Operators

-- And
select *
from employee_demographics
where birth_date > '1985-01-01'
and gender = 'male';


-- OR
select *
from employee_demographics
where birth_date > '1985-01-01'
or gender = 'male';

-- NOT
select *
from employee_demographics
where birth_date > '1985-01-01'
or not gender = 'male';


-- order PRMDAS
-- OR
select *
from employee_demographics
where (first_name = 'Tom' and age = 36) or age > 60;


-- LIKE
select *
from employee_demographics
where first_name like 'a%'; 

 -- before the 'a%' have to match
 -- inside the '%a%' have to match
 -- after the '%a' have to match
 
select *
from employee_demographics
where first_name like 'a__'; 
 -- after the 'a__' have to 2 charecter

