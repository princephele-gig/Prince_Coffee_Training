--- First Check all the data
SELECT*
FROM `retail_analysis`.`default`.`bright_coffee_shop_`
limit 10;

--- A. Check Date Range
-- Data start date :2023-01-01
SELECT MIN(transaction_date) AS start_date
FROM `retail_analysis`.`default`.`bright_coffee_shop_`;

--- B. Check name of the store locations
SELECT DISTINCT store_location
FROM `retail_analysis`.`default`.`bright_coffee_shop_`;

--- C. Check the products sold
SELECT DISTINCT product_category
FROM `retail_analysis`.`default`.`bright_coffee_shop_`;

--- D. Check the products details
SELECT DISTINCT product_detail
FROM `retail_analysis`.`default`.`bright_coffee_shop_`;

--- E. Check the product category and products details
SELECT DISTINCT product_category AS category,
                product_detail AS product_name
FROM `retail_analysis`.`default`.`bright_coffee_shop_`;

--- F. Check the product type, category and details
SELECT DISTINCT product_type,
                product_category AS category,
                product_detail AS product_name
FROM `retail_analysis`.`default`.`bright_coffee_shop_`;

--- G. Check time of day the store perfomrs best
SELECT Count(transaction_qty),
       Case
       When Hour (transaction_time) >6 AND Hour (transaction_time) <7 Then 'Early Birds'
       When Hour (transaction_time) >7 AND Hour (transaction_time) <10 Then 'Morning Rush'
       When Hour (transaction_time) >10 AND Hour (transaction_time) <12 Then 'Brunch Time'
       When Hour (transaction_time) >12 AND Hour (transaction_time) <15 Then 'Day Lunch Time'
       When Hour (transaction_time) >15 AND Hour (transaction_time) <18 Then 'Afternoon'
       Else 'Evening'
       End As time_intervals
FROM `retail_analysis`.`default`.`bright_coffee_shop_`
Group By time_intervals;
