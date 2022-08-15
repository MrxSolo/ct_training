/*   creating   database     */
create database day1

/*   using   database     */
use day1


/*         Sales             */
CREATE SCHEMA Sales

/*         SalesOrderDetail             */
create table SalesOrderDetail(
	SalesOrderDetailId int not null primary key,
	SalesOrderHeaderId int,
	ProductId int,
	orderQuantity int
)
alter table [Sales].[SalesOrderDetail]
add constraint SalesOrderHeaderId foreign key (SalesOrderHeaderId) references [Sales].[SalesOrderHeader](SalesOrderHeaderId)

alter table [Sales].[SalesOrderDetail]
add constraint ProductId foreign key (ProductId) references [Production].[Product](ProductId)

ALTER SCHEMA Sales 
TRANSFER [dbo].[SalesOrderDetail];

/*         SalesOrderHeader             */
create table SalesOrderHeader(
	SalesOrderHeaderId int not null primary key,
	OrderDate date,
	CustomerId int,
	SalesPersonId int
)

alter table [Sales].[SalesOrderHeader]
add constraint CustomerId foreign key (CustomerId) references [Sales].[Customer](CustomerId)

alter table [Sales].[SalesOrderHeader]
add constraint CustomerId foreign key (CustomerId) references [Sales].[Customer](CustomerId)

ALTER SCHEMA Sales 
TRANSFER [dbo].[SalesOrderHeader];


/*         Customer             */
create table Customer(
	CustomerId int not null primary key,
	PersonId int,
	TerritoryId int,
	CustomerGrade varchar(10)
)
alter table [Sales].[Customer]
add constraint PersonId foreign key (PersonId) references [Person].[Person](PersonId)

alter table [Sales].[Customer]
add constraint TerritoryId foreign key (TerritoryId) references [Sales].[Territory](TerritoryId)

ALTER SCHEMA Sales 
TRANSFER [dbo].[Customer];

/*         Territory             */
create table Territory(
	TerritoryId int not null primary key,
	TerritoryName varchar(50),
	CountryId int,
	
)

alter table [Sales].[Territory]
add constraint CountryId foreign key (CountryId) references [Sales].[Country](CountryId)

ALTER SCHEMA Sales 
TRANSFER [dbo].[Territory];


/*         Country             */
create table Country(
	CountryId int not null primary key,
	CountryName varchar(50),
	
)
ALTER SCHEMA Sales 
TRANSFER [dbo].[Country];



/*         Person             */
CREATE SCHEMA Person

/*         Person             */
create table Person(
	PersonId int not null primary key,
	Title varchar(50),
	FirstName varchar(50),
	MiddleName varchar(50),
	LastName varchar(50),
	Gender varchar(10),
	ModifiedDate date
)


ALTER SCHEMA Person 
TRANSFER [dbo].[Person];



/*         HumanResources             */
CREATE SCHEMA HumanResources

/*         Employee             */
create table Employee(
	Employee int not null primary key,
	Designation varchar(50),
	ManagerId int,
	DateOfJoining date,
	DepartmentId int,
	PersonId int
	
)

alter table [HumanResources].[Employee]
add constraint PersonId foreign key (PersonId) references [Person].[Person](PersonId)

alter table [HumanResources].[Employee]
add constraint DepartmentId foreign key (DepartmentId) references [HumanResources].[Department](DepartmentId)


ALTER SCHEMA HumanResources 
TRANSFER [dbo].[Employee];


/*         Department             */
create table Department(
	DepartmentId int not null primary key,
	DepartmentName varchar(50),	
)


ALTER SCHEMA HumanResources 
TRANSFER [dbo].[Department];


/*         Production             */
CREATE SCHEMA Production

/*         Product             */
create table Product(
	ProductId int not null primary key,
	ProductName varchar(50),
	ProductCost int,
	QuantityInStock int,
	ProductSubCategoryId int
	
)
alter table [Production].[Product]
add constraint ProductSubCategoryId foreign key (ProductSubCategoryId) references [Production].[ProductSubCategory](ProductSubCategoryId)

ALTER SCHEMA Production 
TRANSFER [dbo].[Product];


/*         ProductSubCategory             */
create table ProductSubCategory(
	ProductSubCategoryId int not null primary key,
	ProductSubCategoryName varchar(50),
	ProductCategoryId int,	
)
alter table [Production].[ProductSubCategory]
add constraint ProductCategoryId foreign key (ProductCategoryId) references [Production].[ProductCategory](ProductCategoryId)


ALTER SCHEMA Production 
TRANSFER [dbo].[ProductSubCategory];


/*         ProductCategory             */
create table ProductCategory(
	ProductCategoryId int not null primary key,
	ProductCategoryName varchar(50),	
)

ALTER SCHEMA Production 
TRANSFER [dbo].[ProductCategory];

