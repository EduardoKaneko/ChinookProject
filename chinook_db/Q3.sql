SELECT g.name  AS Genre,
	        SUM(i.total) AS Total,
			SUM(il.quantity) AS  Quantity,
			(Total/Quantity) AS Medium
FROM invoice i
JOIN InvoiceLine il
ON i.invoiceid = il.invoiceid
JOIN track t
ON t.trackid = il.trackid
JOIN genre g
ON g.genreid = t.genreid
GROUP BY 1
ORDER BY 4 DESC;
