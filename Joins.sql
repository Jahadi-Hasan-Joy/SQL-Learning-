-- Joins

select * 
from employee_demographics;

select *
from employee_salary;

select *
from parks_departments;

-- inner join
select * 
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
select dem.employee_id as empId,age, occupation
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id;

-- outer join

select *
from employee_demographics as dem
right join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
select *
from employee_demographics as dem
left join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
-- self join
select emp1.employee_id as emp_fuska, 
emp1. first_name as first_name
from employee_salary emp1
join employee_salary emp2
	on emp1.employee_id + 1 = emp2. employee_id;
    
-- multiple join 

select * 
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
inner join parks_departments pd
	on sal.dept_id = pd.department_id;






    