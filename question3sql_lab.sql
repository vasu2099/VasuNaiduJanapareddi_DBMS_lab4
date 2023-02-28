 #Q3) Displaying the total number of customers based on gender 
# who have placed orders of worth at least Rs.3000.

select count(cus_gender) as TotalNoOfCustomers, cus_gender 
from 
(
	select cus_gender, cus_name from customer as cus
	inner join
	(
		select ord_id, cus_id from `order` where ord_amount >= '3000'
	)
	as o
	on cus.cus_id = o.cus_id
	group by cus.cus_id
)
as T
group by cus_gender