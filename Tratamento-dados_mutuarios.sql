SET sql_safe_updates=0;
START TRANSACTION;

SELECT 
    COUNT(*)
FROM
    dados_mutuarios;

DELETE FROM dados_mutuarios 
WHERE
    (person_id IS NULL)
    OR (person_age IS NULL)
    OR (person_age NOT BETWEEN 15 AND 100)
    OR (person_income IS NULL)
    OR (person_home_ownership = '')
    OR (person_emp_length IS NULL)
    OR (person_emp_length > 100);

SELECT 
    COUNT(*)
FROM
    dados_mutuarios;
COMMIT;