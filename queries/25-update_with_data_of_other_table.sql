update country a
	set continent = (select "code" from continent b where b.name = a.continent);