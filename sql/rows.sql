select
	*
from apTable
where _epoch in (
	select
		_epoch
	from (
		select
			_epoch,
			count(distinct _user_id) as c
		from apTable
		group by _epoch
		having c > 1
		order by c desc
	) as innerView1
)
order by _epoch