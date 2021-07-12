/* ===========================================================
Type
BINARY / CHAR / DATE / DATETIME / TIME /
DECIMAL / JSON / NCHAR / SIGNED [INTEGER] / UNSIGNED [INTEGER]
============================================================== */

-- Convert type
CAST(column_name AS type)
CONVERT(column_name, type)

-- ex) convert('abc' USING utf8mb4)
convert(column_name USING transcoding_name)



