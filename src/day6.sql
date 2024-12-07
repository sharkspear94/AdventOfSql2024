SELECT
	c.name
	FROM gifts as g
	JOIN children as c on c.child_id = g.child_id
	WHERE g.price > (SELECT Avg(price) FROM gifts)
	Order by g.price LIMIT 1
