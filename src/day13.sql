WITH emails(mail) AS ( 
	SELECT unnest(email_addresses) FROM contact_list
),domains (domain) AS (Select split_part(mail,'@',2) from emails)
SELECT domain , COUNT(*) AS cnt  FROM domains
	GROUP BY domain
	ORDER BY cnt desc, domain 