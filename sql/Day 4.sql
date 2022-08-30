use AdventureWorks2019

--1. The HumanResources.Employee table does not contain the employee names. 
--Join that table to the Person.Person table on the BusinessEntityID column.
--Display the job title, birth date, first name, and last name.
select * from HumanResources.Employee
select * from Person.Person

select JobTitle,BirthDate,FirstName,LastName 
from HumanResources.Employee JOIN Person.Person
on Employee.BusinessEntityID=Person.BusinessEntityID;

--2. The customer names also appear in the Person.Person table. 
--Join the Sales.Customer table to the Person.Person table. 
--The BusinessEntityID column in the Person.Person table matches the PersonID column in the Sales.Customer table.
--Display the CustomerID, StoreID, and TerritoryID columns along with the name columns.
select * from Person.Person
select * from Sales.Customer

select CustomerID,StoreID,TerritoryID ,(FirstName+' '+MiddleName+' '+LastName)as nameOfCustomer
from Person.Person JOIN Sales.Customer
on Person.BusinessEntityID=Customer.PersonID;

--3. Write a query that joins the Sales.SalesOrderHeader table to the Sales.SalesPerson table. 
--Join the BusinessEntityID column from the Sales.SalesPerson table to the SalesPersonID
--column in the Sales.SalesOrderHeader table. Display the SalesOrderID along with the SalesQuota and Bonus.
select * from Sales.SalesOrderHeader
Select * From Sales.SalesPerson

select SalesOrderID,SalesQuota,Bonus 
from Sales.SalesOrderHeader JOIN Sales.SalesPerson
on SalesPerson.BusinessEntityID=SalesOrderHeader.SalesPersonID;

--4. The catalog description for each product is stored in the Production.ProductModel table. 
--Display the columns that describe the product from the Production.Product table, such as the color and size along with the catalog description for each product.
Select * from Production.ProductModel
Select * from Production.Product

select Product.Color,Product.Size,ProductModel.CatalogDescription 
from Production.Product  Left JOIN Production.ProductModel
on Product.ProductModelID=ProductModel.ProductModelID;

--5. Write a query that displays the names of the customers along with the product names that they have purchased. 
--Hint: Five tables will be required to write this query!
select * from Production.Product
select * from Sales.SalesOrderDetail
select * from Sales.SalesOrderHeader
select * from Sales.Customer
select * from Person.Person

select concat_ws(' ',Person.FirstName,Person.MiddleName,Person.LastName) as CustomerName,Product.Name
from Person.Person
join Sales.Customer
on Person.BusinessEntityID = Customer.PersonID
join Sales.SalesOrderHeader
on Customer.CustomerID=SalesOrderHeader.CustomerID
join Sales.SalesOrderDetail
on SalesOrderHeader.SalesOrderID=SalesOrderDetail.SalesOrderID
join Production.Product
on Product.ProductID=SalesOrderDetail.ProductID


--6. Write a query that displays all the products along with the SalesOrderID even if an order has never been placed for that product.
--Join to the Sales.SalesOrderDetail table using the ProductID column.
select * from Sales.SalesOrderDetail
Select * from Production.Product

select Product.ProductID,SalesOrderDetail.SalesOrderDetailID,SalesOrderDetail.OrderQty
from Production.Product left join Sales.SalesOrderDetail
on Product.ProductID = SalesOrderDetail.ProductID

--7. The Sales.SalesOrderHeader table contains foreign keys to the Sales.CurrencyRate and Purchasing.ShipMethod tables. 
--Write a query joining all three tables, making sure it contains all rows from Sales.SalesOrderHeader. Include the CurrencyRateID, AverageRate, SalesOrderID, and ShipBase columns.
select * from Sales.SalesOrderHeader
select * from Sales.CurrencyRate
select * from Purchasing.ShipMethod

select CurrencyRate.CurrencyRateID,CurrencyRate.AverageRate,SalesOrderHeader.SalesOrderID,ShipMethod.ShipBase from Sales.CurrencyRate 
right join Sales.SalesOrderHeader
on CurrencyRate.CurrencyRateID=SalesOrderHeader.SalesOrderID
left join Purchasing.ShipMethod 
on ShipMethod.ShipMethodID=SalesOrderHeader.SalesOrderID

--8. Get all the order details to gererate a report that displays, OrderID, OrderNumber, OrderDate, Shipping Date 
--and the product names, subcategory and category which are the part of that order and include the name of customer 
--who has placed the order as well as the name of territory and country from where order has been placed 
--[Hint: Identify the correct set of related tables]

select * from Sales.SalesOrderDetail
select * from Sales.SalesOrderHeader

select SalesOrderDetail.SalesOrderID, SalesOrderHeader.OrderDate,
SalesOrderHeader.PurchaseOrderNumber,SalesOrderHeader.ShipDate,SalesOrderHeader.TerritoryID,Product.Name,
Person.FirstName+Person.LastName as fullname ,SalesTerritory.Name as territoryname , CountryRegion.Name as countryname
from Sales.SalesOrderDetail
join Sales.SalesOrderHeader
on SalesOrderDetail.SalesOrderID=SalesOrderHeader.SalesOrderID
join Production.Product 
on Product.ProductID= SalesOrderDetail.ProductID
join Production.ProductSubcategory
on ProductSubcategory.ProductSubcategoryID = Product.ProductSubcategoryID
join Production.ProductCategory
on ProductCategory.ProductCategoryID = ProductSubcategory.ProductCategoryID
join Sales.Customer
on	Customer.CustomerID = SalesOrderHeader.CustomerID
join Person.Person
on Person.BusinessEntityID=Customer.PersonID
join sales.SalesTerritory 
on SalesTerritory.TerritoryID= Customer.TerritoryID
join person.CountryRegion
on SalesTerritory.CountryRegionCode = CountryRegion.CountryRegionCode;


--9. Get the Youngest Employee
select * from 
(
	select dense_rank() over (order by BirthDate desc) "DenseRank", * from HumanResources.Employee
)  
	"Rank"
	where DenseRank=1

--10. Create a temp. table and copy the data form Production.Product table (only red colored products) in the temp. table [Hint: use subquery]
Select * from Production.Product
create table #tempTable(
    productID int primary key not null,
    name varchar (50) not null,
    color varchar(20),
    productNumber varchar(50) not null
)
insert into #tempTable
select productID,name,color,productNumber from Production.Product where Color= 'red'

select * from #tempTable;