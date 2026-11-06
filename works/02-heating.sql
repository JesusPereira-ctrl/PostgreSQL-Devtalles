-- first_name, last_name, and IP address, with the last connection originating from 221.XXX.XXX.XXX

select
	first_name,
	last_name,
	last_connection
from 
	users
where 
	last_connection like '221.%';

-- first_name, last_name, and follower count for all individuals who have more than 4,600 followers

select
	first_name,
	last_name,
	followers
from
	users
where
	followers > 4600;
