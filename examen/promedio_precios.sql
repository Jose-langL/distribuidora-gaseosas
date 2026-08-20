/*
------------------------------------------------------------
								CONSULTA
------------------------------------------------------------
*/
SELECT 
		P.nombre,
        AVG(P.precio) AS Promedio_total,
        C.categoria
	FROM Productos P
    INNER JOIN Categorias C ON P.id_categoria = C.id
    GROUP BY P.nombre, C.categoria
    ORDER BY Promedio_total DESC;

-- NOTA: No se uso el where para saber si era mayor a Q2500 ya que todos los precios estan cumple la sentencia por si solos

