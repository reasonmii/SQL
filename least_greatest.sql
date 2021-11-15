
SELECT '202101' AS YYMM
     , NVL(DATEDIFF(LEAST(time1, time2), GREATEST(time3, time4)),0) AS TERM
WHERE 1=1
AND LEAST(time1, time2) >= GREATEST(time3, time4)
