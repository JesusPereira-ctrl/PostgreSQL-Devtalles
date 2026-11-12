select 5;

-- name memory table
-- fields that we will have
with recursive countdown(val) as (
		-- initialization => 1st level or initial values
		-- values(5)
		select 5 as val
	union
		-- recursive query
		select val - 1 from countdown where val > 1
)
-- select of the fields
select * from countdown;