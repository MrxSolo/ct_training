use AdventureWorks2019 

--1. Write a query to determine the number of customers in the Sales.Customer table.
select count(CustomerID) as Number_of_Customers 
from Sales.Customer;

--2. Write a query using the Production.Product table that displays the minimum, maximum, and average ListPrice.
select min(ListPrice) as minimum_ListPrice, 
max(ListPrice) as maximum_ListPrice, 
avg(ListPrice) as average_ListPrice from Production.Product;

--3. Write a query that shows the total number of items ordered for each product. Use the Sales.SalesOrderDetail table to write the query.
select count(OrderQty) as Total_Items, 
ProductID from Sales.SalesOrderDetail 
Group By ProductID; 

--4. Write a query using the Sales.SalesOrderDetail table that displays a count of the detail lines for each SalesOrderID.
select count(*) as Total_Orders,
SalesOrderID from Sales.SalesOrderDetail
group by SalesOrderID;

--5. Write a query using the Production.Product table that lists a count of the products in each product line.
select * from Production.Product;
select count(*) as Count_of_Product, 
ProductLine from Production.Product  
group by ProductLine;

--6. Write a query that displays the count of orders placed by year for each customer using the Sales.SalesOrderHeader table.
select * from Sales.SalesOrderHeader
select CustomerID, count(*) as count_of_order , 
YEAR(OrderDate) as Order_Year from Sales.SalesOrderHeader 
group by CustomerID, Year(OrderDate);

--7. Write a query that creates a sum of the LineTotal in the Sales.SalesOrderDetail table grouped by the SalesOrderID. Include only those rows where the sum exceeds 1,000.
select * from Sales.SalesOrderDetail
select SalesOrderId, 
sum(LineTotal) as Sum_Of_LineTotal  
from Sales.SalesOrderDetail
group by SalesOrderID having sum(LineTotal) > 1000;

--8. Write a query that groups the products by ProductModelID along with a count. Display the rows that have a count that equals 1.
select ProductModelID, count(*) as CountsOfProducts
from production.Product
group by ProductModelID
having count(*)=1;

--9. Write a query using the Sales.SalesOrderHeader, Sales.SalesOrderDetail, and Production.Product tables to display the total sum of products by ProductID and OrderDate.
select sum(OrderQty) Sum_Of_Order_Qty, P.Name, SOH.OrderDate
from Sales.SalesOrderHeader as SOH 
inner join Sales.SalesOrderDetail as SOD
on SOH.SalesOrderID = SOD.SalesOrderDetailID
inner join Production.Product as P on SOD.ProductID=P.ProductID
GROUP BY P.Name, SOH.OrderDate; 

--10. Display the 3rd joined employee.
Select * from HumanResources.Employee
order by BusinessEntityID
offset 2 rows
fetch next 1 rows only;

--11. Display the customer who has placed 2nd highest orders
Select * from Sales.SalesOrderHeader

Select CustomerID, Count(SalesOrderID)"Count of Orders"
from Sales.SalesOrderHeader
group by CustomerID
having count(SalesOrderID) = (select distinct count(SalesOrderID)
from Sales.SalesOrderHeader
group by CustomerID
order by count(SalesOrderID) desc
offset 1 rows
fetch first 1 row only)

--12. Display top 25% of costliest products in every subcategory

--13. Create a sequence to be used in two different temporary tables (Note: create temporary tables if required)