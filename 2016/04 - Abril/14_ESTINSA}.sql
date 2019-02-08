SELECT *,CASE WHEN VALOR_INV-VALOR_CON BETWEEN -100 AND 100 THEN 0 ELSE ROUND( VALOR_INV-VALOR_CON,2) END VALOR
FROM (

SELECT B.bodega,B.descripcion BOD,R.cuenta CUENTA,C.descripcion,ROUND(SUM(cos_ini+cos_ent-cos_sal),2) VALOR_INV
FROM referencias_sto RS
INNER JOIN referencias R ON (R.codigo=RS.codigo)
INNER JOIN bodegas B ON (CASE WHEN RS.bodega=2004 THEN  4 ELSE RS.bodega END=B.bodega)
 LEFT JOIN cuentas C ON (R.cuenta=C.cuenta)
 WHERE RS.ano=2016 AND RS.mes=1
 GROUP BY B.bodega,B.descripcion,R.CUENTA,C.descripcion) AS P

 FULL JOIN (
 
 SELECT B.bodega,B.descripcion BOD,C.cuenta,C.descripcion,SUM(CV.saldo_inicial+CV.debito-CV.credito) VALOR_CON
 FROM cuentas_val CV 
 INNER JOIN cuentas C ON (CV.cuenta=C.cuenta)
 INNER JOIN centros CC ON (CV.centro=CC.centro)
 INNER JOIN BODEGAS B ON (CC.bodega=B.bodega)
 WHERE CV.ano=2016 AND CV.mes=1 AND CV.cuenta LIKE '14%'
 GROUP BY B.bodega,B.descripcion,C.cuenta,C.descripcion ) AS M ON (P.bodega=M.bodega AND P.CUENTA=M.cuenta)
WHERE (CASE WHEN VALOR_INV-VALOR_CON BETWEEN -100 AND 100 THEN 0 ELSE ROUND( VALOR_INV-VALOR_CON,2) END )<>0
 ORDER BY P.bodega