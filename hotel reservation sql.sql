create database hotel;
use hotel;
select * from `hotel`;

## total number of reservation ##
select count(*) as total_reservation 
from `hotel`;

## Most popular meal plan among guests##

select type_of_meal_plan, count(*) as count 
from `hotel` 
group by type_of_meal_plan
order by count 
limit 1;

##Average price per room for
#reservations involving children
select avg(avg_price_per_room) as avg_price
from `hotel`
where no_of_children>0;

##Number of reservations made for the year 20XX#

SELECT COUNT(*) AS reservations_in_year
FROM `hotel`
WHERE YEAR(arrival_date) = 2017;

##Most commonly booked room type:##
SELECT room_type_reserved, COUNT(*) AS count
FROM `hotel`
GROUP BY room_type_reserved
ORDER BY count DESC
LIMIT 1;

##Number of reservations that fall on a weekend##

SELECT COUNT(*) AS weekend_reservations
FROM `hotel`
WHERE no_of_weekend_nights > 0;

##Highest and lowest lead time for reservations##

SELECT MAX(lead_time) AS highest_lead_time, MIN(lead_time) AS lowest_lead_time
FROM hotel;

##Most common market segment type for reservations##

SELECT market_segment_type, COUNT(*) AS count
FROM hotel
GROUP BY market_segment_type
ORDER BY count DESC
LIMIT 1;

##Number of reservations with a booking status of "Confirmed##

SELECT COUNT(*) AS confirmed_reservations
FROM hotel
WHERE booking_status = 'Confirmed';

##Total number of adults and children across all reservations##

SELECT SUM(no_of_adults) AS total_adults, SUM(no_of_children) AS total_children
FROM hotel;

##Average number of weekend nights for reservations involving children##

SELECT AVG(no_of_weekend_nights) AS avg_weekend_nights
FROM hotel
WHERE no_of_children > 0;

##Number of reservations made in each month of the year##

SELECT MONTH(arrival_date) AS month, COUNT(*) AS reservations_count
FROM hotel
GROUP BY MONTH(arrival_date)
ORDER BY month;

##Average number of nights (both weekend and weekday) spent by guests for each room type##

SELECT room_type_reserved, 
       AVG(no_of_weekend_nights + no_of_week_nights) AS avg_total_nights
FROM hotel
GROUP BY room_type_reserved;

##Most common room type and average price for that room type for reservations involving children##

SELECT room_type_reserved, AVG(avg_price_per_room) AS avg_price
FROM hotel
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY COUNT(*) DESC
LIMIT 1;

##Market segment type that generates the highest average price per room##

SELECT market_segment_type, AVG(avg_price_per_room) AS avg_price
FROM hotel
GROUP BY market_segment_type
ORDER BY avg_price DESC
LIMIT 1;



