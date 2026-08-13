-- Vista resumen de pedidos 
CREATE VIEW vw_resumen_pedidos_por_sede AS
	SELECT 
		S.id AS id_sede,
        S.nombre AS sede,
        COUNT(DISTINCT P.id) AS Total_pedidos,
        SUM(DP.cantidad * DP.precio_unitario) As Total_ventas
	FROM Sedes S
    INNER JOIN Pedidos P ON P.id_sede = S.id
    INNER JOIN Detalles_pedidos DP ON DP.id_pedido = P.id
    GROUP BY S.id, S.nombre;

-- STOCK BAJO 
CREATE VIEW vw_productos_bajo_stock AS 
	SELECT 
		P.nombre, P.stock_actual, P.stock_minimo
    FROM Productos P 
    WHERE P.stock_actual <= P.stock_minimo;
SELECT * FROM vw_productos_bajo_stock;

CREATE VIEW vw_clientes_activos AS
	SELECT 
		C.id AS id_cliente,
		CONCAT(C.nombre, ' ', C.apellido) AS Cliente,
        COUNT(P.codigo_pedido) AS Pedidos
    FROM Pedidos P
    INNER JOIN  Clientes C ON P.id_cliente = C.id
    GROUP BY C.id, C.Nombre, C.apellido ;