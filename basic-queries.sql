USE northwind;
-- 1. What is the name of the table that holds the items Northwind sells?

-- Table products and go to products names column 
Select ProductName 
from products;

-- 2. Write a query to list the product id, product name, and unit price of every
-- product.
select ProductID, ProductName, UnitPrice
 from products;

-- 3. Write a query to list the product id, product name, and unit price of every
-- product. Except this time, order then in ascending order by price.
select ProductID, ProductName, UnitPrice 
from products
 order by UnitPrice ASC;


-- 4. What are the products that we carry where the unit price is $7.50 or less?
select UnitPrice from products
 where UnitPrice < 7.50 
 order by UnitPrice ASC;

-- 5. What are the products that we carry where we have at least 100 units on
-- hand? Order them in descending order by price.
select UnitsInStock
 from products
 where UnitsInStock > 100 
 order by UnitsInStock DESC;

-- 6. What are the products that we carry where we have at least 100 units on
-- hand? Order them in descending order by price. If two or more have the
-- same price, list those in ascending order by product name.
select ProductName, UnitsInStock
 from products 
 where UnitsInStock > 100 
 order by ProductName ASC;

-- 7. What are the products that we carry where we have no units on hand, but 1
-- or more units of them on backorder? Order them by product name.orders

SELECT 
    ProductName,
    UnitsInStock,
    UnitsOnOrder
FROM 
    products
WHERE 
    UnitsInStock = 0
    AND UnitsOnOrder >= 1
ORDER BY 
    ProductName ASC;



-- 8. What is the name of the table that holds the types (categories) of the items
-- Northwind sells?
select CategoryName from northwind.categories;

-- 9. Write a query that lists all of the columns and all the rows of the categories
-- table? What is the category id of seafood?
select CategoryID, CategoryName, Description, Picture 
from northwind.categories 
where CategoryName = 'SeaFood';

-- 10.Examine the Products table. How does it identify the type (category) of
-- each item sold? Write a query to list all of the seafood items we carry.

/* seaFood Id number is 8, which is listed on the products table, now we just have to 
call the seclect ProductName, CategoryID from products where CategoryID = '8'
*/
select CategoryID, ProductName
 from products
 where CategoryID = '8' 
 order by ProductName asc ;

-- 11.What are the first and last names of all of the Northwind employees?
select FirstName, LastName 
from employees;

-- 12.What employees have "manager" in their titles?

select FirstName, LastName, Title 
from employees 
where Title 
Like "%Manager%";


-- 13.List the distinct job titles in employees.

SELECT distinct Title FROM employees;

-- 14.What employees have a salary that is between $2000 and $2500?

Select FirstName, LastName, Salary 
From employees 
where Salary 
between 2000 and 2500;

-- 15.List all the information about all of Northwind's suppliers.

SELECT * FROM suppliers;

-- 16.Examine the Products table. How do you know what supplier supplies
-- each product? Write a query to list all the items that "Tokyo Traders"
-- supplies to Northwind

/*
Check Supplier Id and See which Products is that ID connceted to 
*/
select SupplierID, ProductName from products where SupplierID = '4';