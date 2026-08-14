CREATE USER 'Administrador'@'localhost'  IDENTIFIED BY 'Admin123';
CREATE USER 'GerenteGT'@'localhost'  IDENTIFIED BY 'GerenteGT123';
CREATE USER 'Clinte_Edwin'@'localhost' IDENTIFIED BY 'Cliente123!';

GRANT ALL PRIVILEGES ON DISTRIBUIDORA_VALLE.* TO 'Administrador'@'localhost';
GRANT SELECT, INSERT, UPDATE ON distribuidora_db.* TO 'GerenteGT'@'localhost';

GRANT SELECT ON DISTRIBUIDORA_VALLE.Productos TO 'Clinte_Edwin'@'localhost';
GRANT SELECT, INSERT ON DISTRIBUIDORA_VALLE.Pedidos TO 'Clinte_Edwin'@'localhost';
GRANT SELECT, INSERT ON DISTRIBUIDORA_VALLE.Detalles_pedidos TO 'Clinte_Edwin'@'localhost';