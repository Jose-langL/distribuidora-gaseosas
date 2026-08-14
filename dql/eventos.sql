CREATE EVENT ev_reponer_stock_critico
ON SCHEDULE EVERY 1 DAY
DO
    UPDATE Productos
    SET stock_actual = stock_actual + 50
    WHERE stock_actual <= stock_minimo; 

CREATE EVENT ev_descuento_exceso_stock
ON SCHEDULE EVERY 1 WEEK
DO
    UPDATE Productos
    SET precio = precio * 0.90
    WHERE stock_actual > 500;