-- Sales growth percentage for Sprint scooter

WITH cum7D_units_sold AS(
SELECT 
       CAST(sales_transaction_date AS DATE) AS transaction_date,
       SUM(COUNT(product_id)) OVER (PARTITION BY CAST(sales_transaction_date AS DATE) ORDER BY CAST(sales_transaction_date AS DATE)) AS units_sold,
       ROW_NUMBER() OVER() AS row_num,
       SUM(COUNT(product_id)) OVER (ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS Cumm_Total_7D
FROM zoom_electric.sales
WHERE product_id IN (
                   SELECT 
                         product_id
				   FROM zoom_electric.products 
                   WHERE model = 'Sprint'
                  )
GROUP BY transaction_date
)

SELECT 
       transaction_date,
       units_sold,
       CASE WHEN row_num > 6 THEN  Cumm_Total_7D ELSE null END AS Cumm_Total_7D,
       CASE WHEN row_num > 7 THEN  LAG(Cumm_Total_7D) OVER() ELSE null END AS Cumm_Total_7D_Prev,
	   CASE WHEN row_num > 7 THEN CONCAT(ROUND((100*(Cumm_Total_7D-LAG(Cumm_Total_7D) OVER())/LAG(Cumm_Total_7D) OVER()),2),'%') ELSE null END  AS `Growth %`
FROM cum7D_units_sold
ORDER BY transaction_date
LIMIT 22;


 

       