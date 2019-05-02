WITH counting AS (
SELECT name,
       CASE WHEN LEFT(UPPER(name), 1) IN ('0', '1', '2', '3', '4', '5',
                                          '6', '7', '8', '9')
            THEN 1 ELSE 0 END AS num,
       CASE WHEN LEFT(UPPER(name), 1) IN ('0', '1', '2', '3', '4', '5',
                                          '6', '7', '8', '9')
            THEN 0 ELSE 1 END AS letter
FROM accounts)

SELECT SUM(num) nums,
       SUM(letter) letters
FROM counting 
