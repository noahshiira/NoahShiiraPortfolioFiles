-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2
;

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
# ORDER BY total_laid_off DESC
ORDER BY funds_raised_millions DESC
;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY SUM(total_laid_off) DESC
;

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;
# when the pandemic started till about 3 years after

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY SUM(total_laid_off) DESC;

SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY SUM(total_laid_off) DESC;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY YEAR(`date`) DESC;

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY SUM(total_laid_off) DESC;

##############

SELECT *
FROM layoffs_staging2;

-- rolling sum of layoffs

SELECT SUBSTRING(`date`, 1, 7) AS `month`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `month`
ORDER BY `month` ASC
;

WITH rolling_total AS 
(
SELECT SUBSTRING(`date`, 1, 7) AS `month`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `month`
ORDER BY `month` ASC
)
SELECT `month`, 
total_off,
SUM(total_off) OVER(ORDER BY `month`) AS rolling_total_off
FROM rolling_total;


############

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY SUM(total_laid_off) DESC
;

SELECT company, YEAR(`date`) AS 'year', SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY SUM(total_laid_off) DESC 
;

WITH company_year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`) AS 'year', SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), 
company_year_rank AS
(
SELECT *, 
DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS RANKING
FROM company_year
WHERE years IS NOT NULL
)
SELECT *
FROM company_year_rank
WHERE ranking <= 5
ORDER BY years
;


