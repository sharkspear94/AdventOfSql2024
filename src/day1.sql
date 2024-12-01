SELECT 
	c.name,
	w.wishes->>'first_choice' AS primary_wish, 
	w.wishes->>'second_choice' AS backup_wish,
	w.wishes->'colors'->>0 as fav_color,
	json_array_length(w.wishes->'colors') as count,
	CASE 
		WHEN t.difficulty_to_make = 1 THEN 'Simple Gift'
		WHEN t.difficulty_to_make = 2 THEN 'Moderate Gift'
		ELSE 'Complex Gift'
	END	AS gift_complexity,
	CASE 
		WHEN t.category = 'outdoor' THEN 'Outside Workshop'
		WHEN t.category = 'educational' THEN 'Learning Workshop'
		ELSE 'General Workshop'
	END	AS workshop_assignment
FROM wish_lists AS w
JOIN children AS c ON c.child_id = w.child_id 
JOIN toy_catalogue AS t ON t.toy_name = w.wishes->>'first_choice'
ORDER BY c.name ASC LIMIT 5;
