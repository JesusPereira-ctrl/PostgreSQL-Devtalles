select
	max(hire_date),
	--	max(hire_date) + interval '1 days' as days,
	--	max(hire_date) + interval '1 month' as months,
	--	max(hire_date) + interval '1 year' as years,
	max(hire_date) + interval '1 years' + interval '1 day' as years,
	date_part('year', now()),
	make_interval(years := date_part('year', now())::integer),
	max(hire_date) + make_interval(years := 23)
from
	employees;