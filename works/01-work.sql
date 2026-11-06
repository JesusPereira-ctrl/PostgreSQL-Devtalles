-- 1. View all records

select * from users;

-- 2. View the record with an ID equal to 10

select * from users where id = 10;

-- 3. Get all records where the first name is 'Jim' (tricky)

select * from users where name like 'Jim %';

-- 4. All records where the middle name is 'Alexander'

select * from users where name like '% Alexander'

-- 5. Change the name in the record with ID = 1 to your own name (e.g., 'Fernando Herrera')

update users set name = 'Fernando Herrera' where id = 1;

-- Verify

select * from users where id = 1;

-- 6. Delete the last record from the table

delete from users where id = (select max(id) from users);
