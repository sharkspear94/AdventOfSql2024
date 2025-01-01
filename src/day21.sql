With quaters As (
	SELECT  
		ceil(date_part('month', sale_date) / 3) as quater,
		date_part('year',sale_date) as year, 
		Sum(amount) as sales
		FROM public.sales
		GROUP BY year,quater
)
SELECT
	*,
	((sales / LAG(sales,1) OVER (Order by year,quater)) -1 ) as growth_rate
FROM quaters
ORDER by growth_rate desc NULLS Last LIMIT 1


