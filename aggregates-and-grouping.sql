use northwind;
-- 1. How many suppliers are there? Use a query!
select 
    count(CompanyName) 
  from  suppliers;
  
-- 2. What is the sum of all the employee's salaries?

select
  format(sum(Salary), 2)
   from employees;

-- 3. What is the price of the cheapest item that Northwind sells?
select 
  format(min(UnitPrice), 2) 
  from 
      products;

-- 4. What is the average price of items that Northwind sells?
select format(avg(UnitPrice),2) from products;

-- 5. What is the price of the most expensive item that Northwind sells?
select format(max(UnitPrice), 2) from products;

-- 6. What is the supplier ID of each supplier and the number of items they
-- supply? You can answer this query by only looking at the Products table.
select
 SupplierID, count(ProductID) as NumberOfSupply 
 from products 
 group by SupplierID;

-- 7. What is the category ID of each category and the average price of each item
-- in the category? You can answer this query by only looking at the Products
-- table.
SELECT CategoryID, avg(UnitPrice) 
from products 
group by CategoryID;


-- 8. For suppliers that provide at least 5 items to Northwind, what is the
-- supplier ID of each supplier and the number of items they supply? You
-- can answer this query by only looking at the Products table.

SELECT SupplierID, COUNT(*) AS NumberOfItems
FROM products
GROUP BY SupplierID
HAVING 
    COUNT(*) >= 5;



-- 9. List the product id, product name, and inventory value (calculated by
-- multiplying unit price by the number of units on hand). Sort the results in
-- descending order by value. If two or more have the same value, order by
-- product name.




