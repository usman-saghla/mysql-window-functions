USE employees;

SELECT
emp_no,
salary,
ROW_NUMBER() OVER w AS row_num
FROM
salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

SELECT
emp_no,
salary,
RANK() OVER w AS rank_num
FROM
salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

SELECT
emp_no,
salary,
DENSE_RANK() OVER w AS rank_num
FROM
salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC); 

SELECT
    e.emp_no,
    RANK() OVER w as employee_salary_ranking,
    s.salary
FROM
employees e
JOIN
    salaries s ON s.emp_no = e.emp_no
WHERE e.emp_no BETWEEN 10500 AND 10600
WINDOW w as (PARTITION BY e.emp_no ORDER BY s.salary DESC);


SELECT
    e.emp_no,
    DENSE_RANK() OVER w as employee_salary_ranking,
    s.salary,
    e.hire_date,
    s.from_date,
    (YEAR(s.from_date) - YEAR(e.hire_date)) AS years_from_start
FROM
employees e
JOIN
    salaries s ON s.emp_no = e.emp_no
    AND YEAR(s.from_date) - YEAR(e.hire_date) >= 5
WHERE e.emp_no BETWEEN 10500 AND 10600
WINDOW w as (PARTITION BY e.emp_no ORDER BY s.salary DESC);