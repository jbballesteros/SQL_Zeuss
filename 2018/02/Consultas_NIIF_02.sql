 SELECT *
 FROM (

SELECT CV.ano,CV.mes,CV.cuenta,C.norma,SUM(CV.saldo_inicial+CV.debito-CV.credito) VALOR,
SUM(CV.saldo_inicial_niif+CV.debito_niif-CV.credito_niif) VALOR_NIIF
FROM cuentas_val CV INNER JOIN cuentas C ON (CV.cuenta=C.cuenta)
WHERE ano=2017 AND mes=12
GROUP BY CV.ano,CV.mes,CV.cuenta,C.norma

) AS P
WHERE   norma='C' AND VALOR=VALOR_NIIF
ORDER BY cuenta