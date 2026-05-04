-- Limit and  Aliasing

select *
from employee_demographics
order by age desc
limit 2,3;


-- Aliasing
select gender, avg(age)  as avg_age
from employee_demographics
group by gender ;