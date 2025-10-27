SELECT transaction_date,
        DAYNAME(transaction_date) AS day_name,
        CASE WHEN day_name IN ('Sun','Sat') THEN 'Weekend'
        ELSE 'Weekday'
        End AS day_classification,
        MONTHNAME(transaction_date) AS month_name,

------  transaction_time,
        CASE 
            WHEN transaction_time BETWEEN '06:00:00'AND'08:59:59' THEN 'Early Morning'
            WHEN transaction_time BETWEEN '09:00:00'AND'11:59:59' THEN 'Mid-Morning'
            WHEN transaction_time BETWEEN '12:00:00'AND'14:59:59' THEN 'Early Afternoon'
            WHEN transaction_time BETWEEN '15:00:00'AND'17:59:59' THEN 'Late-Afternoon'
            WHEN transaction_time BETWEEN '18:00:00'AND'20:59:59' THEN 'Evening'
        End AS time_bucket,
    
    HOUR(transaction_time) AS hour_of_day,
    
-----------
    store_location,
    product_category,
    product_detail,
    product_type,

---------
    COUNT(DISTINCT transaction_id) AS number_of_sales,

------

transaction_qty*unit_price AS Revenue
    
FROM "BRIGHT"."PUBLIC"."COFFEE_SHOP"

GROUP BY ALL

ORDER BY Revenue ASC;
