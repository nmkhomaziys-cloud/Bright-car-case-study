SELECT
  *
FROM
  "BRIGHT_CAR"."CAR"."CAR_SALES"
LIMIT
  300;
--Cheking the categorial data
  select distinct make
  from bright_car.car.car_sales;
  select distinct model
  from bright_car.car.car_sales;
select distinct interior
 from bright_car.car.car_sales; 
 select distinct color
 from bright_car.car.car_sales;
 select distinct year
 from bright_car.car.car_sales;
select distinct transmission
from bright_car.car.car_sales;

--Checking the first and last operating time
select min(saledate)
from bright_car.car.car_sales;
select max(saledate)
from bright_car.car.car_sales;
---------------------

select try_to_timestamp_ntz(saledate,'DY Mon DD YYYY HH24:MI:SS') AS SALE_TIMESTAMP, dayname(try_to_timestamp_ntz(saledate,'DY Mon DD YYYY HH24:MI:SS')) as day_name, case
when day_name in ('Sun,Sat') then 'Weekend'
else 'weekday'
end as day_classification,
monthname(try_to_timestamp_ntz(saledate,'DY Mon DD YYYY HH24:MI:SS')) as month_name,to_varchar(SALE_TIMESTAMP,'HH24:MI:SS') AS sale_time, CASE 
WHEN sale_time BETWEEN '00:00:00' AND '03:59:59' then 'Night'
WHEN sale_time BETWEEN'04:00:00' AND'11:59:59' THEN 'Morning'
when sale_time between '12:00:00' and '17:59:59' then 'Afternoon'
end as time_bucket,
----cATEGORICAL data
year,make, model,transmission,body,transmission, state,condition,odometer,color,interior, seller,mmr,sellingprice,
-- calculate the difference between selling price and mmr
(sellingprice-mmr) as gain_or_loss

from bright_car.car.car_sales
group by all;
