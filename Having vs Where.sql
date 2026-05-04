-- Having vs Where
select gender, avg(age)
from employee_demographics
where avg(age)>40
group by gender;	-- error 

select gender, avg(age)
from employee_demographics
group by gender			-- having work after the group by, use as  aggregate function 
having avg(age)>40;

select occupation, avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary)>75000;

