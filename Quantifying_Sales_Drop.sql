-- Sales growth percentage for Sprint scooter

WITH cum7D_units_sold AS(
SELECT 
       CAST(sales_transaction_date AS DATE) AS transaction_date,
       /* There are multiple transactions on a single date, so partition by is used */
       SUM(COUNT(product_id)) OVER (PARTITION BY CAST(sales_transaction_date AS DATE) ORDER BY CAST(sales_transaction_date AS DATE)) AS units_sold,
       ROW_NUMBER() OVER() AS row_num, 
       SUM(COUNT(product_id)) OVER (ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS Cumm_Total_7D /* 7 Days Running Total */
FROM zoom_electric.sales
WHERE product_id IN (
                   SELECT 
                         product_id
				   FROM zoom_electric.products 
                   WHERE model = 'Sprint'
                  ) ((Sales at t - Sales at t-1) / Sales at t-1)
GROUP BY transaction_date 
)

SELECT 
       transaction_date,
       units_sold,
       CASE WHEN row_num > 6 THEN  Cumm_Total_7D ELSE null END AS Cumm_Total_7D, /* to get running total after 7 days of launch date */
       CASE WHEN row_num > 7 THEN  LAG(Cumm_Total_7D) OVER() ELSE null END AS Cumm_Total_7D_Prev, /* previous day running total */
	   CASE WHEN row_num > 7 THEN CONCAT(ROUND((100*(Cumm_Total_7D-LAG(Cumm_Total_7D) OVER())/LAG(Cumm_Total_7D) OVER()),2),'%') ELSE null END  AS `Growth %` /* ((Sales at t - Sales at t-1) / Sales at t-1) */
FROM cum7D_units_sold
ORDER BY transaction_date
LIMIT 22;  /* growth rate of 21 days after launch date should be observed to identify the trend and reason for 20% decline after 2 weeks */ 


 

       