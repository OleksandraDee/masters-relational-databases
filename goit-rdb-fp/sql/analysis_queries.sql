SELECT 
    e.entity,
    e.code,
    AVG(idata.Number_rabies) AS avg_rabies,
    MIN(idata.Number_rabies) AS min_rabies,
    MAX(idata.Number_rabies) AS max_rabies,
    SUM(idata.Number_rabies) AS sum_rabies
FROM infectious_data idata
JOIN entities e ON idata.entity_id = e.id
WHERE idata.Number_rabies IS NOT NULL
GROUP BY e.entity, e.code
ORDER BY avg_rabies DESC
LIMIT 10;
