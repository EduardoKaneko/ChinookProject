/* GROUP BY
Agregar dados dentro de um subconjunto dos dados.

*/

SELECT a.name,
       AVG(o.standard_qty) avg_standard,
       AVG(o.gloss_qty) avg_gloss,
       AVG(o.poster_qty) avg_poster
FROM orders o
JOIN accounts a
ON o.account_id - a.id
GROUP BY a.name
ORDER BY a.name

/*
- Este código retorna o nome das contas e
a quantidade média de todos os pedidos das contas
por tipo de papel.
*/
