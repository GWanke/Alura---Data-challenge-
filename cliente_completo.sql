SET sql_safe_updates=0;
START TRANSACTION;

DROP TABLE IF exists cliente_completo;

CREATE TABLE cliente_completo AS (SELECT A.person_id AS id_pessoa,
    C.loan_id AS id_emprestimo,
    D.cb_id AS id_historico,
    A.person_age AS pessoa_idade,
    A.person_income AS pessoa_sala_anual,
    A.person_home_ownership AS pessoa_tipo_casa,
    A.person_emp_length AS pessoa_tempo_trab_anual,
    C.loan_intent AS emprestimo_motiv,
    C.loan_grade AS emprestimo_grade,
    C.loan_amnt AS emprestimo_valor,
    C.loan_int_rate AS emprestimo_juros,
    C.loan_status AS emprestimo_inad,
    C.loan_percent_income AS emprestimo_renda,
    D.cb_person_default_on_file AS historico_inad,
    D.cb_person_cred_hist_length AS historico_credito FROM
    dados_mutuarios A
        INNER JOIN
    id B ON B.person_id = A.person_id
        INNER JOIN
    emprestimos C ON B.loan_id = C.loan_id
        INNER JOIN
    historicos_banco D ON B.cb_id = D.cb_id);
/* Pode estar em uma procedure, eh a regra de negocio para calcular o loan_percent_income. Possivelmente excluir
os resultados incompativeis.*/    
SELECT 
    emprestimo_valor,
    pessoa_sala_anual,
    emprestimo_renda,
    emprestimo_valor / pessoa_sala_anual AS resultado_div
FROM
    cliente_completo
WHERE
    emprestimo_renda <> ROUND(emprestimo_valor / pessoa_sala_anual, 2);

/*TO DO - IMPLEMENTAR EXPORTACAO DE CSV */

COMMIT;