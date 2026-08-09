/* ============================================================
   PRACTICE FILE: AGGREGATE FUNCTIONS & TEXT FUNCTIONS
   Table: Products
   Instructions: Write the SQL query below each question.
   ============================================================ */
create database practice;
use practice;

/* ------------------------------------------------------------
   STEP 1: CREATE TABLE
   ------------------------------------------------------------ */

CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    city VARCHAR(50),
    price INT,
    description VARCHAR(100)
);


/* ------------------------------------------------------------
   STEP 2: INSERT DATA
   ------------------------------------------------------------ */

INSERT INTO Products VALUES
(1, 'wireless mouse', 'Electronics', 'Bangalore', 799, 'compact wireless mouse'),
(2, 'Office Chair', 'Furniture', 'Delhi', 4500, 'ergonomic office chair'),
(3, 'BLUETOOTH SPEAKER', 'Electronics', 'Bangalore', 2200, 'portable bluetooth speaker'),
(4, 'Study Table', 'Furniture', 'Mumbai', 3800, 'wooden study table'),
(5, 'laptop stand', 'Electronics', 'Pune', 1200, 'adjustable laptop stand'),
(6, 'Bookshelf', 'Furniture', 'Delhi', 3200, 'wall mounted bookshelf'),
(7, 'Table Lamp', 'Electronics', 'Mumbai', 950, 'LED table lamp'),
(8, '  Yoga Mat  ', 'Fitness', 'Bangalore', 600, 'non-slip yoga mat');

select * from Products ;
/* ============================================================
   SECTION A: AGGREGATE FUNCTIONS
   ============================================================ */

-- Q1. Find the total number of products.
select count(product_id) as product_count from Products;

-- Q2. Find the total value of all products (sum of prices).
SELECT SUM(price) AS total_price FROM Products;

-- Q3. Find the average price of products.

SELECT round(avg(price),2) AS total_price FROM Products;
-- Q4. Find the most expensive and least expensive product price.
SELECT 
    MAX(price) AS MostExpensivePrice,
    MIN(price) AS LeastExpensivePrice
FROM Products;


-- Q5. Find how many products exist in each category.
SELECT category,
count(product_id) as total_product
FROM Products
group by category;

-- Q6. Find the average price per city.

SELECT city,
round(avg(price),2) as avg_product
FROM Products
group by city;

-- Q7. Find categories where the average price is more than 2000.
SELECT category,
round(avg(price),2) as total_price
from Products
group by category
having total_price>2000
order by total_price desc;

-- Q8. Find the total price of products per city, sorted from highest to lowest.
SELECT city,
round(sum(price),2) as total_price
FROM Products
group by city
order by total_price desc;


-- Q9. Find the number of distinct cities the products are available in.
SELECT COUNT(DISTINCT City) AS DistinctCityCount
FROM Products;



/* ============================================================
   SECTION B: TEXT FUNCTIONS
   ============================================================ */

-- Q1. Display all product names in uppercase and lowercase.
SELECT 
    UPPER(product_name) AS ProductNameUpper,
    LOWER(product_name) AS ProductNameLower
FROM Products;


-- Q2. Remove the extra spaces from the product_name column and display the cleaned result.
select product_name,trim(product_name) as updated_name from Products;

-- Q3. Find the length of each product_name (after removing spaces).
select product_name,length(trim(product_name)) as len_count from Products;

-- Q4. Extract the first 5 characters of each description.

select 
substring(trim(product_name),1,5)as first_name
from Products;
-- Q5. Combine product_name and category into a single column separated by a hyphen.
select product_id,
concat(trim(product_name)," ","-"," ", category)as product_category
from Products;

-- Q6. Replace the word 'table' with 'desk' in the description column.
select description,
replace(description,"table","desk") as updated_description
from Products;

-- Q7. Convert each product_name into proper case (first letter capital, rest lowercase).
SELECT CONCAT(upper(substring(trim(product_name), 1,1)), lower(SUBSTRING(product_name,2))) AS ProperName
FROM Products;

-- Q8. Find all products whose description contains the word 'wireless'.

SELECT product_name, description
FROM Products
WHERE description LIKE '%wireless%';

-- Q9. Find all products whose product_name starts with the letter 'B' (case-insensitive).
select product_name
from Products
where product_name like 'B%';
