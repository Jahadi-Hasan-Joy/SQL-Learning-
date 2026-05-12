-- Exploratory Data Analysis

select *
from layoffs_staging2;

select MAX(total_laid_off), MAX(percentage_laid_off)
from layoffs_staging2;

select *
from layoffs_staging2
WHERE percentage_laid_off = 1
order by total_laid_off desc;

select *
from layoffs_staging2
WHERE percentage_laid_off = 1
order by funds_raised_millions desc;

select company, SUM(total_laid_off)
from layoffs_staging2
GROUP BY company
order by 2 desc;

select min(`date`),max(`date`)
from layoffs_staging2;

select industry, SUM(total_laid_off)
from layoffs_staging2
GROUP BY industry
order by 2 desc;

select country, SUM(total_laid_off)
from layoffs_staging2
GROUP BY country
order by 2 desc;

select year(`date`) , SUM(total_laid_off)
from layoffs_staging2
GROUP BY year(`date`)
order by 1 desc;

select stage , SUM(total_laid_off)
from layoffs_staging2
GROUP BY stage 
order by 2 desc;


select substring(`date`,1,7) as `month`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`,1,7) is not null
GROUP BY `month`
order by 1 asc;

select *
from layoffs_staging2;

with rolling_total as
(
select substring(`date`,1,7) as `month`, sum(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`,1,7) is not null
GROUP BY `month`
order by 1 asc
)
select `month`,total_off, sum(total_off) over (order by  `month`) as rolling_total
from rolling_total;

select company, SUM(total_laid_off)
from layoffs_staging2
GROUP BY company
order by 2 desc;


select company,year(`date`), SUM(total_laid_off)
from layoffs_staging2
GROUP BY company,year(`date`)
order by 3 desc;



with company_year(company, years, total_laid_off) as
(
select company,year(`date`), SUM(total_laid_off)
from layoffs_staging2
GROUP BY company,year(`date`)
),
company_year_rank as
(
select *,DENSE_RANK() over(PARTITION BY years order by total_laid_off desc) as ranking
from company_year
where years is not null
)
select *
from company_year_rank
where ranking <= 5;
















