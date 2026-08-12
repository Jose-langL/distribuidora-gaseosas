DELIMITER // 
CREATE FUNCTION fn_calcular_sub_total(id INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE Sub_total DECIMAL (5,2);
	-- mensaje por si no existe el pedido 
	IF NOT EXISTS (
		SELECT 1
        FROM Detalles_pedidos
        WHERE id_detalle = id
	) THEN 
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El pedido no existe';
    END IF;
    SELECT cantidad * precio_unitario
		INTO Sub_total
        FROM Detalles_pedidos
        WHERE id_detalle = id;
	
    RETURN Sub_total;
END// 
DELIMITER ; 