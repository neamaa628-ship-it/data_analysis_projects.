use WideWorldImporters;

select *from sales.Orders
select *from sales.Orders
select orderdate,orderid, CustomerName from sales.Customers c
inner join sales.Orders o
on c.CustomerID = o.customerid 
where o.OrderDate > '2016-01-01'
 order by orderdate desc


 select *from Warehouse.StockItems
 select stockitemname , unitprice from Warehouse.StockItems
 where UnitPrice >100
 order by UnitPrice desc


 select *from sales.Orders
 select *from Sales.Customers
 select c.customername , count (o.orderid) as numberoforders
 from sales.Customers c
 inner join sales.Orders o
 on c.customerid=o.customerid 
 group by c.customername 
 order by numberoforders desc



 select*from Warehouse.StockItems

 select stockitemname,unitprice,
 case 
 when unitprice >100 then 'expensive'
 when unitprice <=100 and unitprice >=50  then 'medium'
 else 'cheap'
 end as pricecategory
 from Warehouse.StockItems

 select *from Warehouse.StockItems
 select typicalweightperunit , count(*) as numberofproduct 
 from Warehouse.StockItems
 group by typicalweightperunit
 having count(*) >10
 order by numberofproduct desc



 select * from Warehouse.StockItemHoldings
 select *from Warehouse.StockItems
 select sq.laststocktakequantity, si.stockitemid, si.stockitemname from Warehouse.StockItems si
 left join Warehouse.StockItemHoldings sq
 on si.StockItemID=sq.StockItemID
 order by si.StockItemName



create view vwbackorders as

select orderid,customerid,orderdate,expecteddeliverydate
from sales.orders
where PickingCompletedWhen is null 


create view vwcustomerswithcreditlimit as 
select customerid,customername,creditlimit 
from Sales.Customers
where CreditLimit> (select min(CreditLimit ) from sales.customers)




select *from Sales.CustomerTransactions
select *from Application.TransactionTypes

select c.customertransactionid,c.customerid,tt.transactiontypename,c.transactionamount
from Sales.CustomerTransactions c
inner join Application.TransactionTypes tt

on c.TransactionTypeID=tt.TransactionTypeID
where c.TransactionAmount>100
order by c.TransactionAmount desc 


select *from Sales.CustomerTransactions

select customerid,count(customertransactionid) as numberoftransactions
 
 from Sales.CustomerTransactions
 group by customerid 
 having count(customertransactionid)>1
 order by numberoftransactions desc 


