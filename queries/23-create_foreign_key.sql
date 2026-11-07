alter table city
	add constraint fk_country_code
	foreign key (countrycode)
	references country (code); -- ON DELETE CASCADE