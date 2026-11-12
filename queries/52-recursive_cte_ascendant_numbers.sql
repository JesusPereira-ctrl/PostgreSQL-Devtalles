with recursive counter(val) as (
		select 1 as val
	union
		select val + 1 from counter where val < 10
)
select * from counter order by val asc;