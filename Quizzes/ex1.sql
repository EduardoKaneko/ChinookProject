WITH email AS(
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ')-1) AS first_name,
       RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) AS last_name,
       name
FROM accounts)

SELECT first_name,
       last_name,
       LOWER(CONCAT(first_name, '.', last_name, '@', REPLACE(name, ' ',''), '.com')),
       (LEFT(LOWER(first_name), 1) || RIGHT(LOWER(first_name), 1) || LEFT(LOWER(last_name), 1) || RIGHT(LOWER(last_name), 1) || REPLACE(UPPER(name), ' ', '')) AS password
FROM email

- Criando senhas -
