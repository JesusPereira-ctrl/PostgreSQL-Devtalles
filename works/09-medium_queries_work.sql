-- 1. Total number of posts - 1050

select
	count(*)
from
	posts;

-- 2. Number of published posts - 543

select
	count(*)
from
	posts
where
	published = true;

-- 3. Most recent post
-- 544 - nisi commodo officia...2024-05-30 00:29:21.277

select
	*
from
	posts
order by
	created_at desc
limit 1;

-- 4. Top 10 users with the most posts (includes post count, ID, and name)
/*
4	1553	Jessie Sexton
3	1400	Prince Fuentes
3	1830	Hull George
3	470	Traci Wood
3	441	Livingston Davis
3	1942	Inez Dennis
3	1665	Maggie Davidson
3	524	Lidia Sparks
3	436	Mccoy Boone
3	2034	Bonita Rowe
*/

select
	count(*),
	a.created_by,
	b.name
from
	posts a
inner join users b on
	b.user_id = a.created_by
group by
	a.created_by,
	b.name
order by
	count(*) desc
limit 10;

-- 5. Top 5 posts with the most "claps" (based on the sum of the "counter" column)
/*
692	sit excepteur ex ipsum magna fugiat laborum exercitation fugiat
646	do deserunt ea
542	do
504	ea est sunt magna consectetur tempor cupidatat
502	amet exercitation tempor laborum fugiat aliquip dolore
*/

select
	sum(a.counter),
	b.title
from
	claps a
inner join posts b on
	b.post_id = a.post_id
group by
	b.title
order by
	sum(a.counter) desc
limit 5;

-- 6. Top 5 users who have given the most claps (based on individual vote count, not cumulative)
/*
7	Lillian Hodge
6	Dominguez Carson
6	Marva Joyner
6	Lela Cardenas
6	Rose Owen
*/

select
	count(*),
	b.name
from
	claps a
inner join users b on
	b.user_id = a.user_id
group by
	b.name
order by
	count(*) desc
limit 5;

-- 7. Top 5 users by cumulative votes (sum of the "counter" column)
/*
437	Rose Owen
394	Marva Joyner
386	Marquez Kennedy
379	Jenna Roth
364	Lillian Hodge
*/

select
	sum(a.counter),
	b.name
from
	claps a
inner join users b on
	b.user_id = a.user_id
group by
	b.name
order by
	sum(a.counter) desc
limit 5;

-- 8. Number of users who do NOT have any favorite lists created
-- 329

select
	count(*)
from
	users a
left join user_lists b on
	a.user_id = b.user_id
where
	b.user_id is null;

-- 9. Retrieve a comment by its ID #1
-- Include its replies (both visible and hidden) in the same result set
-- Tip: use UNION
/*
1	    648 1905 elit id...
3058 583 1797 mollit temp...
4649 51 1842 laborum mollit...
4768 835 1447 nostrud nulla...
*/

select
	*
from
	comments a
where
	a.comment_id = 1
union
select
	*
from
	comments a
where
	a.comment_parent_id = 1;

-- 10. Advanced
-- Research json_agg and json_build_object
-- Create a single response line, with the answers
-- from comment with id 1 (comment_parent_id = 1)
-- Show user_id and comment content

-- Expected output:
/*
"[{""user"" : 1797, ""comment"" : ""tempor mollit aliqua dolore cupidatat dolor tempor""}, {""user"" : 1842, ""comment"" : ""laborum mollit amet aliqua enim eiusmod ut""}, {""user"" : 1447, ""comment"" : ""nostrud nulla duis enim duis reprehenderit laboris voluptate cupidatat""}]"
*/

select
	-- json_agg(a.comment_id)
	-- json_build_object(
	--	 'user', a.user_id,
	--	 'comment', a.content
	-- )
	json_agg(json_build_object(
		 'user', a.user_id,
		 'comment', a.content
	 ))
from
	comments a
where
	a.comment_parent_id = 1;

-- 11. Advanced
-- List all top comments (not replies) 
-- And create an additional column "replies" with the responses in JSON format

select
	a.*,
	(
	select
		json_agg(json_build_object(
		 'user', b.user_id,
		 'comment', b.content
	 ))
	from
		comments b
	where
		b.comment_parent_id = a.comment_id
) as replies
from
	comments a
where
	a.comment_parent_id is null;