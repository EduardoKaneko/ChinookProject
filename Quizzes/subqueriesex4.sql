/* Puxando cliente que mais gastou */

SELECT a.name,
       SUM(o.total_amt_usd) spent
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

/* Quantos web_events ele teve por canal? */

SELECT a.name,
       w.channel,
       COUNT(*)
FROM web_events w
JOIN accounts a
ON w.account_id = a.id AND a.id = (SELECT id
FROM (
    SELECT a.id,
           a.name,
           SUM(o.total_amt_usd) spent
    FROM orders o
    JOIN accounts a
    ON o.account_id = a.id
    GROUP BY 1,2
    ORDER BY 3 DESC
    LIMIT 1) s1)
GROUP BY 1,2
ORDER BY 3 DESC;
