SELECT 
	production_date,
	toys_produced,
	prev AS previous_day_production,
	(toys_produced - prev) AS production_change,
	(((toys_produced-prev)/ Cast(prev AS float)) * 100.0) AS production_change_percentage
	FROM (
SELECT 
	LAG(toys_produced,1) OVER (ORDER BY production_date asc) AS prev,
	production_date, toys_produced
	FROM public.toy_production2
	)
	Order BY production_change_percentage DESC LIMIT 1