-- Task involving country-language data

-- Create the language table

-- Define sequence and data type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;

-- Define the table
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- Add a column to the country-language table
ALTER TABLE countrylanguage
ADD COLUMN language_code varchar(3);

insert into language (name)
	select distinct language from countrylanguage order by language asc;

select * from language;

-- Start with a SELECT statement to verify the records to be updated

select 
	language,
	(select code from language b where a.language = b.name)
from 
	countrylanguage a;

-- Update all records

update 
	countrylanguage a
set
	language_code = (select code from language b where a.language = b.name);

-- Change the data type of the language_code column in the country-language table to int4

alter table countrylanguage
	alter column language_code type int4
	using language_code::integer;

-- Create the foreign key and NOT NULL constraints for language_code

alter table countrylanguage
	add constraint countrylanguage_language_fk
	foreign key (language_code)
	references language (code);

-- Review the created objects

select * from countrylanguage;
