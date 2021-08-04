
-- Delete table
TRUNCATE TABLE IF EXISTS tableName;
DROP TABLE IF EXISTS tableName;

-- Overwrite table
INSERT OVERWRITE TABLE tableName
SELECT *
FROM originalTableName

-- Insert data into table
INSERT INTO TABLE tableName
SELECT *
FROM originalTableName

-- Table information
DESCRIBE TABLE_NAME
DESCRIBE FORMATTED TABLE_NAME

-- CREATE TABLE
CREATE TABLE tableName (
  colName1 STRING,
  colName2 STRING,
  colName3 STRING,
  colName4 STRING,
  colName5 STRING);

INSERT INTO tableName (colName1, colName2, colName3, colName4, colName5)
VALUES
("red", "circle", "Y", "apple", "paper"),
("yellow", "rectangle", "N", "banana", "pencil"),
("blue", "square", "Y", "carrot", "paper"),
("green", "circle", "N", "melon", "paper")

-- CREATE TABLE : WITH TEMP TABLE
CREATE TABLE tableName
WITH
  temp1 AS (SELECT colName1
                 , colName2
            FROM table1)
, temp2 AS (SELECT colName1
                 , colName2
            FROM table2),
, temp3 AS (SELECT colName1
                 , colName2
            FROM table3)
SELECT t1.colName1
     , t1.colName2
     , t2.colName2
     , t3.colName2
     , t4.colName2
FROM table4 as t4
LEFT JOIN temp1 as t1 on t1.colName1 = t4.colName1
LEFT JOIN temp2 as t2 on t2.colName1 = t4.colName1
LEFT JOIN temp3 as t3 on t3.colName1 = t4.colName1
