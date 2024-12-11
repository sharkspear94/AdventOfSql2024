SELECT date, 
	SUM(quantity) FILTER (Where drink_name = 'Hot Cocoa') AS HotCocoa,
	SUM(quantity) FILTER (Where drink_name = 'Peppermint Schnapps') AS PeppermintSchnapps,
	SUM(quantity) FILTER (Where drink_name = 'Eggnog') AS Eggnog
	FROM public.drinks
	GROUP BY date
	ORDER by HotCocoa