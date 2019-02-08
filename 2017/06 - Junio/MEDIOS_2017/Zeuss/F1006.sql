SELECT TM.TIPO,TM.NIT,TM.DIGITO,
TM.PAPELLIDO,TM.SAPELLIDO,TM.PNOMBRE,
TM.SNOMBRE,TM.RAZON_SOCIAL,    SUM(P.VALOR) VALOR,  
SUM(P.VALOR_DEV) VALOR_DEV  
FROM (    
SELECT CF.CONCEPTO CONCEPTO,   T.nit_real  NIT,  
ROUND(SUM(CASE WHEN CF.concepto=1006 
THEN  CV.saldo_inicial+CV.debito-CV.credito ELSE 0 END),0)*-1 
VALOR,  ROUND(SUM(
CASE WHEN CF.concepto=1006
THEN CV.saldo_inicial+CV.debito-CV.credito 
ELSE 0 END ),0)*-1 VALOR_DEV  
FROM cuentas_val CV   
INNER JOIN cuentas_formatos CF 
ON (CV.cuenta=CF.cuenta)  
LEFT JOIN terceros T ON (CV.nit=T.nit)  
WHERE CF.formato in (1006) AND CV.ano=2016 AND CV.mes=12   
GROUP BY  CF.formato ,CF.concepto ,T.nit_real,CV.cuenta 
 HAVING ROUND(SUM(CV.saldo_inicial+CV.debito-CV.credito),0)<>0) AS 
 P  LEFT JOIN terceros_medios TM ON (P.NIT=TM.NIT)    
 GROUP BY P.CONCEPTO,TM.TIPO,TM.NIT,TM.DIGITO,TM.PAPELLIDO,
 TM.SAPELLIDO,TM.PNOMBRE,TM.SNOMBRE,TM.RAZON_SOCIAL,TM.PAIS,
 TM.DIRECCION,TM.CIUDAD,TM.DEPARTAMENTO  
ORDER BY CONCEPTO