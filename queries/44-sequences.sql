create sequence user_sequence;

drop sequence user_sequence;

select
	currval('user_sequence'),
	nextval('user_sequence'),
	currval('user_sequence');

create table users6 (
	user_id integer primary key default nextval('user_sequence'),
	username varchar
);