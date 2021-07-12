DROP VIEW newTableName;

CREATE VIEW newTableName AS
SELECT '202101' as yymm
     , 'Red'    as col1
     , 'Orange' as col2
     , 'Blue' as col3
FROM tableName
UNION ALL
SELECT '202102'   as yymm
     , 'circle'   as col1
     , 'square'   as col2
     , 'triangle' as col3
FROM tableName
SELECT '202103' as yymm
     , 'apple'  as col1
     , 'banana' as col2
     , 'carrot' as col3
FROM tableName


