With Recursive hirachy(staff_id,direct_manager, manager_id,level) As (
	SELECT staff_id,manager_id as direct_manager, manager_id,1 as level FROM staff
	UNION 
	SELECT h.staff_id, h.direct_manager, s.manager_id,(h.level+1) As level
	FROM hirachy h, staff s
	Where s.staff_id = h.manager_id
)
Select 
	staff_id,
	level,
	COUNT(*) OVER w 
	FROM (
	Select 
		staff_id,
		max(level) as level,
		direct_manager
	FROM hirachy
	Group BY staff_id,direct_manager
) 
WINDOW w AS(Partition by direct_manager,level)
order by count desc,level desc, staff_id
