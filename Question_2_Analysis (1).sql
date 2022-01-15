-- a.How many orders were shipped by Speedy Express in total? 3575

select sum(od.Quantity)--, o.OrderID 
from Orders o
inner join OrderDetails od
on o.OrderID = od.OrderID
inner join Shippers s 
on o.ShipperID = s.ShipperID
where shipperName = 'Speedy Express';

-- b.What is the last name of the employee with the most orders? Peacock

select e.EmployeeID, e.LastName, sum(od.Quantity)
from Employees e
inner join Orders o
on e.EmployeeID = o.EmployeeID
inner join OrderDetails od
on o.OrderID = od.OrderID
group by e.EmployeeID
order by sum(od.Quantity) desc

-- c.What product was ordered the most by customers in Germany? Boston Crab Meat

select p.ProductName, sum(od.Quantity)
from Products p
inner join OrderDetails od
on p.ProductID = od.ProductID
inner join Orders o
on od.OrderID = o.OrderID
inner join Customers c
on o.CustomerID = c.CustomerID
where c.Country = 'Germany'
group by p.ProductName
order by sum(od.Quantity) desc











