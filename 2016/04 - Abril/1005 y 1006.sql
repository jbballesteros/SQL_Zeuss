SELECT TM.TIPO,TM.NIT,TM.DIGITO,TM.PAPELLIDO,TM.SAPELLIDO,TM.PNOMBRE,TM.SNOMBRE,TM.RAZON_SOCIAL,SUM(P.VALOR) VALOR
FROM (

SELECT CF.CONCEPTO CONCEPTO,
 TR.NIT  NIT,
ROUND(SUM(CV.saldo_inicial+CV.debito-CV.credito),0) VALOR
FROM cuentas_val CV 
INNER JOIN cuentas_formatos CF ON (CV.cuenta=CF.cuenta)
INNER JOIN terceros T ON (CV.nit=T.nit)
INNER JOIN terceros TR ON (T.nit_real=TR.nit)

WHERE CF.formato=1005 AND CV.ano=2015 AND CV.mes=12
GROUP BY  CF.formato ,CF.concepto ,TR.NIT
HAVING ROUND(SUM(CV.saldo_inicial+CV.debito-CV.credito),0)<>0) AS P
LEFT JOIN terceros_medios TM ON (P.NIT=TM.NIT)

GROUP BY P.CONCEPTO,TM.TIPO,TM.NIT,TM.DIGITO,TM.PAPELLIDO,TM.SAPELLIDO,TM.PNOMBRE,TM.SNOMBRE,TM.RAZON_SOCIAL,TM.PAIS,TM.DIRECCION,TM.CIUDAD,TM.DEPARTAMENTO
ORDER BY CONCEPTO
