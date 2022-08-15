/*   1    */ 
select [BusinessEntityID] , ([FirstName]+ ' '+[MiddleName] + ' ' + [LastName] ) as fullname ,[ModifiedDate] 
from [Person].[Person]
where  [ModifiedDate] > '2000-01-29'

/*   2    */ 
select [BusinessEntityID] , ([FirstName]+ ' '+[MiddleName] + ' ' + [LastName] ) as fullname ,[ModifiedDate] 
from [Person].[Person]
where  month([ModifiedDate]) !=12 and year([ModifiedDate]) !=2000

/*   3    */ 
select [ProductID], [Name]
from [Production].[Product]
where [Name] like 'chain%'

/*   4    */ 
select [BusinessEntityID] , [FirstName],[MiddleName] ,[LastName] ,[ModifiedDate] 
from [Person].[Person]
where  [MiddleName] in ('e','b')

/*   5    */ 
select [SalesOrderID], [OrderDate], [TotalDue]
from [Sales].[SalesOrderHeader]
where [OrderDate] between '2011-09-01' and '2012-09-30' and [TotalDue] > 1000

/*   6    */ 
select [SalesOrderNumber]
from [Sales].[SalesOrderHeader]
where [TotalDue] >1000 and ([SalesPersonID] =279 or [TerritoryID]=6)

/*   7    */ 
select [ProductID], [Name],[Color]
from [Production].[Product]
where [Color] !='blue'

/*   8    */ 
select [BusinessEntityID] , ([FirstName]+ ' '+[MiddleName] + ' ' + [LastName] ) as fullname 
from [Person].[Person]
order by [LastName],[FirstName],[MiddleName]

/*   9    */ 
select [AddressLine1]+' ('+[City]+' ' +[PostalCode]+')' as address
from [Person].[Address]

/*   10    */ 
select [ProductID], isnull([Color],'no color') as color, [Name]
from [Production].[Product]

/*   11    */ 
select ([Name] +':'+isnull([Color],'no color') ) as description
from [Production].[Product]

/*   12    */ 
select ([MaxQty]-[MinQty]) as difference ,[SpecialOfferID], [Description]
from [Sales].[SpecialOffer]

/*   13    */ 
select (isnull([MaxQty],10)*[DiscountPct]) as Multiplication ,[SpecialOfferID], [Description]
from [Sales].[SpecialOffer]

/*   14    */ 
select substring([AddressLine1],1,10) as address
from [Person].[Address]

/*   15    */ 
select [SalesOrderID], [OrderDate], [ShipDate] , datediff(day,[OrderDate],[ShipDate]) as 'no of days'
from [Sales].[SalesOrderHeader]

/*   16    */
select cast([OrderDate] as date) as orderDate, cast([ShipDate] as date) as shipDate
from [Sales].[SalesOrderHeader]

/*   17    */
select [SalesOrderID], dateadd(mm,6,[OrderDate]) as orderDate
from [Sales].[SalesOrderHeader]

/*   18    */ 
select [SalesOrderID], [OrderDate],month([OrderDate]) as month, year([OrderDate]) as year
from [Sales].[SalesOrderHeader]

/*   19    */
select floor(rand()*10+1) as randomNumber;

/*   20    */ 
select [SalesOrderID], [OrderDate]
from [Sales].[SalesOrderHeader]
where year([OrderDate])=2011

/*   21    */ 
select [SalesOrderID], [OrderDate]
from [Sales].[SalesOrderHeader]
order by month([OrderDate]) , year([OrderDate])


