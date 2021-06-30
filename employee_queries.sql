-- 1. Listing the following details of each employee: 
--    employee number, last name, first name, sex, and salary. 
-- 0. Checking/testing all the tables imported correctly
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;

-- 1. Listing the following details of each employee: 
--    employee number, last name, first name, sex, and salary. 
SELECT employees.emp_no, employees.last_name, employees.first_name, sex, salaries.salary
FROM employees, salaries
WHERE salaries.emp_no = employees.emp_no;
-- 2. Listing first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE extract(YEAR FROM employees.hire_date) = 1986;
-- 3. Listing the manager of each department with the following information: 
--    department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments, dept_manager, employees
WHERE departments.dept_no = dept_manager.dept_no AND dept_manager.emp_no = employees.emp_no;

-- 4. Listing the department of each employee with the following information: 
--    employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no
FROM employees, departments, dept_emp
WHERE employees.emp_no = dept_emp.emp_no AND dept_emp.dept_no = departments.dept_no;

-- 5. Listing first name, last name, and sex for employees whose
--    first name is "Hercules" and last names begin with "B." 
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name like 'B%' ;

-- 6. Listing/quering all employees in the Sales department, including their 
--    employee number, last name, first name, and department name. 
SELECT employees.last_name, employees.first_name, departments.dept_name 
FROM employees, departments, dept_emp
WHERE employees.emp_no = dept_emp.emp_no
AND dept_emp.dept_no = departments.dept_no
AND departments.dept_name = 'Sales';

-- 7. Listing all employees in the Sales and Development departments, including their 
--    employee number, last name, first name, and department name 

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees, departments, dept_emp
WHERE employees.emp_no = dept_emp.emp_no
AND   dept_emp.dept_no = departments.dept_no
AND   departments.dept_name in ('Sales', 'Development');



-- 8. In descending order, list the frequency count of 
--    employee last names, i.e., how many employees share each last name.

SELECT employees.last_name, COUNT(employees.last_name)
FROM employees
GROUP BY employees.last_name
ORDER BY COUNT(employees.last_name)DESC ;

























