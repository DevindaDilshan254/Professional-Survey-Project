use ola;
show tables;
#.bengaluru_rides_march
select * from bengaluru_rides_march;
select * from average_ride_distance_for_each_vehicle;
select * from bengaluru_rides_march;

#.select count(*) from bengaluru_rides_march where `Cancelled Rides by Customer`=1;
create view NO_rides_Cancelled_by_Customer as select count(*) from  bengaluru_rides_march where `Booking Status`="Cancelled by Customer";
select * from NO_rides_Cancelled_by_Customer;

create view top_5_customers as select `Customer ID`,count(`Booking ID`) from bengaluru_rides_march group by `Customer ID` order by count(`Booking ID`) desc limit 5 ;
select * from top_5_customers;

create view No_rides_cancel_by_cus_P_C_issue as select count(*) from bengaluru_rides_march where `Reason for cancelling by Customer`="Personal & Car related issues";
select * from No_rides_cancel_by_cus_P_C_issue;

create view min_and_max_driver_rating_in_prime_sedan as select max(`Driver Ratings`) as max_driver_rate_for_prime_sedan,min(`Driver Ratings`) as min_driver_rate_for_prime_sedan from bengaluru_rides_march where `Vehicle Type`="Prime Sedan";
select * from min_and_max_driver_rating_in_prime_sedan;

create view average_cus_rate_for_vehicle_type as select `Vehicle Type`,avg(`Customer Rating`) from bengaluru_rides_march group by `Vehicle Type`;
select * from average_cus_rate_for_vehicle_type;

create view sum_of_success_ride_values as select sum(`Booking Value`) from bengaluru_rides_march where `Booking Status`="Success";
select * from sum_of_success_ride_values;

select `Booking ID`,`Incomplete Rides Reason` from bengaluru_rides_march where `Booking Status`="Incomplete";