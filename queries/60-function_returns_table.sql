select
	a.country_id,
	a.country_name,
	b.region_name
from
	countries a 
inner join regions b on
	a.region_id = b.region_id;

create or replace function country_region()
returns table (id character(2), name varchar(40), region varchar(25))
as $$
	
	begin
	
		return query
			select
				a.country_id,
				a.country_name,
				b.region_name
			from
				countries a 
			inner join regions b on
				a.region_id = b.region_id;
		
	end;
	
$$ language plpgsql;

select
	*
from
	country_region();