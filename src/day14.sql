WITH receipts (color,garment,drop_off) AS (
	SELECT 
		el ->> 'color' as color,
		el ->> 'garment'as  garment,
		(el ->> 'drop_off')::date as drop_off 
		FROM (
		SELECT jsonb_array_elements (cleaning_receipts) as el FROM santarecords
	) 
)
SELECT drop_off FROM receipts
WHERE color = 'green' AND garment = 'suit' 
ORDER BY drop_off desc
