create database air;

show databases;

use air;

select * from air;
desc air;

select * from air1;

desc air1;

alter table air1 modify column name varchar(255);

select * from air1;

desc air1;

rename table air to booking ;
rename table air1 to listing  ;

select * from booking;

select * from listing;

#3.           Write a query to fetch total listings from the listings table

select count(id) from listing;

#4.           Write a query to fetch total listing_id from the booking_details table

select count(listing_id) from booking; 

#5.           Write a query to fetch host ids from listings table
select host_id from listing l ;

#6.           Write a query to fetch all unique host name from listings table
select distinct host_id from listing l ;

#7.           Write a query to show all unique neighbourhood_group from listings table
select distinct neighbourhood_group from listing l ;

#8.           Write a query to show all unique neighbourhood from listings table
select distinct neighbourhood from listing l ;

#9.           Write a query to fetch unique room_type from listings tables
select distinct room_type from listing l ;


#10.      Write a query to show all values of Brooklyn & Manhattan from listings tables
select * from listing l where neighbourhood_group in ('Brooklyn' , 'Manhattan') ;

#11.      Write a query to show maximum price from booking_details table
select max(price)  from booking b ;


#12.      Write a query to show minimum price fron booking_details table
select min(price) from booking b ;

#13.      Write a query to show average price from booking_details table
select avg(price) from booking;

#14.      Write a query to show minimum value of minimum_nights from booking_details table
select min(minimum_nights) from booking;

#15.      Write a query to show maximum value of minimum_nights from booking_details table

select max(minimum_nights) from booking;

#16.      Write a query to show average availability_365

select avg(availability_365) from booking;

#17.      Write a query to show id , availability_365 and all availability_365 values greater than 300

select listing_id ,availability_365 from booking where availability_365 >=300;

#18.      Write a query to show count of id where price is in between 300 to 400 
select count(listing_id) from booking where price between 300 and 400;


#19.      Write a query to show count of id where minimum_nights spend is less than 5
select minimum_nights,count(listing_id) from booking 
where minimum_nights <5
group by minimum_nights 
order by count(listing_id) ;

#20.      Write a query to show count where minimum_nights spend is greater than 100
select minimum_nights,count(listing_id) from booking 
where minimum_nights >100
group by minimum_nights 
order by count(listing_id) ;


#21.      Write a query to show all data of listings & booking_details

select * from booking inner join listing on booking.listing_id = listing.id ;

#22.      Write a query to show host name and price
select booking.price , listing.host_name from listing inner join booking on listing.id =booking.listing_id ;

#23.      Write a query to show room_type and price
select listing.room_type , booking.price from booking inner join listing on booking.listing_id = listing.id ;

#24.      Write a query to show neighbourhood_group & minimum_nights spend
select listing.neighbourhood_group , booking.minimum_nights from booking inner join listing on booking.listing_id =listing.id ;

#25.      Write a query to show neighbourhood & availability_365

select listing.neighbourhood , booking.availability_365 from booking inner join listing on booking.listing_id =listing.id ;

#26.      Write a query to show total price by neighbourhood_group

select listing.neighbourhood_group , count(booking.price) from booking inner join listing on booking.listing_id = listing.id 
group by listing.neighbourhood_group 
order by count(booking.price)desc ;

#27.      Write a query to show maximum price by neighbourhood_group -------------------------------

select listing.neighbourhood_group , max(booking.price) from booking inner join listing on booking.listing_id =listing_id 
group by listing.neighbourhood_group 
order by max(booking.price) desc;

#28.      Write a query to show maximum night spend by neighbourhood_group

select listing.neighbourhood_group , max(booking.minimum_nights) from booking inner join listing on booking.listing_id = listing_id 
group by listing.neighbourhood_group 
order by max(booking.minimum_nights) desc;

#29.      Write a query to show maximum reviews_per_month spend by neighbourhood

select listing.neighbourhood , max(booking.reviews_per_month) from booking inner join listing on booking.listing_id =listing_id 
group by listing.neighbourhood
order by max(booking.reviews_per_month) desc;

#30.      Write a query to show maximum price by room type

select listing.room_type , max(booking.price) from booking inner join listing on booking.listing_id =listing_id 
group by listing.room_type 
order by max(booking.price) desc;

#31.      Write a query to show average number_of_reviews by room_type

select listing.room_type , avg(booking.number_of_reviews) from booking
inner join listing 
on booking.listing_id =listing_id 
group by listing.room_type 
order by avg(booking.number_of_reviews) desc;

#32.      Write a query to show average price by room type

select listing.room_type , avg(booking.price) from booking inner join listing on booking.listing_id =listing_id 
group by listing.room_type 
order by avg(booking.price) desc;

