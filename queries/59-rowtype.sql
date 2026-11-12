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
		
		selected_employee employees%rowtype;
		selected_job jobs%rowtype;
		
		possible_raise numeric(8,2);

	begin
	
		-- Take the job place and the salary			
		select
			*
		from
				employees a 
			into 
				selected_employee
		where
			a.employee_id = empl_id;
			
		-- Take max salary according to the job
		select
			*
		from
				jobs a
			into 
				selected_job
		where
			a.job_id = selected_employee.job_id;
		
		-- Calculations
		possible_raise = selected_job.max_salary - selected_employee.salary;
		
		if (possible_raise < 0) then
			raise exception 'Person with salary greater than max_salary: id: %, name: %', 
							selected_employee.employee_id, selected_employee.first_name;
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