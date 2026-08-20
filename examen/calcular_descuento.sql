/*
------------------------------------------------------------
								FUNCION 
	Calcular el descuento por tipo de cliente
------------------------------------------------------------
*/

DELIMITER //
CREATE FUNCTION calcular_descuento_cliente(p_total DECIMAL(10,2), p_tipo_cliente VARCHAR(20))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_total_con_descuento DECIMAL(10,2);

    IF p_tipo_cliente = 'Mayorista' THEN
        SET v_total_con_descuento = p_total * 0.90;
    ELSEIF p_tipo_cliente = 'Minorista' THEN
        SET v_total_con_descuento = p_total * 0.95;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tipo de cliente no válido';
    END IF;

    RETURN v_total_con_descuento;
END//
DELIMITER ;


