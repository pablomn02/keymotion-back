DROP DATABASE IF EXISTS keymotion;
CREATE DATABASE IF NOT EXISTS keymotion;
USE keymotion;

-- Tabla para los usuarios
CREATE TABLE usuarios (
                          id_usuario INT AUTO_INCREMENT PRIMARY KEY,
                          nombre VARCHAR(50) NOT NULL,
                          correo VARCHAR(100) NOT NULL UNIQUE,
                          contrasena VARCHAR(255) NOT NULL,
                          telefono VARCHAR(20),
                          direccion VARCHAR(255),
                          tipo_usuario ENUM('COMPRADOR', 'VENDEDOR', 'ADMIN') DEFAULT 'COMPRADOR',
                          fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para los vehículos
CREATE TABLE vehiculos (
                           id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
                           id_vendedor INT NOT NULL,
                           marca VARCHAR(50) NOT NULL,
                           modelo VARCHAR(50) NOT NULL,
                           anio YEAR NOT NULL,
                           precio DECIMAL(10, 2) NOT NULL,
                           tipo_combustible ENUM('GASOLINA', 'DIESEL', 'ELECTRICO', 'HIBRIDO') NOT NULL,
                           transmision ENUM('MANUAL', 'AUTOMATICA') NOT NULL,
                           kilometraje INT NOT NULL,
                           descripcion TEXT,
                           imagenes JSON,
                           estado ENUM('DISPONIBLE', 'VENDIDO', 'RESERVADO') DEFAULT 'DISPONIBLE',
                           fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                           FOREIGN KEY (id_vendedor) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

-- Inserciones para la tabla de usuarios
INSERT INTO usuarios (nombre, correo, contrasena, telefono, direccion, tipo_usuario) VALUES
                                                                                         ('Juan Pérez', 'juan.perez@example.com', 'hashedpassword1', '555-1234', 'Calle Falsa 123', 'VENDEDOR'),
                                                                                         ('Ana Gómez', 'ana.gomez@example.com', 'hashedpassword2', '555-5678', 'Avenida Real 456', 'VENDEDOR'),
                                                                                         ('Carlos López', 'carlos.lopez@example.com', 'hashedpassword3', '555-8765', 'Boulevard Central 789', 'VENDEDOR'),
                                                                                         ('Luisa Martínez', 'luisa.martinez@example.com', 'hashedpassword4', '555-4321', 'Plaza Mayor 101', 'VENDEDOR'),
                                                                                         ('Luis Martínez', 'luis.martinez@example.com', 'hashedpassword4', '557-4321', 'Plaza Mayor 109', 'VENDEDOR');

-- Inserciones para la tabla de vehículos
INSERT INTO vehiculos (id_vendedor, marca, modelo, anio, precio, tipo_combustible, transmision, kilometraje, descripcion, imagenes, estado) VALUES
                                                                                                                                                (1, 'Toyota', 'Corolla', 2020, 15000.00, 'GASOLINA', 'AUTOMATICA', 30000, 'Sedán en excelente estado, ideal para ciudad.', '["https://toyota.com/corolla2020.jpg", "https://example.com/corolla_interior.jpg"]', 'DISPONIBLE'),
                                                                                                                                                (2, 'Ford', 'F-150', 2018, 28000.00, 'DIESEL', 'MANUAL', 45000, 'Camioneta poderosa, ideal para trabajo pesado.', '["https://ford.com/f1502018.jpg", "https://example.com/f150_back.jpg"]', 'DISPONIBLE'),
                                                                                                                                                (3, 'Tesla', 'Model 3', 2021, 40000.00, 'ELECTRICO', 'AUTOMATICA', 12000, 'Auto eléctrico con alta autonomía y tecnología avanzada.', '["https://tesla.com/model3.jpg", "https://example.com/tesla_interior.jpg"]', 'DISPONIBLE'),
                                                                                                                                                (4, 'Honda', 'Civic', 2019, 18000.00, 'GASOLINA', 'MANUAL', 25000, 'Vehículo compacto, eficiente en consumo de combustible.', '["https://honda.com/civic2019.jpg", "https://example.com/civic_side.jpg"]', 'DISPONIBLE');

-- Tabla para favoritos
CREATE TABLE favoritos (
                           id_favorito INT AUTO_INCREMENT PRIMARY KEY,
                           id_usuario INT NOT NULL,
                           id_vehiculo INT NOT NULL,
                           fecha_agregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                           FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
                           FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo) ON DELETE CASCADE
);

-- Tabla para transacciones
CREATE TABLE transacciones (
                               id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
                               id_comprador INT NOT NULL,
                               id_vehiculo INT NOT NULL,
                               precio_final DECIMAL(10, 2) NOT NULL,
                               fecha_transaccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                               FOREIGN KEY (id_comprador) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
                               FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo) ON DELETE CASCADE
);

-- Tabla para comentarios y calificaciones
CREATE TABLE comentarios (
                             id_comentario INT AUTO_INCREMENT PRIMARY KEY,
                             id_usuario INT NOT NULL,
                             id_vehiculo INT NOT NULL,
                             calificacion TINYINT CHECK (calificacion BETWEEN 1 AND 5),
                             comentario TEXT,
                             fecha_comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                             FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
                             FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo) ON DELETE CASCADE
);

-- Tabla para gestión de pagos
CREATE TABLE pagos (
                       id_pago INT AUTO_INCREMENT PRIMARY KEY,
                       id_usuario INT NOT NULL,
                       monto DECIMAL(10, 2) NOT NULL,
                       metodo_pago ENUM('TARJETA', 'PAYPAL', 'TRANSFERENCIA') NOT NULL,
                       fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       descripcion TEXT,
                       FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);
