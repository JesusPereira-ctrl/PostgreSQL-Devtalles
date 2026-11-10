-- I would like to know the official languages ​​spoken on each continent.

select * from countrylanguage where isofficial = true;

select * from country;

select * from continent;

select distinct a.language, c.name as continent from countrylanguage a
inner join country b on a.countrycode = b.code
inner join continent c on b.continent = c.code
where a.isofficial = true
order by c.name desc;

select * from countrylanguage;

-- How many official languages ​​are spoken per continent?

select count(*), continent from (
	select distinct a.language, c.name as continent from countrylanguage a
	inner join country b on a.countrycode = b.code
	inner join continent c on b.continent = c.code
	where a.isofficial = true
	order by c.name desc
) as totales
group by continent
order by count(*) asc;