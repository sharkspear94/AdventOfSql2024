SELECT COUNT(*)
	FROM public.elves
	WHERE skills ~ '(^|,)SQL($|,)'