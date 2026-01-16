select * from ola_data_set;
DESC ola_data_set;
ALTER TABLE ola_data_set 
DROP COLUMN `Vehicle_Images`;


-- 1. Retrieve all successful bookings:    
create View Successful_Bookingss As
select * from ola_data_set where Booking_Status = 'Success';


-- 2. Find the average ride distance for each vehicle type:
create View Average_Ride_Distance_per_Vehicle As
select Vehicle_Type, avg(Ride_Distance) as 'Avg_Distance' from ola_data_set group by Vehicle_Type order by Avg_Distance desc;
 
 
-- 3. Get the total number of cancelled rides by customers:
create View Rides_Canceled_by_Customer As
select Booking_Status, COUNT(*) as 'Count_of_Rides_Canceled' from ola_data_set where Booking_Status = 'Canceled by Customer';


-- 4. List the top 5 customers who booked the highest number of rides:
create View Top_5_Customers As
select Customer_ID,  count(Booking_ID) as 'Rides_Booked' from ola_data_set group by Customer_ID order by Rides_Booked desc limit 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create View Ride_Canceled_due_to_Personal_Car_Issue As
select Canceled_Rides_by_Driver ,  count(*) as 'Count_of_Rides_Canceled' from ola_data_set where Canceled_Rides_by_Driver = 'Personal & Car related issue';


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create View Max_and_Min_Rating_PS As
SELECT Vehicle_Type, 
COALESCE(MAX(CAST(NULLIF(Driver_Ratings, '') AS DECIMAL(3,1))), 0) AS Max_Rating,  COALESCE(MIN(CAST(NULLIF(Driver_Ratings, '') AS DECIMAL(3,1))), 0) AS Min_Rating
FROM ola_data_set 
WHERE Vehicle_Type = 'Prime Sedan';


-- 7. Retrieve all rides where payment was made using UPI:
create View Payment_Method_UPI_RideInfo As
select *  from ola_data_set where Payment_Method = 'UPI';


-- 8. Find the average customer rating per vehicle type:
create View Avg_Customer_Rating_perVehicle As
select Vehicle_Type, avg(Customer_Rating) as 'Avg_Rating' from ola_data_set group by Vehicle_Type order by Avg_Rating desc;


-- 9. Calculate the total booking value of rides completed successfully:
create View Total_BV_of_SR As
select Booking_Status , sum(Booking_Value) as Total_Booking_Value from ola_data_set where Booking_Status = 'Success';


-- 10. List all incomplete rides along with the reason
create View Incomplete_Rides_Reason As
select Booking_ID, Incomplete_Rides_Reason  from ola_data_set where Incomplete_Rides = 'Yes';





-- 1. Retrieve all successful bookings:    
select * from Average_Ride_Distance_per_Vehicle;
-- 2. Find the average ride distance for each vehicle type:
select * from Average_Ride_Distance_per_Vehicle;
-- 3. Get the total number of cancelled rides by customers:
select * from Rides_Canceled_by_Customer;
-- 4. List the top 5 customers who booked the highest number of rides:
select * from Top_5_Customers;
-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from Ride_Canceled_due_to_Personal_Car_Issue;
-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from Max_and_Min_Rating_PS;
-- 7. Retrieve all rides where payment was made using UPI:
select * from Payment_Method_UPI_RideInfo;
-- 8. Find the average customer rating per vehicle type:
select * from Avg_Customer_Rating_perVehicle;
-- 9. Calculate the total booking value of rides completed successfully:
select * from Total_BV_of_SR;
-- 10. List all incomplete rides along with the reason
select * from Incomplete_Rides_Reason;