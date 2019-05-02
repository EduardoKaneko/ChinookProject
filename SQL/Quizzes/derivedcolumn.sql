/*
1.Escreva uma consulta que encontra a percentagem de receita que vem de papel pôster para cada pedido.
Você vai precisar usar apenas as colunas que terminam com _usd.
(Tente fazer isso sem usar a coluna de total).
Inclua os campos id e account_id
*/

SELECT  id,
        account_id,
        poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
    FROM orders
LIMIT 10;
