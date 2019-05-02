SELECT  i.billingcountry  Country,
	         SUM(i.total) TotalUSD,
			 SUM(il.quantity) Quantity,
			 (SUM(i.total) / SUM(il.quantity) )  MediumTicket
FROM invoice i
JOIN InvoiceLine il
ON i.invoiceid = il.invoiceid
GROUP BY i.billingcountry
ORDER BY 4 DESC
