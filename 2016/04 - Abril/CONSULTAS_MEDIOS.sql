SELECT CF.CONCEPTO CONCEPTO,
ROUND(SUM(CV.saldo_inicial+CV.debito-CV.credito),0)*-1 VALOR
FROM cuentas_val CV 
INNER JOIN cuentas_formatos CF ON (CV.cuenta=CF.cuenta)
INNER JOIN terceros T ON (CV.nit=T.nit)
INNER JOIN terceros TR ON (T.nit_real=TR.nit)

WHERE CF.formato=1008 AND CV.ano=2015 AND CV.mes=12 and CF.concepto=1317
GROUP BY  CF.formato ,CF.concepto
HAVING ROUND(SUM(CV.saldo_inicial+CV.debito-CV.credito),0)<>0

SELECT CF.CONCEPTO CONCEPTO,cv.cuenta,
ROUND(SUM(CV.saldo_inicial+CV.debito-CV.credito),0)*-1 VALOR
FROM cuentas_val CV 
INNER JOIN cuentas_formatos CF ON (CV.cuenta=CF.cuenta)
INNER JOIN terceros T ON (CV.nit=T.nit)
INNER JOIN terceros TR ON (T.nit_real=TR.nit)

WHERE CF.formato=1006 AND CV.ano=2015 AND CV.mes=12
GROUP BY  CF.formato ,CF.concepto,cv.cuenta
HAVING ROUND(SUM(CV.saldo_inicial+CV.debito-CV.credito),0)<>0


SELECT CF.CONCEPTO CONCEPTO,TR.nit,
ROUND(SUM(CV.saldo_inicial+CV.debito-CV.credito),0)*-1 VALOR
FROM cuentas_val CV 
INNER JOIN cuentas_formatos CF ON (CV.cuenta=CF.cuenta)
INNER JOIN terceros T ON (CV.nit=T.nit)
INNER JOIN terceros TR ON (T.nit_real=TR.nit)

WHERE CF.formato=1005 AND CV.ano=2015 AND CV.mes=12
GROUP BY  CF.formato ,CF.concepto,TR.nit
HAVING ROUND(SUM(CV.saldo_inicial+CV.debito-CV.credito),0)<>0