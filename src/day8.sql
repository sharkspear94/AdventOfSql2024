With RECURSIVE hirarchy (staff_id, level, manager_id) AS (
		SELECT staff_id,  1 AS level, manager_id 
		FROM staff
	UNION ALL 
		SELECT h.staff_id, (h.level + 1), s.manager_id
		FROM hirarchy h, staff s
		WHERE s.staff_id = h.manager_id
)
SELECT Max(level) FROM hirarchy