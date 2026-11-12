select
	a.employee_id,
	a.first_name,
	a.salary,
	b.max_salary,
	b.max_salary - a.salary as possible_raise,
	max_raise(a.employee_id)
from
	employees a
inner join jobs b on
	b.job_id = a.job_id;

select
	max_raise(206);

select
	a.employee_id,
	a.first_name,
	max_raise(a.employee_id)
from
	employees a;

create or replace function max_raise(empl_id int)
returns numeric(8,2) as $$
	
	declare
		
		-- salary numeric(8,2);
		-- max_salary(8,2);
		possible_raise numeric(8,2);

	begin
			
		select
			b.max_salary - a.salary into possible_raise
		from
			employees a
		inner join jobs b on
			b.job_id = a.job_id
		where
			a.employee_id = empl_id;
			
		return possible_raise;
						
	end;

$$ language plpgsql;