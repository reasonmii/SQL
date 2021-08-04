-- COUNT
SELECT column1
     , column2
     , column3
     , count(*) as cnt1
     , count(distinct column4) as cnt2
FROM TABLE
GROUP BY 1,2,3

-- SUM
SELECT column1
     , sum(case when column2 like '%ABC%' then 1 else 0 end) as sum1
     , sum(case when column3 in ('A', 'B') then 1 else 0 end) as sum2
     , sum(case when column4 is not null then 1 else 0 end) as sum3
FROM TABLE
GROUP BY 1

-- AVG
SELECT column1
     , AVG(column1) as avg1
     , sum(case when column3 in ('A', 'B') then 1 else 0 end) / count(*) as avg2
FROM TABLE
GROUP BY 1

-- MAX/MIN
SELECT column1
     , MAX(column2) AS maxVal
     , MIN(column2) AS minVal
FROM TABLE
GROUP BY 1

-- DECODE
SELECT column1
     -- if column2 is 'A' then 1 else 0
     , sum(DECODE(column2, 'A', 1, 0)) as sum1
     -- if column3 is NULL then 0 else 1
     , sum(DECODE(column3, NULL, 0, 1)) as sum2
     -- if column4 is 'A' OR 'B' OR 'C' then 1 else 0
     , sum(DECODE(column4, 'A', 1, 'B', 1, 'C', 1, 0)) as sum3
FROM TABLE
GROUP BY 1

