With marked As(
	SELECT 
		id,
		LAG(id) OVER(w) as prev
	FROM sequence_table
	WINDOW w AS(Order by id)
)
Select id, prev,
	(SELECT array_agg(generate_series) FROM generate_series(prev+1,(id-1))) AS array 
	FROM marked
Where prev <> id-1