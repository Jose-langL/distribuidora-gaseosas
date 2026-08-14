/*
------------------------------------------------------------
								FUNCION 1
	Calcular el subtotal de un pedido dado su id_detalle.
------------------------------------------------------------
*/

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

/*
------------------------------------------------------------
								FUNCION 2
	Calcular el total de un pedido dado su id_pedido, incluyendo IVA.
------------------------------------------------------------
*/

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

/*
------------------------------------------------------------
								FUNCION 3
	Validar el stock de un producto antes de hacer un pedido.
------------------------------------------------------------
*/

DELIMITER // 
CREATE FUNCTION fn_validar_stock (p_id_detalle INT)
RETURNS VARCHAR(100)
DETERMINISTIC 
BEGIN
	DECLARE v_stock_actual INT;
    DECLARE v_cantidad_pedida INT;
	DECLARE v_mensaje VARCHAR(100);
    
    IF NOT EXISTS (
		SELECT 1 
        FROM Detalles_pedidos
        WHERE id_detalle = p_id_detalle 
	) THEN 
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El detalle del pedido solicitado no existe';
	END IF; 
    
	SELECT P.stock_actual, DP.cantidad
		INTO v_stock_actual, v_cantidad_pedida
		FROM Productos P 
        INNER JOIN Detalles_pedidos DP ON P.id = DP.id_producto
        WHERE DP.id_detalle = p_id_detalle;
        
	IF v_stock_actual >= v_cantidad_pedida THEN 
		SET v_mensaje = 'Hay suficiente stock para hacer el envio';
    ELSE
		SET v_mensaje = 'Stock insuficiente';	
    END IF;
    
	RETURN v_mensaje;
END// 
DELIMITER ; 

