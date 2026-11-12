select
	greet_employee('Fernando');

select
	a.first_name,
	greet_employee(a.first_name)
from
	employees a;

create or replace function greet_employee(employee_name varchar)
returns varchar
as $$
	-- declare
	

	begin
		
		return 'Hello ' || employee_name;
		
	end

$$
language plpgsql;