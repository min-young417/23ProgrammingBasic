SELECT *
FROM testdb.user_info
WHERE email LIKE '%.com'
ORDER BY name DESC;