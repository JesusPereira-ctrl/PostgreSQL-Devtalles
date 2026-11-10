-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa

-- With name of continent like in where

(
select count(*) as total, b.name from country a
inner join continent b on a.continent = b.code
where b.name not like '%America%'
group by b.name
order by count(*) asc
)
union
(
select count(*) as total, 'America' from country a
inner join continent b on a.continent = b.code
where b.name like '%America%'
)
order by total asc;

-- See data
select code, name from continent;

-- With code in continent in where

(
select count(*) as total, b.name from country a
inner join continent b on a.continent = b.code
where b.code not in (4, 6, 8)
group by b.name
order by count(*) asc
)
union
(
select count(*) as total, 'America' from country a
inner join continent b on a.continent = b.code
where b.code in (4, 6, 8)
)
order by total asc;