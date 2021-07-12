-- Start with 'A'
-- ex) 'A', 'AB'
where colName regexp 'A.*'	
where colName rlike 'A.*'

-- Start with one of 'A', 'B' or 'C'
where name regexp '^[A-C].*'
where name rlike '^[A-C].*'

-- Start with 'Chr' or 'Cr'
-- ex) Christmas, Cristmas
where colName regexp '(Chr|Cr)istmas$'
where colName rlike '^(Chr|Cr)istmas$'

-- 1st 'h' is optional, 1st i can be lower or upper case
-- ex) Christmas, ChrIstmas, Cristmas, CrIstmas,
where colName regexp 'Ch?r[Ii]stmas'
where colName rlike 'Ch?r[Ii]stmas'

-- Start with 'C' + at least one of them [aeiou] + 'r'
-- ex) Car, Cer, Cir, Cor, Cur
where colName regexp '^C[aeiou]+r.*$'
where colName regexp '^C[aeiou]+r.*$'

-- There should be at least two of [aeiou] at the end
where colName regexp '.*[aeiou](2,}$'
where colName rlike '.*[aeiou](2,}$'
