/* As 10 contas que mais gastaram */

SELECT a.id id,
       a.name account,
       SUM(o.total_amt_usd) spent
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.id, a.name
ORDER BY 3 DESC
LIMIT 10;

SELECT AVG(spent)
FROM (SELECT a.id id,
       a.name account,
       SUM(o.total_amt_usd) spent
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.id, a.name
ORDER BY 3 DESC
LIMIT 10) top;
