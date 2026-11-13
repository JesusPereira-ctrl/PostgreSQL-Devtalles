-- percentage: 5
create or replace procedure controlled_raise(percentage numeric) as
$$

	declare	
		
		real_percentage numeric(8,2);
		total_employees_modified int;
		
	begin				
		
		real_percentage = percentage / 100; -- 5% = 0.05;
		
		-- Keep historial
		insert into raise_history(date, employee_id, base_salary, amount, percentage)
		select
			current_date as date,
			a.employee_id,
			a.salary,
			max_raise(a.employee_id) * real_percentage as amount,
			percentage
		from
			employees a;
			
		-- Impact the table of employees
		update 
			employees a
		set 
			salary = (max_raise(a.employee_id) * real_percentage) + salary;
			
		commit;
		
		select
			count(*)
		into
			total_employees_modified
		from
			employees;
		
		raise notice 'Affected % employees', total_employees_modified;
		
	end;
	
$$ language plpgsql;

call controlled_raise(1);

select
	*
from
	employees a;

select
	*
from
	raise_history a;

select
	24000.00 * 0.01,
	max_raise(100);

select
	current_date as date,
	a.employee_id,
	a.salary,
	max_raise(a.employee_id),
	max_raise(a.employee_id) * 0.05 as amount,
	5 as percentage
from
	employees a;