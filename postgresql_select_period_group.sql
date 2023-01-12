SELECT tag, DATE_TRUNC('day',"timestamp"), count(*), (count(*)*100)/24 as percent
	FROM public.table
	where "timestamp" between '2023-01-01' and NOW()
	group by tag, DATE_TRUNC('day',"timestamp")
	order by tag, DATE_TRUNC('day',"timestamp")
