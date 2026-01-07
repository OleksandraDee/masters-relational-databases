SELECT
    id,
    date,
    YEAR(date)   AS year_value,
    MONTH(date)  AS month_value,
    DAY(date)    AS day_value
FROM orders;

SELECT
    id,
    date,
    DATE_ADD(date, INTERVAL 1 DAY) AS date_plus_one_day
FROM orders;

SELECT
    id,
    date,
    UNIX_TIMESTAMP(date) AS timestamp_value
FROM orders;

SELECT 
    COUNT(*) AS rows_count
FROM orders
WHERE date BETWEEN '1996-07-10 00:00:00' AND '1996-10-08 00:00:00';

SELECT
    id,
    date,
    JSON_OBJECT(
        'id', id,
        'date', date
    ) AS json_value
FROM orders;
