USE flask_test;

CREATE TABLE test (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO test (id, name) VALUES (1, 'John'), (2, 'Jane'), (3, 'Bob');
