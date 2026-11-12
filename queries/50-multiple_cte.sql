with claps_per_post as (
	select
		a.post_id,
		sum(a.counter)
		from claps a
	group by
		a.post_id
), posts_from_2023 as (
	select
		*
	from
		posts a
	where
		a.created_at between '2023-01-01' and '2023-12-31'
)
select
	*
from
	claps_per_post
where
	claps_per_post.post_id in (select post_id from posts_from_2023);