/* PART 01 - DISTINCT */

SELECT DISTINCT a.name account, r.name region
FROM account a
JOIN region r
ON a.region_id = r.id
ORDER BY r.name

/*
DISTINCT:
- Usamos distinct para consultar valores únicos na
tabela, assim como "unique" em python.
*/

/* PART 02 - HAVING */

SELECT a.name, SUM(total_amt_usd) AS total
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY a.name
HAVING SUM(total_amt_usd) < 1000
ORDER BY total
LIMIT 1;

/*
HAVING
usamos HAVING para filtrar uma consulta que foi agregada.
Qualquer momento em que precisarmos usar WHERE para uma consulta que
foi agregada, teremos que usar HAVING
*/
