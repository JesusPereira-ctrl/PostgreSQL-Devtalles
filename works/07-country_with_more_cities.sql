-- I want you to show me the country with the most cities
-- Fields: total number of cities and the name of the country
-- Use INNER JOIN

select * from city;

select * from country;

select count(*) as total, b.name as country_name
from city a
inner join country b on a.countrycode = b.code
group by b.name
order by count(*) desc
limit 1;