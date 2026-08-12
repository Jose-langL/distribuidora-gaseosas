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

-- Calcular total con iva 

DELIMITER // 
CREATE FUNCTION fn_calcular_total_con_iva(p_id_pedido INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN 
	DECLARE total_iva DECIMAL(5,2);
	IF NOT EXISTS (
		SELECT 1
        FROM Detalles_pedidos
        WHERE id_pedido = p_id_pedido 
	) THEN 
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El pedido no existe';
    END IF; 
    
    SELECT 
		SUM(fn_calcular_sub_total(id_detalle) * 1.19 ) 
        INTO total_iva
		FROM Detalles_pedidos 
        WHERE id_pedido = p_id_pedido;
        
	RETURN total_iva;
END// 
DELIMITER ; 

SELECT fn_calcular_total_con_iva(1);