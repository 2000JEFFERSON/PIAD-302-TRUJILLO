USE Northwind
SELECT SUSER_NAME()

SELECT SYSDATETIME()
CREATE TABLE Users
(
    UserID int PRIMARY KEY IDENTITY(1,1),
    UserName varchar(100) NOT NULL,
    Email varchar(100),
    CreatedDate datetime DEFAULT GETDATE()
);
INSERT INTO Users (UserName, Email)
VALUES 
('Jose', 'Jose.perez@gmail.com'),
('Luis', 'Luis.lopez@gmail.com');

 
DELETE FROM Users WHERE UserID = 2;

CREATE TABLE USERLOGS(
	id int primary key identity(1,1),
	[action] varchar(100),
	[user ] varchar(100),
	[date] datetime,
);


--CREAR TRIGGER el triger dispara cada ves que ocurra una INSER UPDATE DELETE por lo que cuando se elimine un registro
--se genera un tipo historial de registro de acciones guarda cosas importante


CREATE TRIGGER Triger_detele_Users ON Users
AFTER DELETE
AS
	INSERT into USERLOGS ([action],[user],[date]) VALUES('DETELE',SUSER_NAME(), SYSDATETIME() );

-- si agrego un ALTER al trigger se actualiza
CREATE TRIGGER Triger_update_Users_3 ON Users -- creo un disparador le digo en que tabla
AFTER UPDATE -- le digo la accion
AS --le asigno una accion
	INSERT into USERLOGS ([action],[user],[date]) VALUES('UPDATE',SUSER_NAME(), SYSDATETIME() ) -- insercion de datos;
	
UPDATE Users 
set UserName = 'Sinfonia' Where UserID = 1

select * from Users

SELECT * FROM USERLOGS

declare @n1 int =20
declare @n2 int =10
declare @tex varchar(50) = 'La suma es:'
declare @suma int = @n1 + @n2
print @tex
print @suma



CREATE TABLE EmployeesLOGS(
	id int primary key identity(1,1),
	[action] varchar(100),
	[user ] varchar(100),
	[date] datetime,
);
ALTER TRIGGER Trigger_x2_Users  ON Employees
	AFTER 
	UPDATE, DELETE
	AS
	BEGIN

		IF EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted)
		BEGIN
			INSERT INTO EmployeesLOGS ([action], [user], [date])
			VALUES ('UPDATE', SUSER_NAME(), SYSDATETIME());
		END
		ELSE IF EXISTS(SELECT * FROM deleted) AND NOT EXISTS(SELECT * FROM inserted)
		BEGIN
			INSERT INTO EmployeesLOGS ([action], [user], [date])
			VALUES ('DELETE', SUSER_NAME(), SYSDATETIME());
		END
	END;
GO

select * from Employees

UPDATE Employees 
set LastName = 'Sinfoni2a' Where EmployeeID = 1;

DELETE FROM Employees WHERE EmployeeID = 9;

select * from EmployeesLOGS



CREATE TABLE EmployeesLOGS(
	id int primary key identity(1,1),
	[action] varchar(100),
	[user ] varchar(100),
	[date] datetime,
);
ALTER TRIGGER Trigger_x2_Users  ON Employees
	AFTER 
	UPDATE, DELETE
	AS
	BEGIN

		IF EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted)
		BEGIN
			INSERT INTO EmployeesLOGS ([action], [user], [date])
			VALUES ('UPDATE', SUSER_NAME(), SYSDATETIME());
		END
		ELSE IF EXISTS(SELECT * FROM deleted) AND NOT EXISTS(SELECT * FROM inserted)
		BEGIN
			INSERT INTO EmployeesLOGS ([action], [user], [date])
			VALUES ('DELETE', SUSER_NAME(), SYSDATETIME());
		END
	END;
GO
INSERT INTO Employees (
    LastName,
    FirstName,
    Title,
    TitleOfCourtesy,
    BirthDate,
    HireDate,
    Address,
    City,
    Region
) VALUES (
    'Gonzalez',    
    'Carlos',            
    'Sales Manager',    
    'Mr.',              
    '1975-06-15',        
    '2025-09-01',        
    '123 New Street',    
    'Madrid',            
    NULL                 
);
select * from Employees

UPDATE Employees 
set LastName = 'Sinfoni2a' Where EmployeeID = 1;

DELETE FROM Employees WHERE EmployeeID = 10;

select * from EmployeesLOGS
