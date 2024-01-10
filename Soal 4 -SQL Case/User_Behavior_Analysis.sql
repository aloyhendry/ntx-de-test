-- Derive insights into user behavior. Calculate metrics like average `timeOnSite`, average `pageviews`, 
--and average `sessionQualityDim` for each `fullVisitorId`. Identify users who spend above-average time on the site but view fewer pages than the average user.


-- calculate average data for all of data
WITH average_data AS
(
	select 
		AVG(timeOnSite) timeOnSite, 
		AVG(pageviews) pageviews
	from "DWH".ecommerce_session
)


SELECT 
    fullVisitorId,
    AVG(timeOnSite) AS avgTimeOnSite,
    AVG(pageviews) AS avgPageviews,
    AVG(sessionQualityDim) AS avgSessionQuality
FROM 
    "DWH".ecommerce_session
GROUP BY 
    fullVisitorId
-- filter some to identify the user that have above-average time on the site but view fewer pages than the average user
HAVING 
    AVG(timeOnSite) > (SELECT timeOnSite FROM average_data) 
    AND AVG(pageviews) < (SELECT pageviews FROM average_data)

