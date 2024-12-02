Use OpusDB98
go

-----------Question-2----------------
SELECT 
    p.ProductId, 
    p.ProductName, 
    p.Price, 
    ISNULL(SUM(o.OrderQuantity), 0) AS TotalOrderQuantity
FROM 
    Products p
LEFT JOIN 
    [Orders] o ON p.ProductId = o.ProductId
GROUP BY 
    p.ProductId, p.ProductName, p.Price;
go
------------Question-2-----------------
UPDATE Products
SET Price = 50
WHERE ProductId = 4;
go



-------------Question-3-------------------
SELECT 
    p.ProductId, 
    p.ProductName, 
    p.Price, 
    o.OrderId, 
    o.OrderQuantity, 
    o.OrderDate
FROM Products p
    
INNER JOIN 
 [Orders] o ON p.ProductId = o.ProductId;
go

------------Question-4----------------------
CREATE PROCEDURE sp_AddOrderToProduct
    @ProductId INT,
    @OrderQuantity INT,
    @OrderDate DATETIME
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Products WHERE ProductId = @ProductId)
    BEGIN
        INSERT INTO [Orders] (ProductId, OrderQuantity, OrderDate)
        VALUES (@ProductId, @OrderQuantity, @OrderDate);
    END
    ELSE
    BEGIN
        RAISERROR ('ProductId does not exist', 16, 1);
    END
END;
go

-----------call ------------
EXEC sp_AddOrderToProduct 
    @ProductId = 1,       
    @OrderQuantity = 10, 
    @OrderDate = '2024-12-01'; 