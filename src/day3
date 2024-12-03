Select Cast(id as varchar), Count(*) as count from ( 
SELECT 
	unnest(xpath('//food_item_id/text()',menu_data))::text::int as id
	FROM christmas_menus
	WHERE (xpath('//total_guests/text()',menu_data))[1]::text::int > 78 
		OR (xpath('//total_present/text()',menu_data))[1]::text::int > 78
		OR (xpath('//total_count/text()',menu_data))[1]::text::int > 78
	 ) 
	 GROUP BY id
	 Order by count desc Limit 1
