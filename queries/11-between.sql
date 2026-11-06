select 
	first_name, 
	last_name, 
	followers 
from 
	users
where
	-- followers >= 4600 and followers <= 4700
	followers between 4600 and 4700
order by 
	followers asc;