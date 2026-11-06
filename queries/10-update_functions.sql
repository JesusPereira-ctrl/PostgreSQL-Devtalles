update 
	users
set 
	first_name = substring(name, 0, position(' ' in name)),
	last_name = substring(name, position(' ' in name) + 1);