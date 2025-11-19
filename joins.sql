USE northwind;

-- 1. List the product id, product name, unit price and category name of all
-- products. Order by category name and within that, by product name.

SELECT ProductID, ProductName, UnitPrice, CategoryName
FROM products  AS p
JOIN categories AS c
  ON p.CategoryID = c.CategoryID
ORDER BY c.CategoryName, p.ProductName;  


-- 2. List the product id, product name, unit price and supplier name of all
-- products that cost more than $75. Order by product name.

SELECT ProductID, ProductName, UnitPrice, ContactName
FROM products AS p
JOIN suppliers AS s
  ON p.SupplierID = s.SupplierID
Where p.UnitPrice > 75
ORDER BY p.ProductName;  



-- 3. List the product id, product name, unit price, category name, and supplier
-- name of every product. Order by product name.

SELECT ProductID, ProductName, UnitPrice, CategoryName, ContactName
FROM products AS p
JOIN categories As c
 ON p.ProductID = c.CategoryID
JOIN suppliers AS s
  ON p.SupplierID = s.SupplierID
ORDER BY p.ProductName;  

-- 4. What is the product name(s) and categories of the most expensive
-- products? HINT: Find the max price in a subquery and then use that in
-- your more complex query that joins products with categories.

 SELECT max(UnitPrice) From products;

 SELECT p.ProductName, c.CategoryName
 FROM products AS p
 JOIN categories AS c
  ON p.CategoryID = c.CategoryID
 WHERE p.UnitPrice = (SELECT max(UnitPrice) From products); 



-- 5. List the order id, ship name, ship address, and shipping company name of
-- every order that shipped to Germany.

SELECT OrderID, ShipName, ShipAddress, CompanyName 
FROM orders AS o
JOIN shippers AS s
 on o.ShipVia = s.ShipperID
Where o.ShipCountry = "Germany"; 


-- 6. List the order id, order date, ship name, ship address of all orders that
-- ordered "Sasquatch Ale"?  

 SELECT o.OrderID, o.OrderDate, o.ShipName, o.ShipAddress
 FROM orders AS o
 JOIN `order details` AS od
   ON o.OrderID = od.OrderID
 JOIN products AS p
   ON od.ProductID = p.ProductID
 WHERE p.ProductName =  'Sasquatch Ale'
 ORDER BY o.OrderID;


   

