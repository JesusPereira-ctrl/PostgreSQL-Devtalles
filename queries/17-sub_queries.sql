select 
	*
from (
	select
		count(*) as total,
		substring(email, position('@' in email) + 1) as domain,
		'Fernando' as name,
		37 as age
	from
		users
	group by
		substring(email, position('@' in email) + 1)
	having
		count(*) > 1
	order by
		substring(email, position('@' in email) + 1) asc
) as email_domains;