-- Deliverable 1.1
SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
Into Retirement_titles
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND to_date= ('9999-01-01')
ORDER BY emp_no;

--Deliverable 1.2
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO Unique_titles
FROM Retirement_titles
WHERE to_date= ('9999-01-01')
ORDER BY emp_no ASC, to_date DESC;

--Deliverable 1.3 
-- Employee count by department number
SELECT COUNT(emp_no) AS count, title 
INTO retiring_titles
FROM Unique_titles
GROUP BY title
ORDER BY count desc;


--DELIVERABLE 2
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
Into mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (de.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND de.to_date= ('9999-01-01')
ORDER BY emp_no;

--Deliverable 3
--Finding the total count of employees getting ready to retire
SELECT SUM(count)Total_Retiring_Employees
INTO total_retiring_employees
FROM retiring_titles

SELECT * FROM total_retiring_employees;

---Finding the total count of employees eligible for the mentorship program
-- Employee count by department number
SELECT COUNT(emp_no) AS count, title 
INTO mentorship_count
FROM mentorship_eligibility
GROUP BY title
ORDER BY count desc;
SELECT SUM(count)total_mentorship
INTO total_mentorship
FROM mentorship_count

-- Employees Membership count by department number
SELECT COUNT(emp_no) AS count, title 
INTO membership_eligibility_by_dept
FROM mentorship_eligibility
GROUP BY title
ORDER BY count desc;

SELECT * FROM retiring_titles;
