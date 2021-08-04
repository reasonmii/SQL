
-- LEFT JOIN
SELECT A.COL1
     , A.COL2
     , B.COL5
FROM table1 as A
LEFT JOIN table2 as B on a.col1 = b.col1

-- INNER JOIN
SELECT A.COL1
     , A.COL2
     , B.COL5
FROM table1 as A
INNER JOIN table2 as B on a.col1 = b.col1

-- UNION
-- All column's names should be the same
-- table1 + table2 + ... tableN
SELECT col1, col2, col3 FROM table1
UNION
SELECT col1, col2, col3 FROM table2
UNION
SELECT col1, col2, col3 FROM table3

-- UNION ALL
-- All column's names should be the same
-- table1 + table2 + ... tableN
SELECT col1, col2, col3 FROM table1
UNION ALL
SELECT col1, col2, col3 FROM table2
UNION ALL
SELECT col1, col2, col3 FROM table3


