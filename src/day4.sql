	SELECT  
		toy_id,
		(SELECT COUNT(*) FROM (
			SELECT unnest(new_tags)
			EXCEPT
			SELECT unnest(previous_tags)
		)) AS added_tags,
		(SELECT COUNT(*) FROM (
			SELECT unnest(previous_tags)
			INTERSECT
			SELECT unnest(new_tags)
		)) AS unchanged_tags,
		(SELECT COUNT(*) FROM (
			SELECT unnest(previous_tags)
			EXCEPT
			SELECT unnest(new_tags)
		)) AS removed_tags
		FROM toy_production t
		Order By added_tags desc LIMIT 1
