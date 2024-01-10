-- Craft an SQL query to ascertain the total revenue generated from each channel grouping for the top 5 countries producing the highest revenue.

-- determine row number of countries based on their totalProductRevenue for each channelGrouping
with row_data as 
(
    SELECT *,
           row_number() OVER (partition by channelGrouping ORDER BY totalProductRevenue DESC) AS row_number
    FROM 
    (
    	select 
    		channelGrouping, 
    		country, 
    		SUM(productRevenue) totalProductRevenue
    	from
    		"DWH".ecommerce_session
    	group by channelGrouping, country
    ) ecommerce
)

-- choose only the top 5 from each channelGrouping
SELECT 
	channelGrouping, 
	country, 
	totalProductRevenue
FROM 
    row_data
WHERE
    row_number <= 5;