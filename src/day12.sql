WITH v1 (gift_id,cnt) as (
	SELECT gift_id, COUNT(*) as cnt FROM gift_requests
	GROUP BY gift_id
) 
SELECT g.gift_name,
	percent_rank() over w as per
FROM v1 v
JOIN gifts g on v.gift_id = g.gift_id
WINDOW w as (order by cnt)
ORDER by per desc, gift_name
