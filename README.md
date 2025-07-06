# 🔍 Layoffs Data Cleaning & Exploratory Analysis with SQL

This project demonstrates how to clean and analyze a real-world layoffs dataset using only SQL. It follows a structured workflow from raw data to meaningful insights — ideal for showcasing data wrangling, EDA, and reporting skills without needing Python or Excel.

---

## 📁 Repository Contents

| File | Description |
|------|-------------|
| `layoffs.csv` | Raw dataset |
| `Data_Cleaning.sql` | SQL script to clean, standardize, and prepare the data |
| `EDA.sql` | SQL queries for exploratory data analysis (EDA) |
| `README.md` | Project summary and results |

---

## ⚙️ Tech Stack

- SQL (MySQL 8.0+)
- Any SQL GUI (MySQL Workbench / DBeaver / DB Visualizer)

---

## 🧼 Data Cleaning Summary (`Data_Cleaning.sql`)

1. **Removed Duplicates** using `ROW_NUMBER()`
2. **Standardized Fields** (e.g., trimming text, fixing country names)
3. **Formatted Dates** using `STR_TO_DATE()`
4. **Handled Nulls & Missing Values** by:
   - Inferring missing industries based on company
   - Deleting records with no layoff data
5. **Finalized Cleaned Table** for EDA

---

## 📊 EDA Summary (`EDA.sql`)

### 🔢 Key Stats:
- **Maximum Layoffs by a Company**:  
  `Meta` with **11,000+** layoffs
- **Maximum % Laid Off**:  
  Several companies laid off **100%** of their workforce
- **Date Range**:  
  From **March 2020** to **March 2023**

---

### 💼 Top Companies by Total Layoffs:
| Company | Total Laid Off |
|---------|----------------|
| Meta    | ~11,000        |
| Amazon  | ~10,000+       |
| Google  | ~10,000        |

---

### 🌍 Top Countries Affected:
| Country | Layoffs |
|---------|---------|
| United States | Highest |
| India, UK, Canada | Significant layoffs |

---

### 🏭 Layoffs by Industry:
| Industry | Total Layoffs |
|----------|---------------|
| Consumer | Highest overall |
| Crypto   | High in 2022 |
| Retail   | Increasing trend |

---

### 📅 Monthly & Cumulative Trends:

- **Monthly Layoffs** (2022-2023): Peaked in late 2022 and early 2023
- **Rolling Total**: Helped identify compounding effect over time

---

### 🏆 Top 5 Companies by Layoffs per Year

| Year | Top Companies (by Layoffs) |
|------|-----------------------------|
| 2022 | Meta, Amazon, Twitter, Google, Salesforce |
| 2023 | Amazon, Microsoft, Google, Dell, IBM |

---

## 📈 Insights You Can Build On

- Layoffs heavily correlate with tech industry downturn and funding freezes
- Crypto sector showed volatility with sudden mass layoffs
- Some startups that raised significant capital still laid off 100% of staff
- Trend shows mass layoffs occurred in bursts, not steady patterns

---

## ✅ Possible Extensions

You can expand this project by:
- Creating a **Power BI / Tableau Dashboard**
- Performing the same analysis in **Python (Pandas + SQLAlchemy)**
- Exporting cleaned data for **machine learning or forecasting**
- Adding **visuals** to the repo (charts/screenshots from SQL dashboards)

---

## 👤 Author

**Jinith Naik**  
📫 [LinkedIn](https://www.linkedin.com/in/jinithnaik) | 🌐 [Portfolio](https://jinith-naik-data-analyst-k8con8y.gamma.site/)

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).
