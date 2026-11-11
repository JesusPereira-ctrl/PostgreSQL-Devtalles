select
	hire_date,
	make_interval(years := 2026 - extract(years from hire_date)::integer) as manual,
	make_interval(years := date_part('years', current_date)::integer - extract(years from hire_date)::integer) as computed
from
	employees
order by
	hire_date desc;

select
	hire_date,
	hire_date + interval '26 years'
from
	employees
order by
	hire_date desc;

update
	employees
set
	hire_date = hire_date + interval '6 years'