select * from employees
where hire_date > date('1998-02-05')
order by hire_date desc;

select
	max(hire_date) as last_employee,
	min(hire_date) as first_employee
from employees;

select * from employees
where hire_date between '1999-01-01' and '2001-01-04'
order by hire_date desc;