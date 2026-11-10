-- Which official language (and language code) is spoken by the greatest number of countries in Europe?

select * from countrylanguage where isofficial = true;

select * from country;

select * from continent;

Select * from "language";

select count(*), b.languagecode, b.language from country a
inner join countrylanguage b on a.code = b.countrycode
where a.continent = 5 and b.isofficial = true
group by b.languagecode, b.language
order by count(*) desc
limit 1;

-- List of all countries whose official language is the most spoken language in Europe 
-- (do not use a subquery; build upon the previous code)

select * from country a
inner join countrylanguage b on a.code = b.countrycode
where a.continent = 5 and b.isofficial = true and b.languagecode = 135;

select languagecode from (
	select count(*), b.languagecode, b.language from country a
	inner join countrylanguage b on a.code = b.countrycode
	where a.continent = 5 and b.isofficial = true
	group by b.languagecode, b.language
	order by count(*) desc
	limit 1
) as subquery;