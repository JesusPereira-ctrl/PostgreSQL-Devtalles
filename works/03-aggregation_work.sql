-- 1. How many users do we have with @google.com accounts?
-- Tip: count, like

select
	count(*)
from
	users
where
	email like '%@google.com';

-- 2. Which countries are the users with @google.com accounts from?
-- Tip: distinct

select
	distinct country
from
	users
where
	email like '%@google.com';

-- 3. How many users are there per country?
-- Tip: Group by

select
	count(*),
	country
from
	users
group by 
	country;
	
-- 4. List of IP addresses for all users from Iceland
-- Required fields: first_name, last_name, country, last_connection

select
	first_name,
	last_name,
	country,
	last_connection
from
	users
where
	country = 'Iceland';

-- 5. How many of those users (from the previous query) have an IP address
-- that starts with 112.XXX.XXX.XXX?

select
	count(*)
from
	users
where
	country = 'Iceland' and last_connection like '112.%';

-- 6. List of users from Iceland who have an IP address
-- that starts with 112, 28, or 188
-- Tip: Group conditions within parentheses

select
	first_name,
	last_name,
	country,
	last_connection
from
	users
where
	country = 'Iceland'
	and (last_connection like '112.%'
		or last_connection like '28.%'
		or last_connection like '188.%');

-- 7. Sort the previous result by last_name (ascending)
-- and then by first_name (also ascending)

select
	first_name,
	last_name,
	country,
	last_connection
from
	users
where
	country = 'Iceland'
	and (last_connection like '112.%'
		or last_connection like '28.%'
		or last_connection like '188.%')
order by
	last_name asc, 
	first_name asc;

-- 8. List of people whose country is in this list:
-- ('Mexico', 'Honduras', 'Costa Rica')
-- Sort the results by country (ascending), first name (ascending), and last name (ascending)
-- Tip: Look up the IN operator
-- Tip 2: Check the comparison operators on the cheat sheet (first page)

select
	country,
	first_name,
	last_name
from
	users
where
	country in ('Mexico', 'Honduras', 'Costa Rica')
order by
	country asc,
	first_name asc,
	last_name asc;

-- 9. Based on the previous query, count how many people there are per country
-- Sort the results by country (ascending)

select
	count(*) as total,
	country
from
	users
where
	country in ('Mexico', 'Honduras', 'Costa Rica')
group by
	country
order by
	country asc;
