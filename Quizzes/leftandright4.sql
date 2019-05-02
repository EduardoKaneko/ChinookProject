WITH vowels_count AS (
    SELECT name,
           CASE WHEN LEFT(UPPER(name), 1) IN ('A', 'E', 'I', 'O', 'U')
                THEN 1 ELSE 0 END AS vowel,
            CASE WHEN LEFT(UPPER(name), 1) IN ('A', 'E', 'I', 'O', 'U')
                 THEN 0 ELSE 1 END AS other
    FROM accounts)

SELECT SUM(vowel) as vowels,
       SUM(other) as others
FROM vowels_count
