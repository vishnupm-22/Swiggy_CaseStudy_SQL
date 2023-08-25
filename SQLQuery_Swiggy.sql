select * from users
select * from orderdetails

1. /* Find customers who have not ordered */

select name from users where user_id not in (select user_id from orders) 

select * from menu
select * from food

2./* Avg Price of dish */

select f_id,AVG(price) as avg_price from menu GROUP By f_id

select f.f_name,AVG(price) as Avg_price
from menu m
JOIN food f
ON m.f_id = f.f_id
GROUP BY m.f_id

3. /* find top restaurants in terms of no of orders for a given month */

select r.r_name,count(*) as month_no 
from orders o
join restaurants r
on o.r_id = r.r_id
where Month(date) like '5'
group by o.r_id
order by count(*) desc 

select * from restaurants
select * from orders

4. /*restaurant with month sales > x  */

select r.r_name,sum(amount) as 'revenue'
from orders o
join restaurants r
on o.r_id = r.r_id
where Month(date) like '6'
group by r.r_id,r.r_name
having sum(amount) >500

5. /*show all orders with order details for a particular customer in a particular date */

select o.order_id,r.r_name,od.f.f_name from orders o
join restaurants r
on o.r_id = r.r_id
join orderdetails od
on o.order_id = od.order_id
join food f
on f.f_id = od.f_id
where user_id =
(select user_id from users 
where name like 'Ankit')
and date > '2022-06-10' and date < '2022-07-10'

6. /*show all orders with order details for a particular customer in a particular date */


select o.order_id,r.r_name,f.f_name from orders o
join restaurants r
on o.r_id = r.r_id
join orderdetails od
on o.order_id = od.order_id
join food f
on f.f_id = od.f_id
where user_id =
(select user_id from users 
where name like 'Nitish')
and date > '2022-06-10' and date < '2022-07-10'


select * from restaurants
select * from orders
select * from users

7. /* find restaurants with max repeated customers */
select top 1 r.r_name,count(*) as loyalcustomers
from (select count(*) as visits,r_id,user_id from orders  
group by r_id, user_id
having count(*) >1) t
join restaurants r
on r.r_id = t.r_id 
group by t.r_id,r.r_name
order by loyalcustomers
desc



