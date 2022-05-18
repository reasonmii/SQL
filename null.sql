NVL(colName, 0) AS colName
NVL(column1 - column2, 0) as colName
NVL(ROUND(column1 / (column2 + column3)), 0) as colName

IFNULL(colName, 0) as colName

-- Print 'A'
-- if 'A' is NULL print 'B'
-- if 'A' and 'B' are NULL print 'C'
COALESCE(A, B, C)

ORDER BY colName NULLS FIRST
ORDER BY colName NULLS LAST

