SELECT song_title, COUNT(*) as total_plays, Count(CASE WHEN skipped Then 1 End) as skipped_song FROM (
SELECT 
	p.song_id, 
	s.song_title,
	CASE WHEN duration = song_duration THEN false
		WHEN duration IS NOT NULL AND song_duration IS NULL THEN false
		ELSE true 
	END AS skipped 
	FROM user_plays p
	JOIN songs s ON s.song_id = p.song_id
)	
GROUP BY song_title
ORDER BY total_plays desc, skipped_song LIMIT 1