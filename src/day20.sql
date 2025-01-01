
With query_parts AS (
	SELECT url, unnest(regexp_split_to_array(split_part(url ,'?',2),'&')) as query_pair
		FROM web_requests
		Where url like '%utm_source=advent-of-sql%'
), keys AS (
	Select url, split_part(query_pair,'=',1) as key FROM query_parts
)

SELECT url, Count(distinct key) FROM keys
Group by url
Order by Count , url
