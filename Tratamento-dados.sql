SET sql_safe_updates=0;
START TRANSACTION;

SELECT 
    COUNT(*)
FROM
    dados_mutuarios;

DELETE FROM dados_mutuarios 
WHERE
    (person_age IS NULL)
    OR (person_income IS NULL)
    OR (person_emp_length IS NULL);

SELECT 
    COUNT(*)
FROM
    dados_mutuarios;
COMMIT;