#33.      Write a query to show average night spend by room type

select listing.room_type , avg(booking.minimum_nights) from booking inner join listing on booking.listing_id =listing_id 
group by listing.room_type
order by avg(booking.minimum_nights) desc;


#34.      Write a query to show average price by room type but average price is less than 100 ----------#having cluse

select listing.room_type , avg(booking.price) from booking inner join listing on booking.listing_id =listing_id
group by listing.room_type
having avg(booking.price) <100 ;


#35.      Write a query to show average night by neighbourhood and average_nights is greater than 5

select listing.neighbourhood ,avg(booking.minimum_nights) from booking inner join listing on booking.listing_id =listing_id
group by listing.neighbourhood 
having avg(booking.minimum_nights) >5;




#36.      Write a query to show all data from listings where price is greater than 200 using sub-query. -------- #subqueriess

#select * from listing inner join booking on listing_id =booking.listing_id where booking.price >200;

select * from listing  where listing.id in (select booking.listing_id from booking where Price  > 200);

#select * from listing  where id in (select booking.price from booking where booking.price>200);



#37.      Write a query to show all values from booking_details table where host id is 314941 using sub-query.

#select * from booking inner join  listing on booking.listing_id = listing_id where listing.host_id =314941;

select * from booking where booking.listing_id in ( select listing.id from listing where host_id = 314941);


#38.      Find all pairs of id having the same host id, each pair coming once only.

select l1.id , l2.id ,l1.host_id from listing l1 join listing l2 on l1.host_id = l2.host_id and l1.id < l2.id;


#39.      Write an sql query to show fetch all records that have the term cozy in name

select name from listing where name in ('cozy');
select name  from listing where name like '%cozy%';

#40.    Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group

select booking.price , listing.host_id ,listing.neighbourhood_group from listing inner join booking on listing_id =booking.listing_id 
where listing.neighbourhood_group ='Manhattan';

#41.      Write a query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood, also make sure price is greater than 100

select booking.price ,listing_id ,listing.host_name ,listing.neighbourhood from listing inner join booking on listing_id =booking.listing_id 
where neighbourhood in ('Upper West Side','Williamsburg') and price > 100;


#42.      Write a query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant

select listing.id , listing.host_id , listing.neighbourhood , booking.price from booking inner join listing on booking.listing_id =listing_id 
where  listing.neighbourhood ='Bedford-Stuyvesant' and listing.host_name = 'Elise';

#43.      Write a query to show host_name, availability_365,minimum_nights only for 100+ availability_365 and minimum_nights

select listing.host_id , listing.host_name ,booking.availability_365 from booking inner join listing on booking.listing_id =listing_id 
where booking.minimum_nights >100 and minimum_nights >100;

#44.      Write a query to show to fetch id , host_name , number_of_reviews, and reviews_per_month but show only that records where number of reviews are 500+ and review per month is 5+

select listing.host_id , listing.host_name , booking.number_of_reviews ,booking.reviews_per_month from booking inner join listing on booking.listing_id =listing_id 
where booking.number_of_reviews >500 and booking.reviews_per_month >5;

#45.      Write a query to show neighbourhood_group which have most total number of review

select listing.neighbourhood_group , sum(booking.number_of_reviews) from booking inner join listing on booking.listing_id =listing_id 
group by  listing.neighbourhood_group
order by sum(booking.number_of_reviews) desc
limit 1;

#46.      Write a query to show host name which have most cheaper total price


select listing.host_name ,sum(booking.price) from booking inner join listing on booking.listing_id =listing_id 
group by listing.host_name
order by sum(booking.price) asc 
limit 1;

#47.      Write a query to show host name which have most costly total price

select listing.host_name ,sum(booking.price) from booking inner join listing on booking.listing_id =listing_id 
group by listing.host_name
order by sum(booking.price) desc 
limit 1;

#48.      Write a query to show host name which have max price using sub-query


select listing.host_name , booking.price from booking inner join listing on booking.listing_id =listing_id 
where booking.price in (select max(price) from booking);

#49.      Write a query to show neighbourhood_group where price is less than 100


select listing.neighbourhood_group , booking.price from booking inner join listing on booking.listing_id =listing_id 
where listing_id in(select listing_id from booking  where price <100);


#50.      Write a query to find max price, average availability_365 for each room type and order in ascending by maximum price.

select listing.room_type ,listing.neighbourhood_group , max(booking.price) , avg(booking.availability_365)
from booking inner join listing on booking.listing_id =listing_id 
group by listing.room_type 
order by max(booking.price) asc;






