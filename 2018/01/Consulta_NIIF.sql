SELECT *
FROM (


SELECT CV.cuenta CODIGO,C.descripcion CUENTA,
sum(CASE WHEN CV.MES=1 THEN CV.saldo_inicial ELSE 0 end) CV_SALDO_INICIAL,
sum(CASE WHEN CV.MES=1 THEN CV.saldo_inicial ELSE 0 end) +SUM(CV.debito)-SUM(CV.credito) SALDO_FINAL,
sum(CASE WHEN CV.MES=1 THEN CV.saldo_inicial_niif ELSE 0 end)  CV_SALDO_INICIAL_NIIF,
sum(CASE WHEN CV.MES=1 THEN CV.saldo_inicial_niif ELSE 0 end) +SUM(CV.debito_niif)-SUM(CV.credito_niif) SALDO_FINAL_NIIF
FROM cuentas_val CV INNER JOIN cuentas C ON (CV.cuenta=C.cuenta)
WHERE CV.ano=2017 AND CV.mes<>13
GROUP BY CV.cuenta,C.descripcion



) AS P
WHERE (P.SALDO_FINAL-P.SALDO_FINAL_NIIF)<>0
ORDER BY P.CODIGO