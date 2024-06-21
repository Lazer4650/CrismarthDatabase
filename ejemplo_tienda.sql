DROP DATABASE IF EXISTS crismarth;
CREATE DATABASE crismarth;
USE crismarth;

-- Tabla de Categorías
CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla de Proveedores
CREATE TABLE Proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla de Productos
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    id_categoria INT,
    id_proveedor INT,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

-- Tabla de Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla de Ventas
CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente INT,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Tabla de Detalle de Ventas
CREATE TABLE DetalleVentas (
    id_detalle_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Tabla de Inventarios
CREATE TABLE Inventarios (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Tabla de Pedidos
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_proveedor INT,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

-- Tabla de Detalle de Pedidos
CREATE TABLE DetallePedidos (
    id_detalle_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Insertar datos en la tabla Categorias
INSERT INTO Categorias (nombre, descripcion) VALUES
('Electrónicos', 'Dispositivos electrónicos de importación'),
('Ropa', 'Prendas de vestir importadas'),
('Accesorios', 'Accesorios diversos de importación'),
('Hogar', 'Productos para el hogar importados');

-- Insertar datos en la tabla Proveedores
INSERT INTO Proveedores (nombre, direccion, telefono, email) VALUES
('QIHUO', 'Lago Texcoco 185, Mariano Escobedo, Miguel Hidalgo, 11310 Ciudad de México, CDMX', '5545427456', NULL),
('CYZARK', 'Av. de los Barrios, Hab Los Reyes Ixtacala Barrio de los Árboles/Barrio de los Héroes, 54090 Tlalnepantla, Méx.', '2282862873', NULL);

-- Insertar datos en la tabla Productos
INSERT INTO Productos (nombre, descripcion, precio, stock, id_categoria, id_proveedor) VALUES
('Smartphone XYZ', 'Smartphone de última generación', 7999.99, 50, 1, 1),
('Laptop ABC', 'Laptop con procesador de última generación', 15999.99, 30, 1, 2),
('Camiseta Importada', 'Camiseta de algodón importada', 499.99, 100, 2, 1),
('Bolso de Cuero', 'Bolso de cuero genuino', 2999.99, 20, 3, 2),
('Sofá Importado', 'Sofá de alta calidad importado', 10999.99, 10, 4, 1);

-- Insertar datos en la tabla Clientes
INSERT INTO Clientes (nombre, direccion, telefono, email) VALUES
('Juan Pérez', 'Calle Falsa 123, Ciudad de México', '5551234567', 'juan.perez@example.com'),
('María López', 'Av. Siempre Viva 742, Ciudad de México', '5559876543', 'maria.lopez@example.com');

-- Insertar datos en la tabla Ventas
INSERT INTO Ventas (fecha, id_cliente, total) VALUES
('2024-06-01', 1, 8499.98),
('2024-06-15', 2, 12499.99);

-- Insertar datos en la tabla DetalleVentas
INSERT INTO DetalleVentas (id_venta, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 7999.99),
(1, 3, 1, 499.99),
(2, 2, 1, 15999.99);

-- Insertar datos en la tabla Inventarios
INSERT INTO Inventarios (id_producto, cantidad) VALUES
(1, 50),
(2, 30),
(3, 100),
(4, 20),
(5, 10);

-- Insertar datos en la tabla Pedidos
INSERT INTO Pedidos (fecha, id_proveedor, total) VALUES
('2024-05-20', 1, 20000.00),
('2024-06-10', 2, 30000.00);

-- Insertar datos en la tabla DetallePedidos
INSERT INTO DetallePedidos (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 50, 7999.99),
(1, 3, 100, 499.99),
(2, 2, 30, 15999.99),
(2, 4, 20, 2999.99),
(2, 5, 10, 10999.99);
