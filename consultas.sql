USE sistema_facturacion; 
-- Obtener la lista de precios de todos los productos
SELECT id_producto as id, nombre, precio FROM producto ORDER BY precio desc;

-- Obtener la lista de productos cuya existencia en el inventario haya llegado al mínimo permitido (5 unidades)
SELECT producto.id_producto, producto.nombre, inventario.cantidad FROM producto
INNER JOIN inventario
ON producto.id_producto = inventario.id_producto
WHERE inventario.cantidad = 5;

-- Obtener una lista de clientes no mayores de 35 años que hayan realizado compras entre el 1 de febrero de 2000 y el 25 de mayo de 2000
SELECT * FROM cliente 
INNER JOIN factura
ON cliente.id_cliente = factura.id_cliente
WHERE cliente.edad <= 35 AND (factura.fecha_compra BETWEEN '2000-02-01' AND '2000-05-25');

--Obtener el valor total vendido por cada producto en el año 2000
SELECT producto.nombre , SUM(producto.precio) AS total_ano_producto FROM factura
INNER JOIN factura_producto 
ON factura.id_factura = factura_producto.id_factura
INNER JOIN producto
ON factura_producto.id_producto = producto.id_producto
WHERE YEAR(factura.fecha_compra) = 2000
GROUP BY  producto.nombre;

--Obtener la última fecha de compra de un cliente y según su frecuencia de compra estimar en qué fecha podría volver a comprar.

SELECT TOP 1 DATEADD(day,30,factura.fecha_compra) FROM cliente
INNER JOIN factura
ON cliente.id_cliente = factura.id_cliente
WHERE cliente.id_cliente = 1
ORDER BY factura.fecha_compra DESC
