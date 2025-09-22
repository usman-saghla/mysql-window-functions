USE employees;

SELECT
emp_no,
    salary,
    LAG(salary) OVER w AS previous_salary,
    LEAD(salary) OVER w AS next_salary,
    salary - LAG(salary) OVER w AS diff_salary_current_previous,
LEAD(salary) OVER w - salary AS diff_salary_next_current
FROM
salaries
    WHERE salary > 80000 AND emp_no BETWEEN 10500 AND 10600
WINDOW w AS (PARTITION BY emp_no ORDER BY salary);


SELECT
emp_no,
    salary,
    LAG(salary) OVER w AS previous_salary,
LAG(salary, 2) OVER w AS 1_before_previous_salary,
LEAD(salary) OVER w AS next_salary,
    LEAD(salary, 2) OVER w AS 1_after_next_salary
FROM
salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)
LIMIT 1000;