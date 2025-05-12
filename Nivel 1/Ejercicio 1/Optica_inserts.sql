
INSERT INTO brand (name, suppliers_idsupplier) VALUES
('Ray-Ban', 1),
('Oakley', 2),
('Prada', 3),
('Gucci', 4),
('Armani', 5);


INSERT INTO contact_information (phone, street, street_number, floor, city, zip_code, province_state) VALUES
('+34 123 456 789', 'Calle Mayor', 10, 2, 'Madrid', '28001', 'Madrid'),
('+34 987 654 321', 'Avenida Diagonal', 500, NULL, 'Barcelona', '08001', 'Barcelona'),
('+34 555 123 456', 'Gran Vía', 45, 1, 'Valencia', '46001', 'Valencia'),
('+34 666 789 123', 'Calle Sierpes', 20, NULL, 'Sevilla', '41001', 'Sevilla'),
('+34 777 456 789', 'Calle Uría', 30, 3, 'Oviedo', '33001', 'Asturias');


INSERT INTO customers (name, email_address, registration_date, contact_information_idcontact_information) VALUES
('Juan Pérez', 'juan.perez@email.com', '2023-01-15 10:00:00', 1),
('María García', 'maria.garcia@email.com', '2023-02-20 11:30:00', 2),
('Carlos López', 'carlos.lopez@email.com', '2023-03-10 09:15:00', 3),
('Ana Martínez', 'ana.martinez@email.com', '2023-04-05 16:45:00', 4),
('Luisa Fernández', 'luisa.fernandez@email.com', '2023-05-12 14:20:00', 5);


INSERT INTO employees (name, lastname) VALUES
('Pedro', 'Gómez'),
('Sofía', 'Ruiz'),
('Miguel', 'Hernández'),
('Elena', 'Díaz'),
('Javier', 'Moreno');


INSERT INTO glasses (brand, graduation_left_eye, graduation_right_eye, frame, frame_color, glass_color, price, glassescol, brand_idbrand) VALUES
('Ray-Ban', -1.50, -1.75, 'metálica', 'negro', 'transparente', 150.00, 'clásico', 1),
('Oakley', -2.00, -2.00, 'pasta', 'azul', 'espejado', 200.00, 'deportivo', 2),
('Prada', -0.75, -1.25, 'mixta', 'dorado', 'degradado', 350.00, 'elegante', 3),
('Gucci', 0.00, 0.00, 'flotante', 'plateado', 'polarizado', 400.00, 'fashion', 4),
('Armani', -3.00, -3.50, 'metálica', 'titanio', 'transparente', 250.00, 'moderno', 5);


INSERT INTO sales (date, price, quantity, customers_idcustomers, employees_idemployee) VALUES
('2023-06-01 12:30:00', 150.00, 1, 1, 1),
('2023-06-02 15:45:00', 400.00, 1, 2, 2),
('2023-06-03 10:15:00', 350.00, 1, 3, 3),
('2023-06-04 17:30:00', 200.00, 2, 4, 4),
('2023-06-05 11:00:00', 250.00, 1, 5, 5);


INSERT INTO sales_glasses (idsales, idglasses, quantity) VALUES
(1, 1, 1),
(2, 4, 1),
(3, 3, 1),
(4, 2, 2),
(5, 5, 1);


INSERT INTO recommendation (recommended_by) VALUES
(1),
(2),
(3),
(4),
(5);