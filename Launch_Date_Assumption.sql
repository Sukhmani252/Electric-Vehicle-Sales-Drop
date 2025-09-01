-- Growth comparison of scooter variants in its initial 3 weeks of launch

WITH sprint_calc AS (   /* For Sprint sales */
SELECT  
       CAST(sales_transaction_date AS DATE) AS transaction_date,
       SUM(COUNT(product_id)) OVER (PARTITION BY CAST(sales_transaction_date AS DATE) ORDER BY CAST(sales_transaction_date AS DATE)) AS Sprint,
       ROW_NUMBER() OVER() AS `Day`,   /* i.e Day 1, Day 2 till Day 21 */
       SUM(COUNT(product_id)) OVER (ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS Sprint_7D
FROM zoom_electric.sales 
WHERE product_id IN (
                   SELECT 
                         product_id
				   FROM zoom_electric.products 
                   WHERE model = 'Sprint'
                  )
GROUP BY transaction_date
),
Sprint_LE_calc AS(        /* For Sprint Limited Edition sales */
SELECT  
       CAST(sales_transaction_date AS DATE) AS transaction_date_le,
       SUM(COUNT(product_id)) OVER (PARTITION BY CAST(sales_transaction_date AS DATE) ORDER BY CAST(sales_transaction_date AS DATE)) AS `Sprint_LE`,
       ROW_NUMBER() OVER() AS `Day`,
       SUM(COUNT(product_id)) OVER (ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS Sprint_LE_7D
FROM zoom_electric.sales 
WHERE product_id IN (
                   SELECT 
                         product_id
				   FROM zoom_electric.products 
                   WHERE model = 'Sprint Limited Edition'
                  )
GROUP BY transaction_date_le
)
SELECT   
         s.`Day`,
         s.Sprint,
         sle.`Sprint_LE`,
         CASE WHEN s.`Day` > 7 THEN CONCAT(ROUND((100*(s.Sprint_7D-LAG(s.Sprint_7D) OVER())/LAG(s.Sprint_7D) OVER()),2),'%') ELSE null END AS `Sprint Growth %`,
         CASE WHEN sle.`Day` > 7 THEN CONCAT(ROUND((100*(sle.Sprint_LE_7D-LAG(sle.Sprint_LE_7D) OVER())/LAG(sle.Sprint_LE_7D) OVER()),2),'%') ELSE null END AS `Sprint LE Growth %`
FROM Sprint_LE_calc sle JOIN sprint_calc s
ON sle.`Day` = s.`Day` 
LIMIT 22;