select * from employees;

with recursive bosses as (
		-- Init
		select id, name, reports_to, 1 as depth from employees where id = 1
	union
		-- Recursive
		select employees.id, employees.name, employees.reports_to, depth + 1 from employees
		inner join bosses on bosses.id = employees.reports_to
		where depth < 2
)
select bosses.*, employees.name as reports_to_name from bosses
left join employees on employees.id = bosses.reports_to
order by depth;