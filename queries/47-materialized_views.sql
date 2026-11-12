create materialized view comments_per_week_mat as
select	
	date_trunc('week', a.created_at) as weeks,
	sum(b.counter) as total_claps,
	count(distinct a.post_id) as number_of_posts,
	count(*) as number_of_claps
from
	posts a
inner join claps b on
	b.post_id = a.post_id
group by
	weeks
order by
	weeks desc;

select * from comments_per_week a;

select * from comments_per_week_mat a;

refresh materialized view comments_per_week_mat;

select * from posts a where a.post_id = 1;