
CASE WHEN colName IN ('A', 'B', 'C') THEN 'ABC' ELSE 'ETC' END AS colName

CASE WHEN colName in ('apple', 'banana', 'orange') THEN '1.fruit'
     WHEN colNmae in ('dog', 'cat', 'rabbit') THEN '2.animal'
     WHEN colName in ('RED', 'BLUE', 'GREEN') THEN '3.color'
     END AS colName

CASE WHEN colName >= 365 / 12 * 24 then '24M↑'
     WHEN colName >= 365 / 12 * 18 then '18M↑'
     WHEN colName >= 365 / 12 * 12 then '12M↑'
     ELSE '12M↓' END AS colName

CASE WHEN column1 in ('A', 'B', 'C') THEN
                                         CASE WHEN column2 in ('X', 'Y', 'Z') then 'num1'
                                              ELSE 'num2' END
     WHEN column1 in ('D', 'E') THEN 'num3'
     ELSE 'num4' END AS colName

CASE WHEN colName IS NOT NULL THEN 'GOOD' ELSE 'BAD' END AS colName

