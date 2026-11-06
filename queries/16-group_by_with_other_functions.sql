select
	count(*),
	substring(email, position('@' in email) + 1) as domain
from
	users
group by
	substring(email, position('@' in email) + 1)
having
	count(*) > 1
order by
	substring(email, position('@' in email) + 1) asc;