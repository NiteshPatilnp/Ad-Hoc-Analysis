SELECT
	Month(s.date) as Mno,
    MONTHNAME(s.date) AS Month,
    YEAR(s.date) AS Year,
    ROUND(SUM(g.gross_price * s.sold_quantity), 2) AS Gross_sales_Amount
FROM fact_sales_monthly s
LEFT JOIN fact_gross_price g
    USING(fiscal_year, product_code)
LEFT JOIN dim_customer c
    USING (customer_code)
WHERE c.customer = 'Atliq Exclusive'
GROUP BY YEAR(s.date), Month, Mno
ORDER BY YEAR(s.date), Month(s.date);