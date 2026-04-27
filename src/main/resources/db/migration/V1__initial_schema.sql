-- 1. Inventory & Products (Dulcería e Insumos)
CREATE TABLE products (
                          id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                          name VARCHAR(255) NOT NULL,
                          barcode VARCHAR(100) UNIQUE,
                          purchase_price DECIMAL(10, 2) NOT NULL,
                          sale_price DECIMAL(10, 2), -- Nullable for salon-exclusive items
                          stock DECIMAL(10, 2) NOT NULL DEFAULT 0.00
);

-- 2. Services Catalog (Cortes, Tintes, etc.)
CREATE TABLE services (
                          id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                          name VARCHAR(255) NOT NULL,
                          suggested_price DECIMAL(10, 2)
);

-- 3. Main Sales Table (El Ticket general)
CREATE TABLE sales (
                       id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       sale_type VARCHAR(20) NOT NULL, -- Will store 'SERVICE' or 'PRODUCT'
                       total_amount DECIMAL(10, 2) NOT NULL
);

-- 4. Sale Details for Products (Venta de dulcería)
CREATE TABLE sale_product_details (
                                      id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                      sale_id BIGINT NOT NULL,
                                      product_id BIGINT NOT NULL,
                                      quantity INTEGER NOT NULL,
                                      unit_price DECIMAL(10, 2) NOT NULL,
                                      CONSTRAINT fk_sale_product FOREIGN KEY (sale_id) REFERENCES sales(id),
                                      CONSTRAINT fk_product_sold FOREIGN KEY (product_id) REFERENCES products(id)
);

-- 5. Sale Details for Services (Venta de cortes/peinados)
CREATE TABLE sale_service_details (
                                      id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                      sale_id BIGINT NOT NULL,
                                      service_id BIGINT NOT NULL,
                                      charged_price DECIMAL(10, 2) NOT NULL,
                                      CONSTRAINT fk_sale_service FOREIGN KEY (sale_id) REFERENCES sales(id),
                                      CONSTRAINT fk_service_performed FOREIGN KEY (service_id) REFERENCES services(id)
);

-- 6. Materials consumed during a service (Insumos gastados)
CREATE TABLE service_materials (
                                   id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                   sale_service_detail_id BIGINT NOT NULL,
                                   product_id BIGINT NOT NULL,
                                   quantity_used DECIMAL(10, 2) NOT NULL,
                                   CONSTRAINT fk_service_detail_material FOREIGN KEY (sale_service_detail_id) REFERENCES sale_service_details(id),
                                   CONSTRAINT fk_material_consumed FOREIGN KEY (product_id) REFERENCES products(id)
);