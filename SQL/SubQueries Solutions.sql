USE FreeCodeCamp
-- Find NAMES of all employees who have sold OVER 50,000 IN AVERAGE
SELECT 
	employee.first_name,
	employee.last_name,
	TotalSales
	FROM employee 
	JOIN (SELECT 
		TotalSales,  -- a
		emp_id
		FROM (SELECT
			SUM(total_sales) AS TotalSales, -- a
			works_with.emp_id
			FROM works_with
			GROUP BY emp_id) AS query
		WHERE TotalSales > 50000)
	AS test -- b
	ON employee.emp_id = test.emp_id -- b

-- Find all clients who are handled by the branch that Michael Scott manages
-- Assume you know Michael's ID

SELECT 
	client.client_name
	FROM client
	WHERE client.branch_id = 
			(SELECT -->ranch that Michael Scott manages
			branch.branch_id
			FROM branch
			WHERE branch.mgr_id = 102);

-- Find all clients who are handles by the branch that Michael Scott manages
-- Assume you DONT'T know Michael's ID

SELECT 
	client.client_name
	FROM client
	WHERE client.branch_id = 
			(SELECT -->ranch that Michael Scott manages
			branch.branch_id
			FROM branch
			WHERE branch.mgr_id = 
				(SELECT 
				employee.emp_id
				FROM employee
				WHERE employee.last_name = 'Scott' AND employee.first_name = 'Michael'));
-- Find the names of employees who work with clients handled by the scranton branch
 SELECT		
	employee.first_name,
	employee.last_name
	FROM employee
	WHERE (SELECT 
	branch.branch_id
	FROM branch
	WHERE branch.branch_name = 'Scranton') = employee.branch_id --> 2

-- Find the names of all clients who have spent more than 100,000 dollars
SELECT
	client.client_id,
	client.client_name,
	TotalSales
	FROM client
	JOIN (SELECT 
		works_with.client_id as test,
		SUM(total_sales) AS TotalSales
		FROM works_with
		GROUP BY works_with.client_id) AS qwerty ON qwerty.test = client.client_id
	WHERE TotalSales > 50000
	
