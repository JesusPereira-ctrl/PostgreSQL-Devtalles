select
	first_name,
	last_name,
	hire_date,
	case
		when hire_date > now() - interval '1 year' then '1 year or less'
		when hire_date > now() - interval '3 year' then '1 to 3 years'
		when hire_date > now() - interval '6 year' then '3 to 6 years'
		else '+ than 6 years'
	end as seniority_range
from
	employees
order by
	hire_date desc;