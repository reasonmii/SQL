SET batch_size = 10;
SET mem_limit = 5G;

-- Last line of the query
COMPUTE INCREMENTAL STATS sandbox.tablename;
