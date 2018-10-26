DROP TABLE products;
DROP TABLE suppliers;


CREATE TABLE suppliers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  distance INT4
);

CREATE TABLE products (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255),
  qty INT4 NOT NULL,
  cost_price INT4,
  sell_price INT4,
  supplier_id INT4 REFERENCES suppliers(id)
);
