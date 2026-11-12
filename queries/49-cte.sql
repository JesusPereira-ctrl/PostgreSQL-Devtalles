with posts_week_2024 as (
	select
		date_trunc('week'::text, posts.created_at) as weeks,
		sum(claps.counter) as total_claps,
		count(distinct posts.post_id) as number_of_posts,
		count(*) as number_of_claps
	from
		posts
	join claps on
		claps.post_id = posts.post_id
	group by
		date_trunc('week'::text, posts.created_at)
	order by
		date_trunc('week'::text, posts.created_at) desc
)
select
	*
from
	posts_week_2024
where
	weeks between '2024-01-01' and '2024-12-31' and total_claps >= 600;