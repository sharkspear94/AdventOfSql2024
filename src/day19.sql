WITH salerys As(
	SELECT salary, year_end_performance_scores[array_upper(year_end_performance_scores, 1)] as last_score
		FROM employees
), avreges AS (
	SELECT 
		salary, 
		AVG(last_score) over(partition by 1) as avg,
		last_score
	FROM salerys
),salarys AS(
	SELECT 
		CASE WHEN last_score > avg 
			Then salary + salary * 0.15
			ELSE salary END 
		as salary
	FROM avreges)
Select SUM(salary) 
	From salarys