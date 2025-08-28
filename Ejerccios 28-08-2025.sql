use Northwind

select * from Customers;
select CustomerID From Customers
Where CustomerID in ('ALFIKI','ANATR','ANTON','AROUT','BERGS')

select * from Customers
WHERE CustomerID IN(
	SELECT CustomerID FROM Customers
	WHERE CustomerID in ('ALFIKI','ANATR','ANTON','AROUT','BERGS') 
	);

SELECT * FROM Products
	WHERE CategoryID IN(
	SELECT CategoryID FROM Products
	WHERE CategoryID in ('ALFIKI','ANATR','ANTON','AROUT','BERGS') 
	);

SELECT * FROM Products
WHERE CategoryID IN(
	SELECT TOP(5) CategoryID FROM Categories
	GROUP BY CategoryID)
	--ORDER BY CategoryID DESC

SELECT CategoryID, COUNT (*) FROM Products
	WHERE CategoryID  IN(
	SELECT TOP(5) CategoryID FROM Categories
	GROUP BY CategoryID)

SELECT 'PIAD-302', 'PIAD-305' FROM Categories
UNION ALL
SELECT 'PIAD-303', 'PIAD-304' FROM Categories

-- Unir todas las filas id y nombre de las tablas productos y categorias, Unir junta los valores unicos
-- Por defecto el problema nos pide unir estar tablas en total son 85 individualemente la tabla productos tengo (1) 77 y la tabla categorias tengo (2)8
SELECT ProductID, ProductName FROM Products
UNION ALL
SELECT CategoryID, CategoryName FROM Categories 

-- ¿Me daria el mismo resultado si lo hiciera al reves? 1=8 2=77 Total=85
SELECT CategoryID, CategoryName FROM Categories 
UNION ALL
SELECT ProductID, ProductName FROM Products

-- Sin union ALL
SELECT ProductID, ProductName FROM Products
UNION
SELECT CategoryID, CategoryName FROM Categories 
-- fila ID=85
-- sin all
SELECT CategoryID FROM Categories 
UNION 
SELECT ProductID FROM Products
-- con all
SELECT CategoryID FROM Categories 
UNION ALL
SELECT ProductID FROM Products
-- fila name=85
SELECT CategoryName FROM Categories 
UNION ALL
SELECT ProductName FROM Products
-- sin all
SELECT CategoryName FROM Categories 
UNION
SELECT ProductName FROM Products

-- Uso de JOIN
SELECT * FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID

-- Practica
-- Mostrar el ProductID renombreando ID , ProductName con Nombre , UnitPrice con Precio, CategoryName con Categoria
SELECT p.ProductID AS ID , p.ProductName AS Nombre , p.UnitPrice AS Precio, c.CategoryName AS Categoria FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
-- Ordens y Customers
SELECT o.OrderID AS ID, o.ShipName AS NOMBRE, o.ShipAddress AS DIRECCION, c.Country AS PAIS, c.CompanyName AS COMPANIA, c.Phone AS TELEFONO FROM Orders O
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
SELECT * FROM Customers
SELECT * FROM Orders
-- Ordens y Order Details
SELECT d.OrderID AS ID, o.OrderDate AS Tiempo_Solicitud, o.RequiredDate AS Tiempo_Requerimiento, o.ShipName AS Nombre_Orden, o.ShipAddress AS Direccion_Orden, o.ShipCountry AS Pais, d.ProductID AS Numero_Producto, d.UnitPrice AS Precio_Unidad, d.Quantity AS Cantidad, d.Discount AS Descuento  FROM Orders o
INNER JOIN [Order Details] d ON o.OrderID = d.OrderID
SELECT * FROM [Order Details]
SELECT * FROM Customers
SELECT * FROM Products

/*Ejercicio 1*/
SELECT c.CompanyName AS COMPANIA_NOMBRE, SUM(d.Quantity * d.UnitPrice) AS TOTAL FROM Orders O
INNER JOIN [Order Details] d ON o.OrderID = d.OrderID
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CompanyName
ORDER BY TOTAL ASC;
--Ejercicio 2 
SELECT e.FirstName AS Nombre, Count(o.OrderID) AS Total  FROM Orders o
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
INNER JOIN [Order Details] d ON o.OrderID = d.OrderID
GROUP BY FirstName;