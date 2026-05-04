-- Temporary Table

CREATE TEMPORARY TABLE temp_table
(first_name VARCHAR(50),
last_name VARCHAR(50),
favorite_movie VARCHAR(100)
);

INSERT INTO temp_table
VALUES('Alex','dim', 'tutu');

SELECT *
FROM temp_table;

select *
from employee_salary;

CREATE TEMPORARY TABLE salary_over_50k   -- auto  delete when  the season is end
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM salary_over_50k;












