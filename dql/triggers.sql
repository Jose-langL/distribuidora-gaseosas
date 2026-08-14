/*
---------------------------------------------------------------------------
							TRIGGER 1
Actualizar el stock de un producto después de insertar un detalle de pedido.
---------------------------------------------------------------------------
*/

DELIMITER //
CREATE TRIGGER tr_actualizar_stock
AFTER INSERT ON Detalles_pedidos
FOR EACH ROW
BEGIN
    UPDATE Productos
    SET stock_actual = stock_actual - NEW.cantidad
    WHERE id = NEW.id_producto;
END//
DELIMITER ;	

/*
------------------------------------------------------------
                            TRIGGER 2
        Auditar cambios en el precio de los productos.
------------------------------------------------------------
*/

DELIMITER //
CREATE TRIGGER tr_auditar_cambio_precio
AFTER UPDATE ON Productos
FOR EACH ROW
BEGIN
    IF OLD.precio <> NEW.precio THEN
        INSERT INTO auditoria_precios (id_producto, precio_anterior, precio_nuevo, fecha_cambio)
        VALUES (OLD.id, OLD.precio, NEW.precio, NOW());
    END IF;
END//
DELIMITER ;