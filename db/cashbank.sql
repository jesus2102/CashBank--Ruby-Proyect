DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE merchants;

CREATE TABLE merchants(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL4 PRIMARY KEY,
  merchand_id INT4 REFERENCES merchants.id ON DELETE CASCADE,
  tag_id INT4 REFERENCES tags.id ON DELETE CASCADE,
  reference VARCHAR(255),
  transactions_date DATE
):
