DELIMITER //

CREATE FUNCTION year_diff_func(input_year INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE year_start DATE;
    SET year_start = STR_TO_DATE(CONCAT(input_year, '-01-01'), '%Y-%m-%d');

    RETURN TIMESTAMPDIFF(YEAR, year_start, CURDATE());
END//

DELIMITER ;

SELECT
    idata.id,
    idata.Year,
    year_diff_func(idata.Year) AS year_diff
FROM infectious_data idata
LIMIT 50;
