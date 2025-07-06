-- Data Cleaning
-- Steps which will be followed:
-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null Values or Blank Values
-- 4. remove any Columns

-- Let's Create a Temporary staging
CREATE TABLE layoffs_staging like layoffs;
-- Inserting data into the temporary staging table
insert layoffs_staging select * from layoffs;
select * from layoffs_staging;
-- staging Successful

WITH duplicate_cte AS(
select *,ROW_NUMBER() OVER(
partition by company,location,industry,total_laid_off,percentage_laid_off,dateoflayoff,stage,country,funds_raised_millions) as row_num from layoffs_staging)
select * from duplicate_cte where row_num>1;

-- Creating another table for deleting the duplicates.
CREATE TABLE `layoffs_staging2`(
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` float DEFAULT NULL,
  `dateoflayoff` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `Row_Num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from layoffs_staging2;

INSERT INTO layoffs_staging2 
select *,ROW_NUMBER() OVER(
partition by company,location,industry,total_laid_off,percentage_laid_off,dateoflayoff,stage,country,funds_raised_millions) 
as row_num from layoffs_staging


-- SET SQL_SAFE_UPDATES = 0; ( optional to disable mysql safe mode)

select * FROM  layoffs_staging2;

-- Standardising data

select company, trim(company) from layoffs_staging2;

update layoffs_staging2 set company = trim(company);

update layoffs_staging2 set industry = "Crypto" where industry like 'Crypto%';

select distinct(country) from layoffs_staging2 order by 1;

select * from layoffs_staging2 where country like 'United States.';

update layoffs_staging2 set country = "United States" where country like 'United States%';

select dateoflayoff,str_to_date(dateoflayoff,'%m/%d/%Y') from layoffs_staging2;

update layoffs_staging2  set dateoflayoff = str_to_date(dateoflayoff,'%m/%d/%Y');

-- Removing null and missing values
update layoffs_staging2 set industry = NULL where industry='';

select * from layoffs_staging2 where industry is null ;

select * from layoffs_staging2 where company='Airbnb';

select t1.industry, t2.industry from layoffs_staging2 t1 join
layoffs_staging2 t2 on t1.company=t2.company where (t1.industry is null) and t2.industry is not null;

select * from layoffs_staging2 where industry is null ;

update layoffs_staging2 t1 join 
layoffs_staging2 t2 on t1.company=t2.company 
set t1.industry=t2.industry where (t1.industry is null) and t2.industry is not null;

select * from layoffs_staging2 where company='Bally%';

select * from layoffs_staging2 where percentage_laid_off is null and total_laid_off is null;

delete from layoffs_staging2 where percentage_laid_off is null and total_laid_off is null;

alter table layoffs_staging2 drop column Row_Num;
select * from layoffs_staging2;
-- Data successfully cleaned and is ready for EDA

