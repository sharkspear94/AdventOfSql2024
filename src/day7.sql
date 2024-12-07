SELECT 
	DISTINCT
	first_value(elf_id) OVER (w_years) AS min_years_experience_elf_id,
	first_value(elf_id) OVER (w_t) AS max_years_experience_elf_id,
	primary_skill AS shared_skill 
FROM workshop_elves
	WINDOW 
	w_years AS (Partition BY primary_skill ORDER BY years_experience, elf_id),
	w_t AS (Partition BY primary_skill ORDER BY years_experience DESC, elf_id)
	ORDER BY primary_skill