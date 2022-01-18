
-- 공백제거
TRIM(colName)
LTRIM(colName)
RTRIM(colName)

-- 특정 문자열 제거
SELECT TRIM(BOTH 'a' FROM 'aaabcdaaa')      -- 양쪽제거
SELECT TRIM(LEADING 'a' FROM 'aaabcdaaa')   -- 왼쪽제거
SELECT TRIM(TRAILING 'a' FROM 'aaabcdaaa')  -- 오른쪽제거


