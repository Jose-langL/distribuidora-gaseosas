# Distribuidora de Gaseosas del Valle S.A. 🏪

## Descripción del Proyecto
Base de datos para gestionar una distribuidora de gaseosas: clientes, pedidos, productos, sedes y encargados. 
Cuenta con 8 tablas relacionadas, y varios procesos automáticos que facilitan el control del negocio (stock, precios, alertas).

La carpeta `dql` contiene los scripts de consultas, vistas, funciones, triggers, eventos y usuarios.

## Funciones
- **`fn_calcular_sub_total`** — Calcula el subtotal de un producto dentro de un pedido.
- **`fn_calcular_total_con_iva`** — Calcula el total de un pedido completo, incluyendo el IVA.
- **`fn_validar_stock`** — Indica si hay stock suficiente para completar una venta.

## Vistas
- **`vw_resumen_pedidos_por_sede`** — Total de pedidos y ventas por sede.
- **`vw_productos_bajo_stock`** — Productos que necesitan reabastecimiento.
- **`vw_clientes_activos`** — Clientes con al menos un pedido registrado.

## Triggers
- **`tr_actualizar_stock`** — Descuenta el stock automáticamente cuando se vende un producto.
- **`tr_auditar_cambio_precio`** — Registra el historial de cambios de precio de los productos.

## Eventos
- **`ev_reponer_stock_critico`** — Repone stock automáticamente cuando un producto está muy bajo.
- **`ev_descuento_exceso_stock`** — Aplica descuento a productos con exceso de inventario.

## Usuarios
- **`usuario_administrador`** — Acceso total al sistema.
- **`usuario_gerente`** — Puede consultar, agregar y actualizar información, pero no eliminar.
- **`usuario_cliente`** — Puede ver productos y hacer pedidos.

## Recomendaciones para expansión futura
- Agregar gestión de repartidores y seguimiento de entregas.
- Ampliar la auditoría para registrar también cambios de stock, no solo de precio.
- Guardar reportes históricos de ventas para analizar tendencias con el tiempo.