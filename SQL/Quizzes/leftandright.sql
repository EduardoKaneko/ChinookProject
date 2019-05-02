SELECT a.name company,
       LEFT(a.name, 1) AS first_letter
FROM accounts a
GROUP BY 1
ORDER BY 2;

SELECT LEFT(a.name, 1) AS first_letter,
       COUNT(*) num_companies
FROM accounts a
GROUP BY 1
ORDER BY 2;
