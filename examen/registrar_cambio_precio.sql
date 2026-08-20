/*
------------------------------------------------------------
							trigger
                registrar_cambio_precio_trigger
------------------------------------------------------------
*/
DELIMITER //
CREATE TRIGGER registrar_cambio_precio
AFTER UPDATE ON Productos
FOR EACH ROW
BEGIN
    IF OLD.precio <> NEW.precio THEN
        INSERT INTO auditoria_precios (id_producto, precio_anterior, precio_nuevo, fecha_cambio)
        VALUES (OLD.id, OLD.precio, NEW.precio, NOW());
    END IF;
END//
DELIMITER ;