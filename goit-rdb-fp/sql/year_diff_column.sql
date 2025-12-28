USE pandemic;

SELECT
    idata.id,
    idata.Year,
    STR_TO_DATE(CONCAT(idata.Year, '-01-01'), '%Y-%m-%d') AS year_start_date,
    CURDATE() AS today,
    TIMESTAMPDIFF(
        YEAR,
        STR_TO_DATE(CONCAT(idata.Year, '-01-01'), '%Y-%m-%d'),
        CURDATE()
    ) AS year_diff
FROM infectious_data idata
LIMIT 50;


