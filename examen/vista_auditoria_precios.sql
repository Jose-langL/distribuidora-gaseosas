
/*
------------------------------------------------------------
							VIEW
                vista_auditoria_precios
------------------------------------------------------------
*/

CREATE VIEW vista_auditoria_precios AS
	SELECT 
			id_producto AS producto, 
			precio_anterior,
            precio_nuevo,
            fecha_cambio
		FROM auditoria_precios;
        
SELECT * FROM auditoria_precios;
