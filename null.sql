NVL(colName, 0) AS colName
NVL(column1 - column2, 0) as colName
NVL(ROUND(column1 / (column2 + column3)), 0) as colName

IFNULL(colName, 0) as colName

-- COALESCE(OPTION1, OPTION2, OPTION3)
-- if 'option1' is null -> option2
-- if 'option2' is null -> option3
SELECT BASE_YYMM
     , COALESCE(A.STRT_DT, A.BEGIN_DT, '999') AS DT
FROM TABLE AS A

ORDER BY colName NULLS FIRST
ORDER BY colName NULLS LAST

