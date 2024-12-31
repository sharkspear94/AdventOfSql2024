--- exercise is not possible/faulty. There are entries which do not overlap.
--- Simply getting the highest start time was the correct time but still, technically incorrect
SELECT workshop_id, workshop_name, timezone,business_start_time,business_start_time + -t.utc_offset as begin,business_end_time, business_end_time + -t.utc_offset as end
	FROM public.workshops w
	Join pg_tImezone_names t ON w.timezone = t.name
	order by begin desc 
	Limit 1;