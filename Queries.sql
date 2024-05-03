SELECT * FROM department

SELECT * FROM dept_emp

SELECT * FROM dept_manager

SELECT * FROM employees

SELECT * FROM salaries

SELECT * FROM titles

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees join salaries on employees.emp_no = salaries.emp_no

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date between '1986-01-01' and '1986-12-31'
ORDER BY last_name

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.dept_no, department.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN department ON dept_manager.dept_no = department.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no
ORDER BY dept_manager.dept_no ASC;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT department.dept_no, employees.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM department
INNER JOIN dept_emp ON department.dept_no=dept_emp.dept_no
INNER JOIN employees ON employees.emp_no=dept_emp.emp_no
Order by employees.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE (employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%')
Order by employees.last_name;

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.emp_no, employees.last_name, employees.first_name
From employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN department ON dept_emp.dept_no = department.dept_no
INNER JOIN titles ON employees.emp_title_id = titles.title_id
Where (department.dept_name = 'Sales')
Order by employees.emp_no;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, department.dept_name
From employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN department ON dept_emp.dept_no = department.dept_no
INNER JOIN titles ON employees.emp_title_id = titles.title_id
Where (department.dept_name = 'Sales' OR department.dept_name = 'Development' )
Order by employees.emp_no;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT count(employees.last_name), employees.last_name
FROM employees
GROUP BY employees.last_name
ORDER BY employees.last_name DESC;
