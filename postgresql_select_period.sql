SELECT id, tag, "timestamp", data
	FROM public.table
	where tag = 'TAG-01' and
	"timestamp" between '2023-01-13' and '2023-01-24'
	order by "timestamp" desc
	limit 5000;