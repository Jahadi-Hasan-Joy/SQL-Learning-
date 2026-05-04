-- Data Cleaning

DROP TABLE IF EXISTS layoffs_staging;
DROP TABLE IF EXISTS layoffs_staging2;


SELECT *
FROM layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null VALUES or blank VALUES
-- 4. Remove Any Colmuns

CREATE TABLE layoffs_staging
LIKE layoffs;

INSERT layoffs_staging
SELECT *
FROM layoffs;

SELECT *
FROM  layoffs_staging;

select *,
row_number() over(
partition by 
company,location, industry,total_laid_off,percentage_laid_off,`date`,stage, country, funds_raised_millions)
as row_num
from layoffs_staging;


-- Check Duplicates values
with duplicate_cte as
(
select *,
row_number() over(
partition by 
company,location, industry,total_laid_off,percentage_laid_off,`date`,stage, country, funds_raised_millions)
as row_num
from layoffs_staging
)
select *
from duplicate_cte
where row_num > 1;


select *
from layoffs_staging
where company = 'Casper';


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










