SELECT * 
FROM testdb.user_info
WHERE id > 100
AND name LIKE '%e%'
AND age > 40;