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

---------------------------------------------------

CREATE TABLE DASQL.BASIC_TEMP1
(
	CUST_NAME VARCHAR2(10) NOT NULL  -- NULL 값을 허용하지 않음 (default : 허용)
  , SEX       VARCHAR2(3)
  , AGE       NUMBER(2)
);

INSERT INTO DASQL.BASIC_TEMP1 VALUES('앤', '여', 34);
INSERT INTO DASQL.BASIC_TEMP1 VALUES('해밀턴', '남', 42);
INSERT INTO DASQL.BASIC_TEMP1 VALUES('빌리', '남', 16);

---------------------------------------------------

CREATE TABLE DASQL.CUST_BUY_INFO
(
	CUST_NAME VARCHAR2(10) NOT NULL
  , BUY_DATE  DATE
  , BUY_NM    VARCHAR2(30)
  , PAY       NUMBER(10)
);

-- 테이블 설명
COMMENT ON TABLE DASQL.CUST_BUY_INFO IS '구매내역';

-- 컬럼 설명
COMMENT ON COLUMN DASQL.CUST_BUY_INFO.CUST_NAME IS '고객명';
COMMENT ON COLUMN DASQL.CUST_BUY_INFO.BUY_DATE IS '구매일자';
COMMENT ON COLUMN DASQL.CUST_BUY_INFO.BUY_NM IS '상품';
COMMENT ON COLUMN DASQL.CUST_BUY_INFO.PAY IS '지불금액';

INSERT INTO DASQL.CUST_BUY_INFO VALUES('김서연', TO_DATE('2022.08.05', 'yyyy.mm.dd'), '샴푸, 린스', 23000);
INSERT INTO DASQL.CUST_BUY_INFO VALUES('이예준', TO_DATE('2022.08.15', 'yyyy.mm.dd'), '초콜렛', 700);
INSERT INTO DASQL.CUST_BUY_INFO VALUES('김지민', TO_DATE('2022.08.31', 'yyyy.mm.dd'), '오렌지주스', 3800);
INSERT INTO DASQL.CUST_BUY_INFO VALUES('신우진', TO_DATE('2022.08.18', 'yyyy.mm.dd'), '아이스크림', 1500);
INSERT INTO DASQL.CUST_BUY_INFO VALUES('이하은', TO_DATE('2022.08.26', 'yyyy.mm.dd'), '밑반찬', 5000);

---------------------------------------------------

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
Footer
© 2022 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status

