/* Query 1 - the query used to first insight */

SELECT  i.billingcountry  Country,
	SUM(i.total) TotalUSD,
 	SUM(il.quantity) Quantity,
	(SUM(i.total) / SUM(il.quantity) )  MediumTicket
FROM invoice i
JOIN InvoiceLine il
ON i.invoiceid = il.invoiceid
GROUP BY i.billingcountry
ORDER BY 4 DESC


/* Query 2 - The query used to second insight */

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


/* Query 3 - The query used to third insight */

SELECT g.name  AS Genre,
       SUM(i.total) AS Total,
       SUM(il.quantity) AS  Quantity,
FROM invoice i
JOIN InvoiceLine il
ON i.invoiceid = il.invoiceid
JOIN track t
ON t.trackid = il.trackid
JOIN genre g
ON g.genreid = t.genreid
GROUP BY 1
ORDER BY 2 DESC;

/* Query 4 - The query used to fourth insight */

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
