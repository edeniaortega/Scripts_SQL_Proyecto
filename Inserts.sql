---Inserts para clientes---
INSERT INTO negocio.clientes (
    nombre
    , apellido
    , email
    , telefono
) values ( 'Juan'
        , 'Martinez'
        , 'jmartinez@gmail.com'
        , '9528-1567'
)

INSERT INTO negocio.clientes (
    nombre
    , apellido
    , email
    , telefono
) VALUES ( 'Elisa'
        , 'Gomez'
        , 'gomez.elisa@gmail.com'
        , '8930-8852'
)

---Inserts para Computadoras---
INSERT INTO negocio.computadoras (
    numero_pc
    , estado

)VALUES ('PC001'
        , 'Ocupada')

INSERT INTO negocio.computadoras (
    numero_pc

)VALUES ('PC002')

---Inserts para Servicios---
INSERT into negocio.servicios (
    descripcion
    , precio_unitario
)VALUES ( 'impresion en blanco y negro'
        , 2.00
)

INSERT into negocio.servicios (
    descripcion
    , precio_unitario
)VALUES ( 'impresion a color'
        , 3.00
)

INSERT into negocio.servicios (
    descripcion
    , precio_unitario
)VALUES ( 'renta de pc por hora'
        , 15.00
)

---Inserts para Reservas---
INSERT into negocio.reservas(
    id_cliente
    , id_computadora
    , numero_reserva
    , fecha_hora_inicio
    , fecha_hora_fin
) VALUES ('1'
        , '1'
        , 'RES0001'
        , '2025-01-13 16:00:00'
        , '2025-01-13 18:00:00'
)

--- Inserts para factura ---
INSERT into negocio.factura(
    id_cliente
    , fecha
    , total
) VALUES ('1'
    ,'2025-01-13 18:05:00'
    , 30.00
)


--- Inserts para detalle_factura ---
INSERT into negocio.detalle_factura(
    id_factura
    , id_servicio
    , cantidad
    , subtotal
)values ('1','3',2,30.00)

UPDATE negocio.reservas
SET id_factura = '1'
where id = '1'