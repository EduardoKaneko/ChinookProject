SELECT LEFT(primary_poc, POSITION(' ' IN primary_poc)-1) AS first_name,
       RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) AS last_name,
       first_name || "." || last_name || "@" || name
FROM accounts



SELECT LEFT(primary_poc, POSITION(' ' IN primary_poc)-1) AS first_name,
       RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) AS last_name,
       LEFT(name, POSITION(' ' IN name)-1),
       LOWER(LEFT(primary_poc, POSITION(' ' IN primary_poc)-1)||'.'||RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' '))||'@'|| LEFT(name, POSITION(' ' IN name)-1)||'.com')
FROM accounts


------------


WITH t1 AS (
 SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
 FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com')
FROM t1;
