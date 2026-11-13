create extension "pgcrypto";

insert into "user"(username, password)
values(
	'melissa',
	crypt('123456', gen_salt('bf'))
);

select
	count(*)
from
	"user" a
where
	a.username = 'fernando' and password = crypt('123456', a.password);