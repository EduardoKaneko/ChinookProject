WITH count_composer AS (
SELECT t.composer AS Composer,
	        SUM(i.total) AS totalUSD,
			g.genreid AS ID,
			g.name AS Genre
FROM track t
JOIN invoiceline il
ON t.trackid = il.trackid
JOIN invoice i
ON i.invoiceid = il.invoiceid
JOIN genre g
ON g.genreid = t.genreid
WHERE t.composer NOT LIKE ' '
GROUP BY t.composer
ORDER BY 2 DESC
LIMIT 10)

SELECT Composer AS Composer,
			MAX(totalUSD) AS TotalUSD,
			Genre AS Genre
FROM count_composer
GROUP BY 1
ORDER BY 2 DESC;
