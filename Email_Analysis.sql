-- Email Campaign Analysis

SELECT * FROM zoom_electric.email_subject WHERE email_subject LIKE '%Sprint%'; 
/* "Sprint Up your Ride" is the email_subject and email_subject_id is 7 for email campaign of Sprint scooters */

-- Email Campaign Summary of Sprint scooters
WITH summary AS (
SELECT 
       COUNT(customer_id) AS 'Email_Sent',
	   SUM(CASE WHEN opened = 't' THEN 1 ELSE 0 END) AS 'Opened',
       SUM(CASE WHEN clicked = 't' THEN 1 ELSE 0 END) AS 'Clicked',
       SUM(CASE WHEN bounced = 't' THEN 1 ELSE 0 END) AS 'Bounced'
FROM zoom_electric.emails
WHERE email_subject_id = 7
)

-- KPIs for Campaign Performance - Opening Rate, Click Rate
-- Benchmark for Quality Campaign : [ Opening Rate - 18%, Click Rate - 8% ]

-- Opening Rate = ( Emails Opened ) / (E-mail sent - Bounced)
-- Click Rate = ( Emails Clicked ) / (E-mail sent - Bounced) 
SELECT 
       ROUND( Opened * 100 / ( Email_Sent - Bounced ), 2) AS 'Opened Percentage Value',
       ROUND( Clicked * 100 / ( Email_Sent - Bounced ), 2) AS 'Clicked Percentage Value'
FROM summary; 


