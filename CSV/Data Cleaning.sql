-- Data Cleaning

DROP TABLE IF EXISTS layoffs_staging;
DROP TABLE IF EXISTS layoffs_staging2;


SELECT *
FROM layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null VALUES or blank VALUES
-- 4. Remove Any Colmuns or rows 

CREATE TABLE layoffs_staging
LIKE layoffs;

INSERT layoffs_staging
SELECT *
FROM layoffs;

SELECT *
FROM  layoffs_staging;

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY 
company,location, industry,total_laid_off,percentage_laid_off,`date`,stage, country, funds_raised_millions)
AS row_num
FROM layoffs_staging;


-- Check Duplicates values
WITH duplicate_cte AS
(
SELECT *,
row_number() over(
partition by 
company,location, industry,total_laid_off,percentage_laid_off,`date`,stage, country, funds_raised_millions)
as row_num
from layoffs_staging
)
select *
from duplicate_cte
where row_num > 1;

-- delete error Duplicates values 
WITH duplicate_cte AS
(
SELECT *,
row_number() over(
partition by 
company,location, industry,total_laid_off,percentage_laid_off,`date`,stage, country, funds_raised_millions)
as row_num
from layoffs_staging
)
delete
from duplicate_cte
where row_num > 1;



SELECT *
FROM layoffs_staging
WHERE company = 'Casper';



CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select *
from layoffs_staging2;


insert into layoffs_staging2
select *,
row_number() over(
partition by 
company,location, industry,total_laid_off,percentage_laid_off,`date`,stage, country, funds_raised_millions)
as row_num
from layoffs_staging;

select *
from layoffs_staging2
where row_num > 1;

select *
from layoffs_staging2;

-- সেফ মোড অফ করা
SET SQL_SAFE_UPDATES = 0;

-- এখন ডিলিট কুয়েরিটি চালান
DELETE 
FROM layoffs_staging2
WHERE row_num > 1;

-- কাজ শেষ হলে আবার সেফ মোড অন করে দেওয়া ভালো
SET SQL_SAFE_UPDATES = 1;


-- Standardizing data 

select *
from layoffs_staging2;

select DISTINCT (trim(company))
from layoffs_staging2;

select company, (trim(company))
from layoffs_staging2;


update layoffs_staging2
set company = trim(company);

select DISTINCT industry
from layoffs_staging2
order by 1;

select *
from layoffs_staging2
WHERE industry like 'crypto%';

update layoffs_staging2
set industry  = 'crypto'
WHERE industry like 'crypto%';

select DISTINCT location
from layoffs_staging2
ORDER BY 1;

select DISTINCT country
from layoffs_staging2
ORDER BY 1;

select *
from layoffs_staging2
WHERE country like 'United States%';

update layoffs_staging2
set country = trim(trailing '.' from country)
WHERE country like 'United States%';

select `date`,
str_to_date(`date`,'%m/ %d/ %Y')
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date`,'%m/ %d/ %Y');

select `date`
from layoffs_staging2;

alter table layoffs_staging2
modify column `date` date;

select *
from layoffs_staging2;

select *
from layoffs_staging2
where total_laid_off is null;

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

update layoffs_staging2
set industry = null
where industry = '';

select *
from layoffs_staging2
where industry is null
or industry = '';

select *
from layoffs_staging2
where company = 'airbnb';

select *
from layoffs_staging2
where company like 'bally%';

select *
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
    and t1.location = t2.location
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

select t1.industry , t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
    and t1.location = t2.location
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

update layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
set  t1.industry = t2.industry
where t1.industry is null
and t2.industry is not null;

select *
from layoffs_staging2; 

-- delete the complete null data 

select *
from layoffs_staging2
WHERE total_laid_off is null 
and percentage_laid_off is null;

delete
from layoffs_staging2
WHERE total_laid_off is null 
and percentage_laid_off is null;

alter table layoffs_staging2
drop column row_num;
