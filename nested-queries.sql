USE northwind;

-- 1. What is the product name(s) of the most expensive products? HINT: Find
-- the max price in a subquery and then use that value to find products whose
-- price equals that value.
Select max(UnitPrice) from northwind.products;

SELECT ProductName
 FROM northwind.products 
 where UnitPrice = 
				(Select max(UnitPrice) from northwind.products);

-- 2. What is the order id, shipping name and shipping address of all orders
-- shipped via "Federal Shipping"? HINT: Find the shipper id of "Federal
-- Shipping" in a subquery and then use that value to find the orders that
-- used that shipper.

Select ShipperID from northwind.shippers where CompanyName = "Federal Shipping";

select OrderID, ShipName, ShipAddress 
from northwind.orders 
where ShipVia = 
              (Select ShipperID 
              from northwind.shippers where CompanyName = "Federal Shipping");


-- 3. What are the order ids of the orders that ordered "Sasquatch Ale"? HINT:
-- Find the product id of "Sasquatch Ale" in a subquery and then use that
-- value to find the matching orders from the `order details` table. Because
-- the `order details` table has a space in its name, you will need to surround
-- it with back ticks in the FROM clause.


select ProductID from northwind.products where ProductName = "Sasquatch Ale";

select OrderID from `northwin.order details` 
where ProductID = (select ProductID from northwind.products where ProductName = "Sasquatch Ale");



-- 4. What is the name of the employee that sold order 10266?

select EmployeeID From northwind.orders where OrderID = 10266;
select FirstName, LastName 
From northwind.employees 
where  EmployeeID = 
               (select EmployeeID
               From northwind.orders where OrderID = 10266);



-- 5. What is the name of the customer that bought order 10266?

Select CustomerID from northwind.orders where OrderID = 10266;
Select ContactName 
From northwind.customers 
where CustomerID = 
				(Select CustomerID 
                    from northwind.orders where OrderID = 10266);

