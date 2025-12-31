CREATE SCHEMA IF NOT EXISTS pandemic;
USE pandemic;

SELECT * FROM infectious_cases LIMIT 50;

CREATE TABLE entities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entity VARCHAR(255),
    code VARCHAR(10)
);

INSERT INTO entities (entity, code)
SELECT DISTINCT Entity, Code
FROM infectious_cases;

CREATE TABLE infectious_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entity_id INT,
    Year INT,
    Number_rabies INT,
    FOREIGN KEY (entity_id) REFERENCES entities(id)
);

INSERT INTO infectious_data (entity_id, Year, Number_rabies)
SELECT e.id, ic.Year,
       NULLIF(ic.Number_rabies, '') 
FROM infectious_cases ic
JOIN entities e
     ON ic.Entity = e.entity
    AND ic.Code = e.code;

SELECT * FROM entities LIMIT 50;
SELECT * FROM infectious_data LIMIT 50;



