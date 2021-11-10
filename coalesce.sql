
-- COALESCE(OPTION1, OPTION2, OPTION3)
-- if 'option1' is null -> option2
-- if 'option2' is null -> option3


SELECT BASE_YYMM
     , COALESCE(A.STRT_DT, A.BEGIN_DT, '999') AS DT
FROM TABLE AS A
