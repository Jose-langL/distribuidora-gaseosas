/*
------------------------------------------------------------
							EVENTO 1
	Reponer stock de productos con stock crítico cada día.
------------------------------------------------------------
*/

CREATE EVENT ev_reponer_stock_critico
ON SCHEDULE EVERY 1 DAY
DO
    UPDATE Productos
    SET stock_actual = stock_actual + 50
    WHERE stock_actual <= stock_minimo; 

/*
---------------------------------------------------------------------------
                            EVENTO 2
Aplicar un descuento del 10% a los productos con stock excesivo cada semana
---------------------------------------------------------------------------
*/

CREATE EVENT ev_descuento_exceso_stock
ON SCHEDULE EVERY 1 WEEK
DO
    UPDATE Productos
    SET precio = precio * 0.90
    WHERE stock_actual > 500;