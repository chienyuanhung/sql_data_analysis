--employee number, last name, first name, gender, and salary
SELECT e.emp_no, e.first_name, e.last_name, e.gender,  s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

--List employees who were hired in 1986
SELECT first_name, last_name
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each departmen, department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, 
         de.from_date, de.to_date
FROM dept_manager m
JOIN departments d
ON m.dept_no = d.dept_no
JOIN employees e
ON m.emp_no = e.emp_no
JOIN dept_emp de
ON m.emp_no = de.emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments d
JOIN dept_emp de
ON d.dept_no = de.dept_no
JOIN employees e 
ON de.emp_no = e.emp_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no, last_name, first_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department,
--employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List all employees in the Sales and Development departments
--employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;