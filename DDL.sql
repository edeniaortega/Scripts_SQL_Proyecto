CREATE SCHEMA negocio

CREATE TABLE negocio.clientes (
    id INT IDENTITY(1,1) PRIMARY KEY
    , nombre NVARCHAR(100) NOT NULL
    , apellido NVARCHAR(100) NOT NULL
    , email NVARCHAR(100) 
    , telefono NVARCHAR(100) NOT NULL
);

CREATE TABLE negocio.computadoras (
    id INT IDENTITY(1,1) PRIMARY KEY
    , numero_pc NVARCHAR(100) NOT NULL
    , estado NVARCHAR(100) NOT NULL
        DEFAULT 'Disponible'
        CHECK (estado IN ('Disponible','Ocupada','En Mantenimiento'))
)

CREATE TABLE negocio.servicios (
    id INT IDENTITY(1,1) PRIMARY KEY
    , descripcion NVARCHAR(100) NOT NULL
    , precio_unitario DECIMAL(10,2) NOT NULL 
)

CREATE TABLE negocio.reservas (
    id INT IDENTITY(1,1) PRIMARY KEY
    , id_cliente INT NOT NULL
    , id_computadora INT NOT NULL
    , numero_reserva NVARCHAR(100) NOT NULL
    , fecha_hora_inicio DATETIME NOT NULL
    , fecha_hora_fin DATETIME NOT NULL
)

CREATE TABLE negocio.factura (
    id INT IDENTITY(1,1) PRIMARY KEY NOT NULL
    , id_cliente INT NOT NULL
    , fecha DATETIME NOT NULL
    , total DECIMAL(10,2) NOT NULL
)

CREATE TABLE negocio.detalle_factura(
    id INT IDENTITY(1,1) PRIMARY KEY NOT NULL
    , id_factura INT NOT NULL
    , id_servicio INT NOT NULL
    , cantidad DECIMAL(10,2) NOT NULL
    , subtotal DECIMAL(10,2) NOT NULL
)

ALTER TABLE negocio.reservas 
ADD CONSTRAINT FK_NR_C FOREIGN KEY(id_cliente) REFERENCES negocio.clientes(id)

ALTER TABLE negocio.reservas
ADD CONSTRAINT FK_NR_PC FOREIGN KEY(id_computadora) REFERENCES negocio.computadoras(id)

ALTER TABLE negocio.factura
ADD CONSTRAINT FK_NF_C FOREIGN KEY(id_cliente) REFERENCES negocio.clientes(id)

ALTER TABLE negocio.detalle_factura
ADD CONSTRAINT FK_NDF_F FOREIGN KEY(id_factura) REFERENCES negocio.factura(id)

ALTER TABLE negocio.detalle_factura
ADD CONSTRAINT FK_NDF_S FOREIGN KEY(id_servicio) REFERENCES negocio.servicios(id)

--Cambios Tabla Reservas --
ALTER TABLE negocio.reservas
DROP COLUMN numero_reserva;

ALTER TABLE negocio.reservas
DROP COLUMN fecha_hora_inicio;

ALTER TABLE negocio.reservas
DROP COLUMN fecha_hora_fin;

ALTER TABLE negocio.reservas
ADD id_factura INT NOT NULL 

ALTER TABLE negocio.reservas
ADD CONSTRAINT FK_NR_F FOREIGN KEY(id_factura) REFERENCES negocio.factura(id)

ALTER TABLE negocio.reservas
DROP CONSTRAINT FK_NR_C

