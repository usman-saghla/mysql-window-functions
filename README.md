# MySQL Window Functions Tutorial

This repository contains SQL scripts that demonstrate how to use **window functions** in MySQL 8+.  
Window functions let you perform advanced analytics—like ranking, running totals, moving averages, and comparisons—while still keeping row-level detail.

The examples are based on the classic **employees sample database**.

---

## 📂 Repository Structure

- **Aggregate Window Functions.sql**  
  Examples of using aggregate functions (`SUM`, `AVG`, `COUNT`, etc.) as window functions.  
  Includes running totals, departmental averages, and filtering with `ROW_NUMBER()`.

- **Window Functions - ROW NUM().sql**  
  Demonstrates `ROW_NUMBER()` to uniquely rank rows within partitions (e.g., first contract, latest salary).  

- **RANK() and DENSE RANK().sql**  
  Shows how to assign ranking to rows (`RANK`, `DENSE_RANK`) and the difference between them.  

- **LAG() and LEAD().sql**  
  Examples of comparing values across rows—like finding salary differences between consecutive contracts.  

---

## 🚀 How to Use

1. Install [MySQL 8+](https://dev.mysql.com/downloads/mysql/).  
2. Load the [Employees Sample Database](https://dev.mysql.com/doc/employee/en/).  
3. Clone this repository:
   ```bash
   git clone https://github.com/your-username/mysql-window-functions-tutorial.git
   cd mysql-window-functions-tutorial
