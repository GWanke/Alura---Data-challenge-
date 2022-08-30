SET sql_safe_updates=0;
START TRANSACTION;

SELECT 
    COUNT(*)
FROM
    emprestimos;

DELETE FROM emprestimos 
WHERE
    (loan_intent = '')
    OR (loan_grade NOT BETWEEN 'A' AND 'G')
    OR (loan_amnt IS NULL)
    OR (loan_int_rate IS NULL)
    OR (loan_status IS NULL)
    OR (loan_percent_income IS NULL);

SELECT 
    COUNT(*)
FROM
    emprestimos;

COMMIT;