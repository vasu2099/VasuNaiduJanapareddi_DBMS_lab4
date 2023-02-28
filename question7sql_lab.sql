# Q7) To Display the Id and Name of the Product ordered 
# after “2021-10-05”.


select p.pro_id, p.pro_name from product as p 
inner join 
(
	select sp.pro_id, sp.pricing_id from supplier_pricing as sp
	inner join
	(
		select pricing_id from `order` where ord_date > "2021-10-05"
	) 
	as o
	on sp.pricing_id = o.pricing_id
) 
as sp_o
on p.pro_id = sp_o.pro_id;
