insert into continent (name) 
	select distinct continent from country order by continent asc;