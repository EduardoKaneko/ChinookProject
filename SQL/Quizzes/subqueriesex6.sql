/*
- Média dos pedidos
- Empresas que gastaram mais que a média
- Média das empresas que gastaram mais que a média
*/

SELECT avg(o.total_amt_usd) average
FROM accounts a
JOIN orders o
ON a.id = o.account_id


SELECT o.account_id,
       AVG(o.total_amt_usd) avg
FROM orders o
GROUP BY 1
HAVING AVG(o.total_amt_usd) > (SELECT avg(o.total_amt_usd) average
FROM accounts a
JOIN orders o
ON a.id = o.account_id)

SELECT AVG(avg)
FROM (SELECT o.account_id,
       AVG(o.total_amt_usd) avg
FROM orders o
GROUP BY 1
HAVING AVG(o.total_amt_usd) > (SELECT avg(o.total_amt_usd) average
FROM accounts a
JOIN orders o
ON a.id = o.account_id)) s1;
