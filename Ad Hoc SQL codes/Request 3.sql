SELECT
	segment,
	count(product) as product_count
FROM dim_product p 
GROUP BY segment
ORDER BY product_count desc;