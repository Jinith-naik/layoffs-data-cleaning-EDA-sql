-- Exploratory Data Analysis ( EDA )
use layoffs_db;
select max(total_laid_off), max(percentage_laid_off) from layoffs_staging2;

Select * from layoffs_staging2 where percentage_laid_off = 1 order by funds_raised_millions DESC;

select company,sum(total_laid_off) from layoffs_staging2 group by company order by 2 desc;

select min(dateoflayoff), max(dateoflayoff) from layoffs_staging2;

select industry,sum(total_laid_off) from layoffs_staging2 group by industry order by 2 desc;

select country,sum(total_laid_off) from layoffs_staging2 group by country order by 2 desc;

select YEAR(dateoflayoff), sum(total_laid_off) from layoffs_staging2 group by Year(dateoflayoff) order by 1 desc;

select stage, sum(total_laid_off) from layoffs_staging2 group by stage order by 2 desc;

select industry,sum(funds_raised_millions) from layoffs_staging2 group by industry order by 2 desc;

select substring(dateoflayoff,1,7) as 'MONTH',sum(total_laid_off) from layoffs_staging2 where substring(dateoflayoff,1,7) is not null
group by MONTH order by 1 ASC ;

WITH rolling_sum AS (
    SELECT 
        SUBSTRING(dateoflayoff, 1, 7) AS month,
        SUM(total_laid_off) AS total_off
    FROM layoffs_staging2
    WHERE SUBSTRING(dateoflayoff, 1, 7) IS NOT NULL
    GROUP BY month
)
SELECT 
    month,
    SUM(total_off) OVER (ORDER BY month) AS rolling_total
FROM rolling_sum;


WITH company_year (company, years, total_laid_off) AS (
    SELECT 
        company, 
        YEAR(dateoflayoff), 
        SUM(total_laid_off) 
    FROM layoffs_staging2
    GROUP BY company, YEAR(dateoflayoff)
),
ranked_companies AS (
    SELECT 
        company,
        years,
        total_laid_off,
        DENSE_RANK() OVER (
            PARTITION BY years 
            ORDER BY total_laid_off DESC
        ) AS ranking
    FROM company_year 
    WHERE years IS NOT NULL
)
SELECT *
FROM ranked_companies
WHERE ranking <= 5;









