-- 1. Create a primary key on the "city" table (id)

alter table city 
	add primary key (id);

-- 2. Create a check constraint on "population" to prevent negative values

alter table city 
	add check (population >= 0);

-- 3. Create a composite primary key on the "countrylanguage" table
-- The fields to be used for the composite key are "countrycode" and "language"

alter table countryLanguage 
	add primary key (countryCode, language);

-- 4. Create a check constraint on "percentage"
-- To prevent negative values ​​or numbers greater than 100

alter table countrylanguage 
	add check ((percentage >= 0) and (percentage <= 100));