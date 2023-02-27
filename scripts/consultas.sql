-- retorna o pedido, o nome do produto, o preço do produto, o preço do pedido, a diferença do preço do produto e do pedido
SELECT 
    order_id, 
    product_name,
    od.unit_price AS order_price, 
    p.unit_price AS product_price, 
    (p.unit_price - od.unit_price) AS price_diff,
    quantity, 
    discount
FROM order_details AS od
LEFT JOIN products AS p
ON od.product_id = p.product_id
ORDER BY price_diff DESC;


--retorna o primeiro nome do vendedor, o total de vendas(quantidade) e o total de vendas em dolars
SELECT 
    e.first_name AS name,
    COUNT(o.order_id) AS total_sales,
    ROUND(SUM(od.unit_price * od.quantity)) AS total_sales_dollars
FROM employees AS e
LEFT JOIN orders AS o
ON e.employee_id = o.employee_id
LEFT JOIN order_details AS od
ON o.order_id = od.order_id
GROUP BY name;


--retorna os 10 produtos mais caros
SELECT 
    product_name,
    unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 10;

--cria uma tabela das vendas por fornecedor em 2020, uma tabela das vendas por fornecedor em 2021,
retornando esses dados e a diferença entre as vendas de 2021 e 2020
WITH sales_2020 AS (
    SELECT 
        company_name,
        SUM(od.unit_price * od.quantity) AS total_sales_dollars_2020
    FROM suppliers AS s
    LEFT JOIN products AS p
    ON s.supplier_id = p.supplier_id
    LEFT JOIN order_details AS od
    ON p.product_id = od.product_id
    LEFT JOIN orders AS o
    ON od.order_id = o.order_id
    WHERE order_date BETWEEN '2020-01-01' AND '2020-12-31'
    GROUP BY company_name),
sales_2021 AS (
    SELECT 
       	company_name,
        SUM(od.unit_price * od.quantity) AS total_sales_dollars_2021
    FROM suppliers AS s
    LEFT JOIN products AS p
    ON s.supplier_id = p.supplier_id
    LEFT JOIN order_details AS od
    ON p.product_id = od.product_id
    LEFT JOIN orders AS o
    ON od.order_id = o.order_id
    WHERE order_date BETWEEN '2021-01-01' AND '2021-12-31'
    GROUP BY company_name)
SELECT 
	s0.company_name,
	s1.total_sales_dollars_2021 AS total_sales_2021,
	s0.total_sales_dollars_2020 AS total_sales_2020,
	(s1.total_sales_dollars_2021 - s0.total_sales_dollars_2020) AS sales_diff
FROM sales_2020 AS s0
LEFT JOIN sales_2021 AS s1
ON s0.company_name = s1.company_name;


--selecionar as cinco categorias de produtos mais vendidas por ano
WITH categories_sales_2020 AS (
    SELECT
        EXTRACT(year FROM o.order_date) AS date_year,
        c.category_name AS category,
        ROUND(SUM(od.unit_price * od.quantity - od.discount)) AS total_sales
    FROM categories AS c
    LEFT JOIN products AS p
    ON c.category_id = p.category_id
    LEFT JOIN order_details AS od
    ON p.product_id = od.product_id
    LEFT JOIN orders AS o
    ON od.order_id = o.order_id
    WHERE date_year = '2020'
    GROUP BY date_year, category
    ORDER BY total_sales DESC
    LIMIT 5
),
categories_sales_2021 AS (
    SELECT
        EXTRACT(year FROM o.order_date) AS date_year,
        c.category_name AS category,
        ROUND(SUM(od.unit_price * od.quantity - od.discount)) AS total_sales
    FROM categories AS c
    LEFT JOIN products AS p
    ON c.category_id = p.category_id
    LEFT JOIN order_details AS od
    ON p.product_id = od.product_id
    LEFT JOIN orders AS o
    ON od.order_id = o.order_id
    WHERE date_year = '2021'
    GROUP BY date_year, category
    ORDER BY total_sales DESC
    LIMIT 5
),
categories_sales_2022 AS (
    SELECT
        EXTRACT(year FROM o.order_date) AS date_year,
        c.category_name AS category,
        ROUND(SUM(od.unit_price * od.quantity - od.discount)) AS total_sales
    FROM categories AS c
    LEFT JOIN products AS p
    ON c.category_id = p.category_id
    LEFT JOIN order_details AS od
    ON p.product_id = od.product_id
    LEFT JOIN orders AS o
    ON od.order_id = o.order_id
    WHERE date_year = '2022'
    GROUP BY date_year, category
    ORDER BY total_sales DESC
    LIMIT 5
)
SELECT 
    date_year,
    category,
    total_sales
FROM categories_sales_2020
UNION ALL
SELECT 
    date_year,
    category,
    total_sales
FROM categories_sales_2021
UNION ALL
SELECT 
    date_year,
    category,
    total_sales
FROM categories_sales_2022
ORDER BY date_year, total_sales DESC;



#listar as 5 categorias de produtos mais vendidos por ano usando window function
WITH categories_sales AS (
    SELECT
        EXTRACT(year FROM o.order_date) AS date_year,
        c.category_name AS category,
        ROUND(SUM(od.unit_price * od.quantity - od.discount)) AS total_sales,
        ROW_NUMBER() OVER(PARTITION BY date_year ORDER BY date_year, total_sales DESC) AS rank_total_sales
    FROM categories AS c
    LEFT JOIN products AS p
    ON c.category_id = p.category_id
    LEFT JOIN order_details AS od
    ON p.product_id = od.product_id
    LEFT JOIN orders AS o
    ON od.order_id = o.order_id
    GROUP BY date_year, category
)
SELECT 
    date_year,
    category,
    total_sales,
    rank_total_sales
FROM categories_sales
WHERE rank_total_sales <= 5;



# outra forma de fazer usando window function
WITH categories_sales AS (
    SELECT
        EXTRACT(year FROM o.order_date) AS date_year,
        c.category_name AS category,
        ROUND(SUM(od.unit_price * od.quantity - od.discount)) AS total_sales
    FROM categories AS c
    LEFT JOIN products AS p
    ON c.category_id = p.category_id
    LEFT JOIN order_details AS od
    ON p.product_id = od.product_id
    LEFT JOIN orders AS o
    ON od.order_id = o.order_id
    GROUP BY date_year, category
),
rank_categories_sales AS (
    SELECT 
        date_year,
        category,
        total_sales,
        ROW_NUMBER() OVER(PARTITION BY date_year ORDER BY date_year, total_sales DESC) AS rank_total_sales
    FROM categories_sales
)
SELECT 
    date_year,
    category,
    total_sales,
    rank_total_sales
FROM rank_categories_sales
WHERE rank_total_sales <= 5;

