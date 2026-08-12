INSERT INTO Categorias (id, categoria) VALUES
    (1, 'Gaseosa'),
    (2, 'Té frío'),
    (3, 'Jugo'),
    (4, 'Bebida energética');

INSERT INTO Volumen_ml (id, volumen_ml) VALUES
    (1, 600),
    (2, 473),
    (3, 500),
    (4, 355);

INSERT INTO Encargados (id, nombre, apellido) VALUES
    (1, 'Rosa', 'Marroquin'),
    (2, 'Julio', 'Aguirre'),
    (3, 'Hector', 'Villagran');

INSERT INTO Clientes (id, nombre, apellido, telefono, direccion, identificacion, correo) VALUES
    (1, 'Roberto', 'Hernandez', 45614226, '4a Calle 8-27, Santa Catarina Pinula, Guatemala', '1819600133890', 'roberto.hernandez72@gmail.com'),
    (2, 'Byron', 'Perez', 56708456, '5a Calle 5-37, Fraijanes, Guatemala', '5116155940781', 'byron.perez49@gmail.com'),
    (3, 'Oscar', 'Martinez', 44823498, '13a Calle 10-20, Zona 10, Guatemala', '1647525534192', 'oscar.martinez69@gmail.com'),
    (4, 'Marta', 'Ortiz', 44842788, '14a Calle 2-50, Zona 15, Guatemala', '4139537672423', 'marta.ortiz96@gmail.com'),
    (5, 'Sofia', 'Gonzalez', 52525206, '13a Calle 2-24, Zona 7, Guatemala', '2691669784801', 'sofia.gonzalez88@gmail.com'),
    (6, 'Andrea', 'Reyes', 45418934, '9a Calle 6-74, Zona 4, Guatemala', '4893252880957', 'andrea.reyes3@gmail.com'),
    (7, 'Alejandro', 'Martinez', 49153566, '14a Calle 3-78, Fraijanes, Guatemala', '2278248963834', 'alejandro.martinez52@gmail.com'),
    (8, 'Maria', 'Aguilar', 44694634, '1a Calle 3-90, Zona 1, Guatemala', '3105183473829', 'maria.aguilar74@gmail.com'),
    (9, 'Daniela', 'Rodriguez', 57897151, '8a Calle 2-96, San Miguel Petapa, Guatemala', '1065133387262', 'daniela.rodriguez36@gmail.com');

INSERT INTO Productos (id, nombre, id_categoria, id_volumen_ml, precio, stock_actual, stock_minimo) VALUES
    (1, 'Fanta', 1, 1, 6.25, 371, 44),
    (2, 'Jumex', 3, 3, 12.37, 280, 26),
    (3, 'Lipton', 2, 2, 14.89, 88, 39),
    (4, 'Tampico', 3, 3, 12.42, 389, 27),
    (5, 'Naturas', 3, 1, 8.90, 480, 33),
    (6, 'Pepsi', 1, 1, 8.77, 287, 28),
    (7, 'Red Bull', 4, 4, 9.34, 229, 43);

INSERT INTO Sedes (id, nombre, direccion, telefono, capacidad_almacenamiento, id_encargado) VALUES
    (1, 'Guatemala', 'Km 21.5 Carretera al Pacifico, Bucaramanga, Guatemala', 22456782, 22000, 1),
    (2, 'Huehuetenango', 'Calzada Roosevelt 32-10, Piedecuesta, Guatemala', 22456783, 18000, 2),
    (3, 'Peten', '3a Avenida 5-21, Zona 1, Giron, Guatemala', 22456781, 15000, 3);

INSERT INTO Pedidos (id, codigo_pedido, direccion, fecha, id_cliente, id_sede) VALUES
    (1, 'AL-85', '4a Calle 8-27, Santa Catarina Pinula, Guatemala', '2025-05-23', 1, 1),
    (2, 'PE-56', '5a Calle 5-37, Fraijanes, Guatemala', '2025-10-23', 2, 2),
    (3, 'MO-98', '13a Calle 10-20, Zona 10, Guatemala', '2025-10-13', 3, 2),
    (4, 'SU-84', '14a Calle 2-50, Zona 15, Guatemala', '2025-07-24', 4, 1),
    (5, 'SU-24', '13a Calle 2-24, Zona 7, Guatemala', '2025-05-31',  5, 1),
    (6, 'FA-40', '9a Calle 6-74, Zona 4, Guatemala', '2025-01-30',  6, 1),
    (7, 'JU-38', '14a Calle 3-78, Fraijanes, Guatemala', '2025-02-02', 7, 3),
    (8, 'GA-22', '1a Calle 3-90, Zona 1, Guatemala', '2025-02-19', 8, 3),
    (9, 'NE-22', '8a Calle 2-96, San Miguel Petapa, Guatemala', '2025-01-26', 9, 2);

INSERT INTO Detalles_pedidos (id_detalle, id_pedido, id_producto, cantidad, precio_unitario) VALUES
    (1, 1, 1, 1, 6.25),
    (2, 2, 6, 7, 8.77),
    (3, 3, 3, 8, 14.89),
    (4, 4, 2, 12, 12.37),
    (5, 5, 4, 14, 12.42),
    (6, 6, 5, 8, 8.90),
    (7, 7, 7, 11, 9.34),
    (8, 8, 6, 22, 12.72),
    (9, 9, 2, 21, 10.11);