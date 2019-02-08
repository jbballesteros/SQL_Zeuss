SELECT ISNULL(P.NIT,T.NIT) NIT,ISNULL(P.NOMBRES,T.NOMBRES) NOMBRES,ISNULL(P.CARTERA,0) CARTERA,ISNULL(T.SALDO,0) CONTABLE 
FROM (

SELECT T.nit,T.nombres,
SUM(CASE WHEN D.sw IN (1,21,22 ) THEN (D.valor_total-D.valor_aplicado)
WHEN D.sw IN (2,5,23) THEN (D.VALOR_TOTAL-D.VALOR_APLICADO)*-1
ELSE 0 END) CARTERA
FROM documentos D INNER JOIN terceros T ON (D.nit=T.nit)
WHERE D.sw IN (1,2,5,21,22,23) AND D.valor_aplicado<>D.valor_total
GROUP BY T.nit,T.nombres) AS P FULL JOIN (



SELECT CV.nit,T.nombres,SUM(CV.saldo_inicial+CV.debito-CV.credito) SALDO
FROM cuentas_val CV INNER JOIN terceros T ON (CV.nit=T.nit)
WHERE CV.cuenta LIKE '1305%' AND ano=2017 AND mes=1
GROUP BY CV.nit,T.nombres) AS T ON P.nit=T.nit
