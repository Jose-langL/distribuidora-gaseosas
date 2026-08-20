/*
------------------------------------------------------------
                        CONSULTA 1
Consultar los productos con stock por debajo del mínimo.
------------------------------------------------------------
*/

SELECT
    P.nombre, P.stock_actual, P.stock_minimo
    FROM Productos P
    WHERE P.stock_actual <= P.stock_minimo;

/*
------------------------------------------------------------
                        CONSULTA 2
Consultar los pedidos realizados entre dos fechas (BETWEEN)
------------------------------------------------------------
*/

SELECT codigo_pedido
    FROM Pedidos
    WHERE fecha BETWEEN '2025-05-01' AND '2025-05-31';

/*
------------------------------------------------------------
                        CONSULTA 3
Listar los productos más vendidos (con JOIN y GROUP BY)
------------------------------------------------------------
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
------------------------------------------------------------
                        CONSULTA 4
Mostrar clientes y la cantidad de pedidos realizados
------------------------------------------------------------
*/

SELECT
        C.id AS id_cliente,
        CONCAT(C.nombre, ' ', C.apellido) AS Cliente,
        COUNT(P.codigo_pedido) AS Pedidos
    FROM Pedidos P
    INNER JOIN  Clientes C ON P.id_cliente = C.id
    GROUP BY C.id, C.Nombre, C.apellido ;

/*
------------------------------------------------------------
                        CONSULTA 5
Buscar clientes por nombre parcial usando LIKE
------------------------------------------------------------
*/

SELECT *
    FROM Clientes
    WHERE nombre LIKE 'A%';
  
/*
------------------------------------------------------------
                        CONSULTA 6
Consultar productos de ciertas categorías usando IN
------------------------------------------------------------
*/

SELECT
        P.nombre AS producto,
        C.categoria AS Categoria,
        P.id As id_producto
    FROM Productos P
    INNER JOIN Categorias C ON P.id_categoria = C.id
    WHERE C.categoria IN ('Gaseosa', 'Jugo');

/*
------------------------------------------------------------
                        CONSULTA 7
Mostrar el cliente con mayor número de pedidos (subconsulta)
------------------------------------------------------------
*/

SELECT 
    CONCAT(C.nombre, ' ', C.apellido) AS Cliente,
    COUNT(P.id) AS Total_pedidos
FROM Clientes C
INNER JOIN Pedidos P ON P.id_cliente = C.id
GROUP BY C.id, C.nombre, C.apellido
ORDER BY Total_pedidos DESC
LIMIT 1;


/*
------------------------------------------------------------
                        CONSULTA 8
Consultar pedidos y sus totales agrupados por sede
------------------------------------------------------------
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