SET sql_safe_updates=0;
START TRANSACTION;

SELECT 
    COUNT(*)
FROM
    historicos_banco;
    
DELETE FROM historicos_banco 
WHERE
    (cb_person_default_on_file = '')
    OR (cb_person_cred_hist_length IS NULL);

SELECT 
    COUNT(*)
FROM
    historicos_banco;

COMMIT;