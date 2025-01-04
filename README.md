This homework was completed with the help of Xpert learning assistant for the lines of code below: 
SELECT e.last_name,
 		COUNT(e.emp_no) AS frequency_count
FROM employees AS e
GROUP BY e.last_name
ORDER BY frequency_count DESC;
