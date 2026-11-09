select 
	a.name as country, 
	a.continent as continent_code,
	b.name as continent_name
from country a
right join continent b on a.continent = b.code
where 
	a.code is null
order by
	a.name desc;
