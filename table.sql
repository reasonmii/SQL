
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

-- Create table
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



