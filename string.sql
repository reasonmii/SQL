/* ===========================================================
Concatenate words with seperator
============================================================== */

-- ex) concat_ws('-', '2021', '07', '01) -> '2021-07-01'
concat_ws(seperator, word1, word2, word3, ...)


/* ===========================================================
Replace word1 to word2
============================================================== */

-- ex) REGEXP_REPLACE('2021-07-01', '-', '') -> '20210701'
REGEXP_REPLACE(column_name, word1, word2)


/* ===========================================================
LEFT, RIGHT, SUBSTR
============================================================== */

-- ex) 'HELLOWORLD' -> 'HELL'
LEFT(colName, 4)

-- ex) 'HELLOWORLD' -> 'ORLD'
RIGHT(colName, 4)

-- ex) 'HELLOWORLD' -> 'WO'
SUBSTR(colName, 6, 2)


/* ===========================================================
Fill the space
============================================================== */

-- 'HELLO' -> '**HELLO'
SELECT LPAD('HELLO', 7, '*') AS col1

-- 'HELLO' -> 'HELLO**'
SELECT RPAD('HELLO', 7, '*') AS col1




