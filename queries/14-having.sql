select 
	count(*) as total,
	country
from 
	users
group by
	country
having
	count(*) between 1 and 5
order by
	count(*) desc;