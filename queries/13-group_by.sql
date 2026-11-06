select 
	count(*),
	followers
from 
	users
where
	followers = 4 or followers = 4999
group by 
	followers;

select 
	count(*),
	followers
from 
	users
where
	followers between 4500 and 4999
group by 
	followers
order by
	followers desc;