WITH test AS (
	SELECT 
		field_name as name,
		CASE 
			WHEN season = 'Spring' THEN 1
			WHEN season = 'Summer' THEN 2
			WHEN season = 'Fall' Then 3
			ELSE 4
		End as season , 
		trees_harvested 
	FROM public.treeharvests
) Select name, season, trees_harvested, ROUND( AVG(trees_harvested) Over w,2) as three_season_moving_avg  FROM test
WINDOW w AS (PARTITION BY name ORDER by season Rows BETWEEN 2 PRECEDING AND CURRENT ROW )
ORDER BY  three_season_moving_avg DESC