CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);
CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
	PRIMARY KEY (emp_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (dept_no, emp_no)
)

Select e.emp_no,
		e.last_name,
		e.first_name,
		e.sex,
		s.salary
From employees as e
	left join salaries as s
	On (e.emp_no = s.emp_no)
Order by e.emp_no;

Select e.first_name,
		e.last_name,
		e.hire_date
FROM employees as e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;

SELECT d.dept_no,
       d.dept_name,
       dm.emp_no,
       e.last_name,
       e.first_name
FROM dept_manager as dm
JOIN departments as d ON dm.dept_no = d.dept_no
JOIN employees as e ON dm.emp_no = e.emp_no;

Select d.dept_no,
		e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
FROM dept_emp as de
JOIN departments as d on de.dept_no = d.dept_no
JOIN employees as e on de.emp_no = e.emp_no;

Select e.first_name,
		e.last_name,
		e.sex
From employees as e
Where e.first_name = 'Hercules' and e.last_name LIKE 'B%';

SELECT e.emp_no,
    	e.last_name,
   	 	e.first_name,
		d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

SELECT e.emp_no,
    	e.last_name,
   	 	e.first_name,
		d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' or d.dept_name= 'Development';

SELECT e.last_name,
 		COUNT(e.emp_no) AS frequency_count
FROM employees AS e
GROUP BY e.last_name
ORDER BY frequency_count DESC;
