
-- ROW_NUMBER
-- ex) column1 : entr_no, column2 : frst_dt
SELECT ROW_NUMBER()OVER (PARTITION BY column1 order by column2) as ODR
SELECT ROW_NUMBER()OVER (PARTITION BY column1 order by column2 desc) as ODR

/* When you order by a field that may contain NULL values,
 * any NULLs are considered to have the lowest value.
 * So ordering in DESC order will see the NULLs appearing last. */
SELECT ROW_NUMBER()OVER (PARTITION BY column1 order by column2 DESC NULLS LAST) as ODR
SELECT ROW_NUMBER()OVER (PARTITION BY column1 order by column2 ASC NULLS LAST) as ODR

-- RANK
-- ex) 1, 2, 3, 3, 5
SELECT RANK()OVER (ORDER BY columnName) as rk
SELECT RANK()OVER (ORDER BY columnName desc) as rk

-- DENSE_RANK
-- ex) 1, 2, 3, 3, 4, 5
SELECT DENSE_RANK()OVER (ORDER BY columnName) as rk
SELECT DENSE_RANK()OVER (ORDER BY columnName desc) as rk

