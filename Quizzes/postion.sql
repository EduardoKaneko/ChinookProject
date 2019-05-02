SELECT LEFT(name, POSITION(' ' IN name) - 1) AS first_name,
       RIGHT(name, LENGTH(name) - STRPOS(name, ' ')) AS last_name
FROM sales_reps
