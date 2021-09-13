TRUNCATE TABLE IF EXISTS sandboxName2.tableName;
DROP TABLE IF EXISTS sandboxName2.tableName;

CREATE EXTERNAL TABLE sandboxName2.tableName (
    colName1 STRING,
  , colName2 DECIMAL(9,0)
  , colName3 DECIMAL(15,0)
  , colName4 DECIMAL(23,0)
  , colName5 DECIMAL(22,0)
  , colName6 DECIMAL(23,0)
)
STORED AS PARQUET
LOCATION 'SBX/impala_table/sandboxName1/sandboxName2/tableName';

