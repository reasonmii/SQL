
SELECT column1
     , column2
     , column3
FROM TABLE1
WHERE 1=1
AND column4 >= (SELECT AVG(column1) FROM TABLE2)
AND column5 in (SELECT column1 FROM TABLE3)
AND column6 in (SELECT DISTINCT column1 FROM TABLE4)
