alter table country
	alter column continent type int4
	using continent::integer;

alter table country
	alter column continent type int4
	using cast(continent as integer)integer;