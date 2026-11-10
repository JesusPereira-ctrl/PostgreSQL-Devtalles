create table users (
	name varchar(100)
);

-- Drop vs Truncate

-- Drop delete the table
-- Truncate only delete records, The entire creation configuration is preserved.

drop table users;

truncate table users;