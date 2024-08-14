DROP TABLE IF EXISTS currency;
DROP TABLE IF EXISTS exchange_rate;

CREATE TABLE IF NOT EXISTS currency (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code VARCHAR(3) UNIQUE NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    sign VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS exchange_rate (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    base_currency_id INTEGER REFERENCES currency (id),
    target_currency_id INTEGER REFERENCES currency (id),
    rate DECIMAL(6),
    UNIQUE (base_currency_id, target_currency_id)
);

INSERT INTO currency(code, full_name, sign)
VALUES ('RUB', 'Russian Ruble', '₽'),
       ('EUR', 'Euro', '€'),
       ('GBP', 'Pound Sterling', '£'),
       ('USD', 'US Dollar', '$'),
       ('ETB', 'Ethiopian Birr', null);

INSERT INTO exchange_rate(base_currency_id, target_currency_id, rate)
VALUES (1, 2, 0.01070),
       (1, 3, 0.00903),
       (1, 4, 0.01161),
       (1, 5, null),
       (2, 1, 93.474),
       (4, 1, 86.1075);