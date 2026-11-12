select
	a.employee_id,
	a.first_name,
	a.salary,
	b.max_salary,
	b.max_salary - a.salary as possible_raise,
	max_raise(a.employee_id),
	max_raise_2(a.employee_id)
from
	employees a
inner join jobs b on
	b.job_id = a.job_id;

select * from employees a where a.employee_id = 206

select
	max_raise(206);

select
	a.employee_id,
	a.first_name,
	max_raise(a.employee_id)
from
	employees a;

create or replace function max_raise_2(empl_id int)
returns numeric(8,2) as $$
	
	declare
		
		employee_job_id int;
		current_salary numeric(8,2);
		job_max_salary numeric(8,2);
		possible_raise numeric(8,2);

	begin
	
		-- Take the job place and the salary			
		select
				a.job_id, a.salary
			into
				employee_job_id, current_salary
		from
			employees a
		where
			a.employee_id = empl_id;
			
		-- Take max salary according to the job
		select
			a.max_salary into job_max_salary
		from
			jobs a
		where
			a.job_id = employee_job_id;
		
		-- Calculations
		possible_raise = job_max_salary - current_salary;
		
		if (possible_raise < 0) then
			raise exception 'Person with salary greater than max_salary: %', empl_id;
			-- possible_raise = 0;
		end if;
		
		return possible_raise;
						
	end;

$$ language plpgsql;

select
	a.employee_id,
	a.first_name,
	a.salary,
	max_raise_2(a.employee_id)
from
	employees a
where
	a.employee_id = 206