use Northwind
go
-- Uso de comodines o WILDCARDS
-- Con comodin %  dependiendo de donde se ubiquen empisesa o termina
Select * from Customers
where ContactName = 'Anatr';
-- Busca Coinsidencia con "LIKE"
Select * from Customers
where ContactName like 'An%';
-- Comiense en A
Select * from Customers
where CustomerID like 'A%';
-- Termine en N
Select * from Customers
where CustomerID like '%N';
--El _ es para buscar caracteres desconocidos
Select * from Customers
where CustomerID like 'AN___';
--Buscar en la letra del medio
Select * from Customers
where CustomerID like '%O%';
-- Letra en el centro a corde a las cantidad de caracter que en este caso es 5
Select * from Customers
where CustomerID like '__O__';
Select * from Customers
where CustomerID like '__O%';
-- Corchetes enpaqueta unos carecteres y le decimos que comiense con estos mismos
Select * from Customers
where CustomerID like '[ABC]%';
Select * from Customers
where CustomerID like '[WJY]%';
-- Rangos "-"
Select * from Customers
where CustomerID like '[a-e]%';
-- y ¡Que no este?
Select * from Customers
where CustomerID like '[^a-c]%';
Select * from Customers
where CustomerID like '[^a-r]%';

-- EJERCICIO

SELECT * FROM Customers 
-- 1 ejercicio (rows 15)
Select * from Customers
where Address like '%Av%';
-- 2 ejercico (rows 82)
Select * from Customers
where Country not like 'Brazil';
-- 3 ejercico (rows 20 )
Select * from Customers
where Region is not null and  Fax is not null

-- USO del IN Filtra valores que puedan estar
select * from Employees
where TitleOfCourtesy IN ('MS.', 'MR.', 'MRS.');


-- Mostrar a los que sean de la ciudad Seattle tacoma Redmond
select * from Employees
where City IN ('Seattle', 'Tacoma', 'Redmond');
-- Group By Uso
-- Antes de su uso se tiene que usar:
SELECT COUNT(*) From Customers;
SELECT SUM(Unitprice) From Products;
SELECT AVG(Unitprice) From Products;
--  Aplicar
SELECT City, COUNT(*) as contar From Customers
Group by City 
Order by contar DESC;

-- Ejercicio 4 (rows 21)
SELECT ShipCountry, count(*) as cont From Orders
Group by ShipCountry  
Order by cont DESC;
-- Ejercicio 5 (rows 70)
SELECT ShipCity, count(*) as cont From Orders
Group by ShipCity
Order by cont DESC;
-- Ejercicio 6 (rows 8)
SELECT CategoryID, sum(Unitprice) as suma From Products
Group by CategoryID  
Order by suma DESC;