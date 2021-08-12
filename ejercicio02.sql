BEGIN;
INSERT INTO pizza(id, name, url)
VALUES
(UUID_TO_BIN(UUID()), 'Carbonara', 'url')

INSERT INTO ingredient(id, name, price)
VALUES
(UUID_TO_BIN(UUID()), 'Tomate', 1)

INSERT INTO ingredient(id, name, price)
VALUES
(UUID_TO_BIN(UUID()), 'Queso', 3)

INSERT INTO pizza_ingredient (id, id_pizza, id_ingredient, cantidad) VALUES (UUID_TO_BIN(UUID()),
(SELECT id FROM pizza WHERE name='Carbonara'), (SELECT id FROM ingredient WHERE name='Tomate'), 1);

INSERT INTO pizza_ingredient (id, id_pizza, id_ingredient, cantidad) VALUES (UUID_TO_BIN(UUID()),
(SELECT id FROM pizza WHERE name='Carbonara'), (SELECT id FROM ingredient WHERE name='Queso'), 1); COMMIT;