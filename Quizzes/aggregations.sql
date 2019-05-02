/* Introdução a agregações em SQL */

/* PART 01 - Nulos e counts
Células com valores nulos não representam nenhum valor, é realmente uma célula vazia.
Ou seja, quando chamamos uma função para valores numéricos como AVG(), as células com NULL
não serão acrescentadas no denominador ou numerador, por exemplo.
*/

SELECT *
    FROM orders
WHERE primary_poc IS NULL

/* Este código retornaria apenas as linhas que tiverem células em braco nulos em
primary_poc.
- Não usamos "=" porque nulos não são considerados valores em SQL.*/

/* PART 02 - COUNTs
Usamos "COUNT()" para encontrar o número de linhas com valores na tabela
*/

SELECT COUNT(price_standard)
    FROM orders

/* Este código retornaria o número de linhas na tabela,
sem contar o número de células com NULL.
Ex: Se houvesse 400 linhas na tabela e a coluna "price_standard" tivesse duas
células vazias, o retorno seria 398. */

/* PART 03 - MIN(), MAX() E AVG()
Tanto a função MIN() como a função MAX()  podem ser utilizadas para valores não numéricos
como strings ou datas. A função AVG() retorna a média apenas para valores numéricos
*/

SELECT MIN(occurred_at)
    FROM orders;

SELECT MAX(total_amt_usd)
    FROM orders;

SELECT AVG(poster_qty)
    FROM oders;

/*
- O primeiro código retornaria a data mais antiga de occurred_at.
- O segundo código retornaria o maior valor em total_amt_usd
- O terceiro código retornaria a média de poster_qty
*/
