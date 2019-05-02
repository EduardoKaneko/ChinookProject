/* Ex. 1:
 - Nome de sales rep (sales)
 - Por região (region)
 - Com o total usd (orders)
*/

SELECT s.name sales_rep,
       r.name region,
       SUM(total_amt_usd)
FROM orders o
JOIN accounts a
ON o.account_id = a.id
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON s.region_id = r.id
GROUP BY 1, 2
ORDER BY 3 DESC;
---------------------------
SELECT MAX(total_usd)
FROM
    (SELECT r.name region,
            SUM(total_amt_usd) total_usd
    FROM orders o
    JOIN accounts a
    ON o.account_id = a.id
    JOIN sales_reps s
    ON a.sales_rep_id = s.id
    JOIN region r
    ON s.region_id = r.id
    GROUP BY 1) s1
----------------------------

SELECT r.name, COUNT(o.total) total_orders
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
JOIN region r
ON s.region_id = r.id
GROUP BY r.name
HAVING SUM(o.total_amt_usd) = (
    SELECT MAX(total_usd)
    FROM
        (SELECT r.name region,
                SUM(total_amt_usd) total_usd
        FROM orders o
        JOIN accounts a
        ON o.account_id = a.id
        JOIN sales_reps s
        ON a.sales_rep_id = s.id
        JOIN region r
        ON s.region_id = r.id
        GROUP BY 1) s1);

----------------
