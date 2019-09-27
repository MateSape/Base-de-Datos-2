# Clase 19

# 1 - Create a user data_analyst

CREATE USER data_analyst@'%' IDENTIFIED BY '1234';

# 2 - Grant permissions only to SELECT, UPDATE and DELETE to all sakila tables to it.

GRANT SELECT, UPDATE, DELETE ON *.* TO data_analyst@'%';

# 3 - Login with this user and try to create a table. Show the result of that operation.

# CREATE command deniedto user 'data_analyst'@'%' for table 'pepe'

# 4 - Try to update a title of a film. Write the update script.

UPDATE film SET title = "Kimi no na wa" WHERE title LIKE "%Akira%"

# 5 - With root or any admin user revoke the UPDATE permission. Write the command

REVOKE UPDATE ON *.* TO data_analyst@'%';

# 6 - Login again with data_analyst and try again the update done in step 4. Show the result.

# UPDATE command denied to user 'data_analyst'@'%' for table 'film'
