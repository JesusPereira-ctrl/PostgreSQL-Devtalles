-- country a    - name, continent as continent_code (numeric code)
-- continent b  - name as continent_name

select 
	a.name as country, 
	a.continent as continent_code,
	b.name as continent_name
from country a
full outer join continent b on a.continent = b.code
order by
	a.name desc;
