/*
※'IMPALA' SQL creates fixed random number,
if you put the query in subquery
So, it's better to make temp table for the random number and refer that
*/

-- Create random number
RAND(UNIX_TIMESTAMP(NOW()))

-- Create 'INT' random number
row_number()over(partition by column1 order by RAND(UNIX_TIMESTAMP(NOW())))

