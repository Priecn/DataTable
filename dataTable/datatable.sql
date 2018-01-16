CREATE TABLE datatable_product (
	id SERIAL,
	code VARCHAR(20),
	name VARCHAR(50),
	brand VARCHAR(50),
	unit_price DECIMAL(10,2),
	quantity INT,
	CONSTRAINT pk_datatable_product_id PRIMARY KEY (id)
);

INSERT INTO datatable_product (code, name, brand, unit_price, quantity)
VALUES ('PRDABC123DEFX', 'iPhone 5s', 'apple', 18000, 5);

INSERT INTO datatable_product (code, name, brand, unit_price, quantity)
VALUES ('PRDDEF123DEFX', 'Samsung s7', 'samsung', 32000, 2);

INSERT INTO datatable_product (code, name, brand, unit_price, quantity)
VALUES ('PRDPQR123WGTX', 'Google Pixel', 'google', 57000, 5);

INSERT INTO datatable_product (code, name, brand, unit_price, quantity)
VALUES ('PRDMNO123PQRX', ' Macbook Pro', 'apple', 54000, 3);

INSERT INTO datatable_product (code, name, brand, unit_price, quantity)
VALUES ('PRDABCXYZDEFX', 'Dell Latitude E6510', 'dell', 48000, 5);

select * from datatable_product;

  2 PRDDEF123DEFX Samsung s7 samsung   32000.00        2
