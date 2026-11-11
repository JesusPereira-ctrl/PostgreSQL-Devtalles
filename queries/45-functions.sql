create or replace
function sayHello(user_name varchar)
returns varchar
as
$$
begin
	return 'Hello ' || user_name;
end
$$
language plpgsql;

select
	sayHello(a.name),
	a.name
from
	users a;

create or replace
function comment_replies(id integer)
returns json
as
$$
declare result json;

begin
	select
		json_agg(json_build_object(
		 	'user', a.user_id,
			'comment', a.content
		)) into result
	from
		comments a
	where
		a.comment_parent_id = id;
		
	return result;
end
$$
language plpgsql;

select
	comment_replies(4);

select
	a.*,
	comment_replies(a.post_id) as replies
from
	comments a
where
	a.comment_parent_id is null;