USE employees;

SELECT emp_no, salary, 
ROW_NUMBER() OVER(partition by emp_no ORDER BY salary DESC) AS row_num
FROM salaries;


SELECT
    emp_no,
    dept_no,
    ROW_NUMBER() OVER (ORDER BY emp_no) AS row_num
FROM
dept_manager;

SELECT emp_no, first_name, last_name,
ROW_NUMBER() OVER(PARTITION BY first_name ORDER BY last_name) AS row_num
FROM employees;

SELECT
emp_no,
first_name,
ROW_NUMBER() OVER w AS row_num
FROM
employees
WINDOW w AS (PARTITION BY first_name ORDER BY emp_no);


SELECT a.emp_no,
       MIN(salary) AS min_salary FROM (
SELECT
emp_no, salary, ROW_NUMBER() OVER w AS row_num
FROM
salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)) a
GROUP BY emp_no;

