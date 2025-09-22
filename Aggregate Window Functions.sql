USE employees;

SELECT emp_no,
       salary,
       from_date,
       to_date
FROM (
    SELECT emp_no,
           salary,
           from_date,
           to_date,
           ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY from_date ASC) AS rn
    FROM salaries
) AS sub
WHERE rn = 1;


SELECT *
FROM dept_emp
WHERE from_date > '2000-01-01'
  AND to_date < '2002-01-01';
SELECT emp_no, dept_no, from_date, to_date,
       ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY from_date ASC) AS rn
FROM dept_emp
WHERE from_date > '2000-01-01'
  AND to_date < '2002-01-01';
SELECT d.emp_no, d.dept_no, s.salary, d.from_date, d.to_date
FROM (
    SELECT emp_no, dept_no, from_date, to_date,
           ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY from_date DESC) AS rn
    FROM dept_emp
    WHERE from_date > '2000-01-01'
      AND to_date < '2002-01-01'
) d
JOIN salaries s
  ON d.emp_no = s.emp_no
 AND s.from_date <= d.to_date
 AND s.to_date >= d.from_date
WHERE d.rn = 1;
SELECT emp_no,
       salary,
       dept_no,
       AVG(salary) OVER (PARTITION BY dept_no) AS average_salary_per_department
FROM (
    SELECT d.emp_no, d.dept_no, s.salary,
           ROW_NUMBER() OVER (PARTITION BY d.emp_no ORDER BY d.from_date DESC) AS rn
    FROM dept_emp d
    JOIN salaries s
      ON d.emp_no = s.emp_no
     AND s.from_date <= d.to_date
     AND s.to_date >= d.from_date
    WHERE d.from_date > '2000-01-01'
      AND d.to_date < '2002-01-01'
) sub
WHERE rn = 1;
