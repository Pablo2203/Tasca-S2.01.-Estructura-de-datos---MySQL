-- Data Base
CREATE DATABASE optica_culo_de_botella;
USE optica_culo_de_botella;

-- Table brand 
CREATE TABLE brand (
    idbrand INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    suppliers_idsupplier INT,
    INDEX (suppliers_idsupplier)
);

-- Table glasses
CREATE TABLE glasses (
    idglasses INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(45),
    graduation_left_eye DECIMAL(4,2),
    graduation_right_eye DECIMAL(4,2),
    frame ENUM('flotante', 'pasta', 'metálica', 'mixta'),
    frame_color VARCHAR(45),
    glass_color VARCHAR(45),
    price DECIMAL(10,2),
    glassescol VARCHAR(45),
    brand_idbrand INT,
    INDEX (brand_idbrand),
    FOREIGN KEY (brand_idbrand) REFERENCES brand(idbrand)
);

-- Table contact_information
CREATE TABLE contact_information (
    idcontact_information INT AUTO_INCREMENT PRIMARY KEY,
    phone VARCHAR(45),
    street VARCHAR(45),
    street_number INT,
    floor INT,
    city VARCHAR(45),
    zip_code VARCHAR(10),
    province_state VARCHAR(45)
);

-- Table customers 
CREATE TABLE customers (
    idcustomers INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    email_address VARCHAR(45),
    registration_date DATETIME,
    contact_information_idcontact_information INT,
    INDEX (contact_information_idcontact_information),
    FOREIGN KEY (contact_information_idcontact_information) REFERENCES contact_information(idcontact_information)
);

-- Table employees 
CREATE TABLE employees (
    idemployee INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    lastname VARCHAR(45) NOT NULL
);

-- Table sales 
CREATE TABLE sales (
    idsales INT AUTO_INCREMENT PRIMARY KEY,
    date DATETIME NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    customers_idcustomers INT,
    employees_idemployee INT,
    INDEX (customers_idcustomers),
    INDEX (employees_idemployee),
    FOREIGN KEY (customers_idcustomers) REFERENCES customers(idcustomers),
    FOREIGN KEY (employees_idemployee) REFERENCES employees(idemployee)
);

-- Table sales_glasses 
CREATE TABLE sales_glasses (
    idsales INT,
    idglasses INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idsales, idglasses),
    FOREIGN KEY (idsales) REFERENCES sales(idsales),
    FOREIGN KEY (idglasses) REFERENCES glasses(idglasses)
);

-- Table recommendation 
CREATE TABLE recommendation (
    idrecommendation INT AUTO_INCREMENT PRIMARY KEY,
    recommended_by INT,
    INDEX (recommended_by),
    FOREIGN KEY (recommended_by) REFERENCES customers(idcustomers)
);