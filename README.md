# 🚀 Layoffs Data Cleaning with SQL

This project focuses on cleaning and preprocessing a real-world layoffs dataset using SQL. It follows a structured ETL (Extract, Transform, Load) approach to ensure data quality for further analysis or visualization.

---

## 📁 Files in this Repo

- `layoffs.csv`: Raw dataset containing global layoffs information (company, location, date, etc.)
- `Data_Cleaning.sql`: SQL script for cleaning the dataset — removing duplicates, handling nulls, standardizing values, and preparing for EDA (exploratory data analysis)

---

## 🛠️ Tech Stack

- **SQL** (MySQL syntax)
- **DBMS**: Compatible with MySQL 8.0 or any system supporting `ROW_NUMBER()` and CTEs
- Optional: Import `.csv` to your DBMS using MySQL Workbench or CLI

---

## 🔍 Data Cleaning Steps

1. **Staging Table Creation**
   - Create a temporary copy of the original dataset.

2. **Remove Duplicates**
   - Use `ROW_NUMBER()` with `PARTITION BY` to detect duplicates.

3. **Standardization**
   - Trimming white spaces
   - Fixing inconsistent values like "United States." ➝ "United States"
   - Date formatting using `STR_TO_DATE()`

4. **Null and Missing Values**
   - Replacing empty strings with NULLs
   - Inferring missing values (like industry) using self-joins
   - Deleting rows with critical missing data

5. **Final Cleanup**
   - Dropping helper columns
   - Cleaned data is ready for analysis

---

## 📊 Sample Use Cases After Cleaning

Once cleaned, this data can be used for:
- Time series analysis of layoff trends
- Industry-wise layoff aggregation
- Country/region impact assessments
- Dashboard creation (Power BI / Tableau)

---

## 🧠 What You Learn

- Real-world SQL data cleaning techniques
- Handling messy data efficiently
- Writing readable and modular SQL scripts
- Using CTEs, window functions, joins, and update/delete queries

---

## ✅ To Do / Add Next

Here are some ideas to take this project further:

- 📈 Perform EDA on the cleaned data (in Python or SQL)
- 📊 Create a dashboard (Power BI or Tableau)
- 🔁 Automate data cleaning using a Python + SQL workflow
- 📄 Add a Jupyter Notebook/Markdown report showing before vs after cleaning snapshots
- 📂 Add a `requirements.txt` or `README_process.md` for setup instructions if using Python

---

## 👤 Author

**Jinith Naik**  
📫 [LinkedIn](https://www.linkedin.com/in/jinithnaik) | 🌐 [Portfolio](https://jinith-naik-data-analyst-k8con8y.gamma.site/)

---

## 📜 License

This project is open-source and available under the [MIT License](LICENSE).

