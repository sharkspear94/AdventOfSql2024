Select STRING_AGG(char,'' order by id) FROM (
	Select id , CHR(value) as char
		FROM letters_a
	UNION ALL
	SELECT (id + (Select COUNT(*) FROM letters_a)), CHR(value) as char
		FROM letters_b
	)
	WHERE char between 'a' AND 'z' OR char IN (' ','!','\"','','(',')','?',',','-','.',':',':')
