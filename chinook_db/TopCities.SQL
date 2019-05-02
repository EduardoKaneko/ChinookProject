WITH cities AS (
SELECT i.BillingCity AS City,
	        SUM(i.total) AS Total,
			g.genreid AS ID,
			g.name AS Genre
FROM invoice i
JOIN invoiceline il
ON il.invoiceid = i.invoiceid
JOIN track t
ON t.trackid = il.trackid
JOIN genre g
ON t.genreid = g.genreid
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10)

SELECT City,
			Total,
			Genre
FROM cities
GROUP BY 1
ORDER BY 2 DESC;
