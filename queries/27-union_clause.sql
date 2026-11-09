-- The `UNION` clause is used to combine `SELECT` statements; however, be careful—the number of columns and 
-- their data types must match in both, otherwise it will result in an error.

select code, name, '123' from continent where name like '%America%'
union
select 1, 'otra cosa', name from continent where code in (3, 5)
order by 
	name asc;