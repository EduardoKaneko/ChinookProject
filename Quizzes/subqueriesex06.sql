/* Processo:
 - Média de todos os pedidos
 - Empresas que gastaram mais que a média
 - Média das empresas que gastaram mais que a média
 */

 SELECT AVG(o.total_amt_usd) avg_all
 FROM accounts a
 JOIN orders o
 ON o.account_id = a.id
----------
SELECT AVG(avg_amt)
FROM (SELECT o.account_id,
        AVG(o.total_amt_usd) avg_amt
FROM orders o
GROUP BY 1
HAVING AVG(o.total_amt_usd) > (SELECT AVG(o.total_amt_usd) avg_all
 FROM accounts a
 JOIN orders o
 ON o.account_id = a.id)) s1;
