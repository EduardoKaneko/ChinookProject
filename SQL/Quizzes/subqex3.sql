/* Quem comprou mais papel standard? */

SELECT a.name account,
       SUM(o.standard_qty) standard,
       SUM(o.total) total
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;


/* Puxar todas as contas que compraram mais que ela,
no total */

SELECT a.name,
       SUM(o.total)
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY 1
HAVING SUM(o.total) > (SELECT total
                       FROM(SELECT a.name account,
                              SUM(o.standard_qty) standard,
                              SUM(o.total) total
                       FROM orders o
                       JOIN accounts a
                       ON o.account_id = a.id
                       GROUP BY 1
                       ORDER BY 2 DESC
                       LIMIT 1) s1);


/* Contando quantas empresa */

SELECT COUNT(*)
FROM
(SELECT a.name,
       SUM(o.total)
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY 1
HAVING SUM(o.total) > (SELECT total
                       FROM(SELECT a.name account,
                              SUM(o.standard_qty) standard,
                              SUM(o.total) total
                       FROM orders o
                       JOIN accounts a
                       ON o.account_id = a.id
                       GROUP BY 1
                       ORDER BY 2 DESC
                       LIMIT 1) s1)) s2;
