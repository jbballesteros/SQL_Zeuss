SELECT 1110 CONCEPTO,TM.TIPO,TM.NIT,TM.DIGITO,TM.PAPELLIDO,TM.SAPELLIDO,
TM.PNOMBRE,TM.SNOMBRE,TM.RAZON_SOCIAL,TM.PAIS,P.SALDO
FROM (

SELECT B.nit_banco,ROUND(SUM(CV.saldo_inicial+CV.debito-CV.credito),0) SALDO
FROM cuentas_val CV 
LEFT JOIN bancos B ON (B.cuenta=CV.cuenta)
LEFT JOIN cuentas C ON (C.cuenta=CV.cuenta)
WHERE CV.ano=2016 AND CV.mes=12 AND CV.cuenta LIKE '111005%'
GROUP BY B.nit_banco
HAVING SUM(CV.saldo_inicial+CV.debito-CV.credito)<>0
) AS P LEFT JOIN terceros_medios TM ON (P.nit_banco=TM.NIT)