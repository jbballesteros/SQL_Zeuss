
SELECT B.bodega,B.descripcion BOD,R.cuenta CUENTA,C.descripcion,RS.codigo,R.descripcion,R.cuenta,ROUND(SUM(cos_ini+cos_ent-cos_sal),2) VALOR_INV,
R.maneja_inventario
FROM referencias_sto RS
INNER JOIN referencias R ON (R.codigo=RS.codigo)
INNER JOIN bodegas B ON (CASE WHEN RS.bodega=2004 THEN  4 ELSE RS.bodega END=B.bodega)
 LEFT JOIN cuentas C ON (R.cuenta=C.cuenta)
 WHERE RS.ano=2016 AND RS.mes=1
 GROUP BY B.bodega,B.descripcion,R.CUENTA,C.descripcion,RS.codigo,R.descripcion,R.cuenta,R.maneja_inventario
 
 
 DELETE 
 FROM referencias_sto 
 WHERE codigo IN ('111',
'112',
'113',
'14',
'111',
'14',
'112',
'111',
'112',
'114',
'14',
'171',
'111',
'112',
'171',
'111',
'112',
'112'
) AND ano=2016