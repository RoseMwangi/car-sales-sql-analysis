--Totas sales revenue
SELECT SUM(sellingprice) AS total_sales_revenue
FROM `analyzing-car-sales.car_sales_analysis.overall_sales`;

--Average selling price
SELECT AVG(sellingprice) AS avg_sellingprice
FROM `analyzing-car-sales.car_sales_analysis.overall_sales` ;

--Max sellingprice
SELECT MAX(sellingprice) AS max_sellingprice
FROM `analyzing-car-sales.car_sales_analysis.overall_sales` ;

--Minimum sellingprice
SELECT MIN(sellingprice) AS min_sellingprice
FROM `analyzing-car-sales.car_sales_analysis.overall_sales` ;


--which color of cars is most bought
WITH majority_colors AS (
   SELECT *
   FROM `analyzing-car-sales.car_sales_analysis.overall_sales`
   WHERE color IS NOT NULL
     AND NOT REGEXP_CONTAINS(color, r'^\d+$')
      AND color NOT IN ('-', '—')     
)
SELECT color, COUNT(*) AS total_sales
FROM majority_colors
GROUP BY color
ORDER BY total_sales DESC;


--Top Selling Car Brands
SELECT make, COUNT(*) AS total_sales
FROM `analyzing-car-sales.car_sales_analysis.overall_sales`
GROUP BY make
ORDER BY total_sales DESC 
LIMIT 10;


--just checking how odometer values are
SELECT odometer
FROM `analyzing-car-sales.car_sales_analysis.overall_sales`
LIMIT 5;


--Group odometer values into 4 buckets : Then, calculate the average selling price for each group.

WITH odometer_bucket AS (
  SELECT sellingprice, odometer,
   CASE
       WHEN odometer <20000 THEN 'Very low'
       WHEN odometer >=20000 AND odometer <50000 THEN 'Low'
       WHEN odometer >=50000 AND odometer <100000 THEN 'Medium'
       ELSE 'High'
    END AS mileage_category
  FROM `analyzing-car-sales.car_sales_analysis.overall_sales`

)
SELECT mileage_category, ROUND(AVG(sellingprice),2) AS avg_price
FROM odometer_bucket
GROUP BY mileage_category
ORDER BY avg_price DESC ;

--Average Price by Car Brand
SELECT make, ROUND(AVG(sellingprice),2) AS avg_price
FROM `analyzing-car-sales.car_sales_analysis.overall_sales`
GROUP BY make
ORDER BY avg_price DESC 
LIMIT 10;


--just checking the date strings before casting them
SELECT saledate
FROM `analyzing-car-sales.car_sales_analysis.overall_sales`
LIMIT 100 ;


--Monthly Revenue
WITH cleaned_dates AS (
  SELECT 
  sellingprice,saledate,
  PARSE_TIMESTAMP('%a %b %d %Y %H:%M:%S', SUBSTR(saledate, 1, 24)) AS parsed_ts,
  EXTRACT(MONTH FROM PARSE_TIMESTAMP('%a %b %d %Y %H:%M:%S', SUBSTR(saledate, 1, 24))) AS sale_month
FROM `analyzing-car-sales.car_sales_analysis.overall_sales`
WHERE REGEXP_CONTAINS(saledate, r'\w{3} \w{3} \d{2} \d{4} \d{2}:\d{2}:\d{2}')

)
SELECT sale_month, SUM(sellingprice) AS total_sales
FROM cleaned_dates
GROUP BY sale_month
ORDER BY sale_month ASC ;



--which state has made the most sales
SELECT state, COUNT(*) AS total_sales
FROM `analyzing-car-sales.car_sales_analysis.overall_sales`
WHERE REGEXP_CONTAINS(state, r'^[a-z]{2}$')
GROUP BY state
ORDER BY total_sales DESC ;
