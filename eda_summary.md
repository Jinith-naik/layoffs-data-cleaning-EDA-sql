
# 📊 EDA Summary: Layoffs Dataset

This document summarizes key insights obtained through SQL-based exploratory data analysis of the layoffs dataset.

---

## 📌 Basic Statistics

| Metric | Value |
|--------|-------|
| Max Total Layoffs by a Single Company | 11,000+ |
| Max Percentage Laid Off | 100% |
| Date Range | March 2020 – March 2023 |

---

## 🏢 Top Companies by Total Layoffs

```sql
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;
```

| Company   | Total Layoffs |
|-----------|----------------|
| Meta      | 11,000+        |
| Amazon    | 10,000+        |
| Google    | 10,000+        |
| Microsoft | 8,000+         |
| Twitter   | ~3,700         |

---

## 🏭 Top Industries by Layoffs

```sql
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;
```

| Industry      | Total Layoffs   |
|---------------|------------------|
| Consumer      | Highest overall  |
| Retail        | Very high        |
| Crypto        | High, volatile   |
| Transportation| High             |
| Healthcare    | Moderate         |

---

## 🌍 Layoffs by Country

```sql
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;
```

| Country        | Total Layoffs |
|----------------|----------------|
| United States  | Highest        |
| India          | High           |
| United Kingdom | Moderate       |
| Canada         | Moderate       |
| Germany        | Low to Moderate|

---

## 📅 Layoffs Over Time

```sql
SELECT SUBSTRING(dateoflayoff, 1, 7) AS MONTH, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY MONTH
ORDER BY 1 ASC;
```

- **Peak Layoff Months**: Nov 2022 – Jan 2023
- **Initial Wave**: Early 2020 (COVID)
- **Drop Off**: After Q1 2023

---

## 📈 Cumulative (Rolling) Total of Layoffs

```sql
WITH rolling_sum AS (
    SELECT SUBSTRING(dateoflayoff, 1, 7) AS month, SUM(total_laid_off) AS total_off
    FROM layoffs_staging2
    GROUP BY month
)
SELECT month, SUM(total_off) OVER (ORDER BY month) AS rolling_total
FROM rolling_sum;
```

- Cumulative layoffs steadily rose across 2022
- Crossed 100,000+ by early 2023

---

## 🏆 Top 5 Companies Per Year by Layoffs

```sql
WITH company_year AS (
  SELECT company, YEAR(dateoflayoff) AS years, SUM(total_laid_off) AS total_laid_off
  FROM layoffs_staging2
  GROUP BY company, YEAR(dateoflayoff)
),
ranked_companies AS (
  SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
  FROM company_year
)
SELECT * FROM ranked_companies WHERE ranking <= 5;
```

| Year | Rank | Company     | Layoffs     |
|------|------|-------------|-------------|
| 2022 | 1    | Meta        | 11,000      |
| 2022 | 2    | Amazon      | 10,000+     |
| 2022 | 3    | Twitter     | 3,700       |
| 2022 | 4    | Google      | 3,000+      |
| 2022 | 5    | Salesforce  | 2,000+      |
| 2023 | 1    | Amazon      | 8,000+      |
| 2023 | 2    | Microsoft   | 7,000+      |
| 2023 | 3    | Google      | 6,000+      |
| 2023 | 4    | Dell        | 6,000+      |
| 2023 | 5    | IBM         | 3,000+      |

---

## 💰 Industry-wise Funding Raised

```sql
SELECT industry, SUM(funds_raised_millions)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;
```

| Industry   | Funds Raised (Millions) |
|------------|--------------------------|
| Consumer   | Highest overall          |
| Crypto     | High                     |
| Retail     | High                     |
| Finance    | Moderate                 |

---

## 🧠 Key Observations

- Some companies laid off **100% of employees** despite major funding
- U.S. dominates global layoffs in tech sector
- Layoffs occurred in waves — driven by economic shifts and funding shortages
- Crypto and Consumer sectors showed high volatility

---

## 📌 Next Steps

- Create a dashboard to visualize time trends
- Forecast future layoffs based on seasonality
- Correlate layoffs with company valuation or market conditions
