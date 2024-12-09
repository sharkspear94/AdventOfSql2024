SELECT name, ROUND(Max(speed),2)as speed 
FROM(
	SELECT r.reindeer_name as name,AVG(speed_record) as speed
		FROM training_sessions t
		JOIN reindeers r ON r.reindeer_id = t.reindeer_id
		Where r.reindeer_name <> 'Rudolph'
		Group BY r.reindeer_name, t.exercise_name
	)
GROUP BY name
	ORDER BY speed desc LIMIT 3