-- connsultas
SELECT * FROM Categorias;
/*
-----------------
Consulta 1
-----------------
*/
SELECT
    P.nombre, P.stock_actual, P.stock_minimo
    FROM Productos P
    WHERE P.stock_actual <= P.stock_minimo;
/*
-----------------
Consulta 2
-----------------
*/
SELECT codigo_pedido
    FROM Pedidos
    WHERE fecha BETWEEN '2025-05-01' AND '2025-05-31';
/*
-----------------
Consulta 3
-----------------
*/
SELECT
    P.id AS id_producto,
    P.nombre As Producto,
    SUM(DP.cantidad) AS total_vendido  
    FROM Detalles_pedidos DP
    INNER JOIN Productos P ON DP.id_producto = P.id
    GROUP BY P.id, P.nombre
    ORDER BY total_vendido DESC;

/*
-----------------
Consulta 4
-----------------
*/
SELECT
        C.id AS id_cliente,
        CONCAT(C.nombre, ' ', C.apellido) AS Cliente,
        COUNT(P.codigo_pedido) AS Pedidos
    FROM Pedidos P
    INNER JOIN  Clientes C ON P.id_cliente = C.id
    GROUP BY C.id, C.Nombre, C.apellido ;


/* 
-----------------
Consulta 5
-----------------
*/
SELECT *
    FROM Clientes
    WHERE nombre LIKE 'A%';
  
/*
-----------------
Consulta 6
-----------------
*/
SELECT
        P.nombre AS producto,
        C.categoria AS Categoria,
        P.id As id_producto
    FROM Productos P
    INNER JOIN Categorias C ON P.id_categoria = C.id
    WHERE C.categoria IN ('Gaseosa', 'Jugo');
/*
-----------------
Consulta 7
-----------------
*/
SELECT
    CONCAT(C.nombre, ' ', C.apellido) AS Cliente,
    COUNT(P.id) AS Total_pedidos
    FROM Clientes C
    INNER JOIN Pedidos P ON P.id_cliente = C.id
    GROUP BY C.id, C.nombre, C.apellido
    HAVING COUNT(P.id) = (
    SELECT MAX(cnt) FROM (
        SELECT COUNT(id) AS cnt
        FROM Pedidos
        GROUP BY id_cliente
    ) AS conteos
);


/*
-----------------
Consulta 8
-----------------
*/
SELECT
        S.id AS id_sede,
        S.nombre AS sede,
        COUNT(DISTINCT P.id) AS Total_pedidos,
        SUM(DP.cantidad * DP.precio_unitario) As Total_ventas
    FROM Sedes S
    INNER JOIN Pedidos P ON P.id_sede = S.id
    INNER JOIN Detalles_pedidos DP ON DP.id_pedido = P.id
    GROUP BY S.id, S.nombre;