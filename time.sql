/* ===========================================================
Convert Type
============================================================== */

-- 1) String to timestamp
-- ex) timeColumn : '202105' -> '2021-05-01 00:00:00'
CAST(CONCAT_WS('-', LEFT(timeColumn, 4), SUBSTR(timeColumn, 5, 2), '01') AS TIMESTAMP)

-- ex) '20210701' -> '2021-07-01 00:00:00'
TO_TIMESTAMP('20210701', 'yyyyMMdd')

-- 2) timestamp to String
-- ex) '2021-07-01 00:00:00' -> '20210701'
SELECT FROM_TIMESTAMP(NOW(), 'yyyyMMdd')
SELECT FROM_TIMESTAMP(NOW(), 'yyyyMM')

-- REGEXP_REPLACE(column, 'A', 'B')
-- Find the pattern 'A' and replace it to 'B'
-- ex) '2021-07-01 00:00:00' -> '20210701 00:00:00'
SELECT REGEXP_REPLACE(CAST(now() AS STRING),'-','')

-- ex) '2021-07-01 00:00:00' -> '20210701'
SELECT REGEXP_REPLACE(SUBSTR(CAST(now() AS STRING), 1, 10), '-', '')

-- ex) '2021-07-01 00:00:00' -> '20210701'
SELECT LEFT(REGEXP_REPLACE(CAST(now() AS STRING),'-',''), 8)

-- ex) timeCol : '2021-07-01 00:00:00'
WHERE FROM_UNIXTIME(UNIX_TIMESTAMP(timeCol), 'yyyyMMdd') between '20210101' AND '20211231'

-- 3) timestamp to UNIX_TIMESTAMP
-- ex) '2021-07-01 00:00:00' -> '1,625,097,600'
SELECT UNIX_TIMESTAMP(NOW())

-- 4) UNIX_TIMESTAMP to timestamp
-- Input should be a 'String' type
-- ex) '1625097600' -> '2021-07-01 00:00:00'
SELECT FROM_UNIXTIME(1625097600)


/* ===========================================================
Calculate time difference
============================================================== */

-- difference of seconds
-- ex) timeColumn1 : '071501', timeColumn2 : '071001' -> 300 (seconds)
(HOUR(to_timestamp(timeColumn1, 'HHmmss')) * 3600
 + MINUTE(to_timestamp(timeColumn1, 'HHmmss')) * 60
 + SECOND(to_timestamp(timeColumn1, 'HHmmss')))
 -
(HOUR(to_timestamp(timeColumn2, 'HHmmss')) * 3600
 + MINUTE(to_timestamp(timeColumn2, 'HHmmss')) * 60
 + SECOND(to_timestamp(timeColumn2, 'HHmmss')))

-- difference of date
-- ex) timeColumn1 : '20210705', timeColumn2 : '20210701' -> 4
DATEDIFF(TO_TIMESTAMP(timeColumn1, 'yyyyMMdd'), TO_TIMESTAMP(timeColumn2, 'yyyyMMdd')) as dayDiff

-- difference of 'UNIX_TIMESTAMP'
-- timeColumn1 and timeColumn2 must be timestamp type
from_timestamp(cast((unix_timestamp(timeColumn1) - unix_timestamp(timeColumn2)) as timestamp), 'dd') as day
from_timestamp(cast((unix_timestamp(timeColumn1) - unix_timestamp(timeColumn2)) as timestamp), 'HH') as hour

-- ex) timeColumn1 : 2021-07-09 13:58:50
--     timeColumn2 : 2021-06-25 12:08:39
--     -> 14 01:01:00
cast(from_unixtime(unix_timestamp(timeColumn1) - unix_timestamp(timeColumn2), 'dd') as bigint) - 1 as timediff
from_unixtime(unix_timestamp(timeColumn1) - unix_timestamp(timeColumn2), 'HH:mm:ss') as timediff

-- difference of months
-- ex) timecolumn1 : '20210701'
--     timecolumn2 : '20191201'
--     -> 19.002739726
DATEDIFF(TO_TIMESTAMP(timeColumn1, 'yyyyMMdd'), TO_TIMESTAMP(timeColumn2, 'yyyyMMdd')) / 365 * 12 as monthdiff

-- ex) timecolumn1 : '20210701'
--     timecolumn2 : '20191201'
--     -> 19
MONTHS_BETWEEN(TO_TIMESTAMP(timeColumn1, 'yyyyMMdd'), TO_TIMESTAMP(timeColumn2, 'yyyyMMdd'))


/* ===========================================================
Add/Sub time
============================================================== */

-- Add
-- ex) '2021-07-03' -> '2021-07-10 00:00:00'
DATE_ADD(to_timestamp('2021-07-03', 'yyyy-MM-dd'), INTERVAL 7 DAY) AS day
DATE_ADD(to_timestamp('2021-07-03', 'yyyy-MM-dd'), INTERVAL -1 MONTH) AS MM
DATE_ADD(to_timestamp('2021-07-03', 'yyyy-MM-dd'), INTERVAL -1 year) AS YY

-- ex) '2021-07' -> '2020-07'
FROM_TIMESTAMP(ADD_MONTHS(CAST(CONCAT_WS('-', LEFT('2021-07',4), SUBSTR('2021-07',5,2), '01') AS TIMESTAMP), -12), 'yyyyMM')

-- Sub
-- ex) '2021-07-08' -> '2021-07-01 00:00:00'
SELECT DATE_SUB(to_timestamp('2021-07-08', 'yyyy-MM-dd'), INTERVAL 7 DAY) AS day

-- Add/Sub Month
SELECT ADD_MONTHS(NOW(), 1)   # +1 month

-- ex) '2021-07-01' -> '202104'
SELECT FROM_UNIXTIME(UNIX_TIMESTAMP(ADD_MONTHS(CAST('2021-07-01' AS TIMESTAMP),-3)),'yyyyMM')	


/* ===========================================================
First day of 12 month before
============================================================== */

-- ex) now() : '2021-07-05 14:30:00' -> 2020-07-01 00:00:00
SELECT DATE_ADD(LAST_DAY(DATE_ADD(NOW(), INTERVAL -13 MONTH)), INTERVAL 1 DAY) AS DAY1

-- ex) now() : '2021-07-05 14:30:00' -> '20200701'
SELECT CONCAT(FROM_TIMESTAMP(DATE_ADD(NOW(), INTERVAL -1 YEAR), 'yyyyMM'), '01')

       
/* ===========================================================
Days left in this month
============================================================== */

 -- ex) timeColumn : '20210723' -> 8 (until '20210731')
DATEDIFF(LAST_DAY(TO_TIMESTAMP(timeColumn, 'yyyyMMdd')), TO_TIMESTAMP(timecolumn, 'yyyyMMdd')) as dayLeft


/* ===========================================================
Day of the Week
Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
============================================================== */

SELECT DAYNAME(now()) as dayName
              
-- ex) colName : '20210705' -> 'Monday'
SELECT DAYNAME(TO_TIMESTAMP(colName, 'yyyyMMdd')) as dayName
