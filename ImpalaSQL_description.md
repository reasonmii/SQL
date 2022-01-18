## Impala SQL

- 하둡 파일 시스템에서 동작하도록 구현되어 있는 SQL
- 대량 데이터 처리에 최적화
- DELETE / UPDATE와 같은 DML 연산은 지원X
- 인덱스, 제약조건, 외래 키 사용 불가능

※ 데이터웨어하우스를 운영할 때에는 DML, 인덱스, 제약조건, 외래 키 사용을 최소화 하는 것에 집중함 (성능 상 낭비가 심함)
따라서, 제약조건을 통해서 ETL 작업 상의 오류를 검증하는 방식을 사용했다면 데이터 파이프라인 내에서 검증할 수 있는 다른 방식을 따라야 함

데이터 적재
- APPEND와 OVERWRITE 두 가지 방식만 존재

데이터 삭제
- 적은 양의 row 삭제가 아닌 partition 전체를 제거하는 등 대량의 데이터에 대해서 동작하는 쿼리만 사용 가능
- 실수로 데이터를 삭제한 경우, HDFS 휴지통에서 데이터 복구 가능

기본적으로 Autocommit 지원
- 클러스터 내의 모든 노드에 변경된 사항이 적용됨
- but, Impala 외부의 명령을 통해서 변경이 이루어진 경우. [REFRESH 테이블명] 명령을 사용해서 커밋을 수동으로 동작시킬 수도 있음


# 임팔라 쿼리 특징

From 절 없이 SELECT 문 사용 가능
``` sql
SELECT 1 + 0.5;
SELECT 1 / 3;
SELECT 1e6, 1.5e6;
SELECT 30000 BETWEEN min_smallint() AND max_smallint();
``` 

통계 업데이트
``` sql
compute stats [테이블명]
```

쿼리 실행계획 확인하기
``` sql
explain select * from [테이블명]
```

테이블 생성
``` sql
CREATE TABLE text_including_stored_as_clause  (c1 STRING, c2 STRING, c3 STRING) STORED AS TEXTFILE;
```

테이블 생성 + 구분자
``` sql
CREATE TABLE csv (c1 STRING, c2 STRING, c3 STRING)  ROW FORMAT DELIMITED FIELDS TERMINATED BY “\t” STORED AS TEXTFILE;
```

테이블 생성 + 파티션
``` sql
CREATE TABLE partitioned_table (c1 STRING, c2 INT, c3 BOOLEAN)  PARTITIONED BY (year SMALLINT, month TINYINT);
```

데이터 구조 확인 및 HDFS 경로 확인 쿼리
``` sql
DESCRIBE FORMATTED [테이블명]
```


[출처] https://datalibrary.tistory.com/106
