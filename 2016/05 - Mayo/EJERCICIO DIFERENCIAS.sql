SELECT *
FROM (

SELECT C2.cuenta CODCUENTA_NIV,C2.descripcion CUENTA_NIV,C.cuenta CODCUENTA,C.descripcion CUENTA,SUM(M.valor) VALOR_ESTA
FROM movimiento M 
INNER JOIN cuentas C ON (M.cuenta=C.cuenta)
INNER JOIN cuentas C2 ON (C2.cuenta=SUBSTRING(m.cuenta,0,7))
WHERE M.cuenta LIKE '61%' AND fec BETWEEN '01/03/2016' AND '31/03/2016' AND centro=2192
GROUP BY C2.cuenta,C2.descripcion,C.cuenta,C.descripcion) AS P 

FULL JOIN (

SELECT C2.cuenta CODCUENTA_NIV,C2.descripcion CUENTA_NIV,C.cuenta CODCUENTA,C.descripcion CUENTA,SUM(M.valor) VALOR_DEBERIA
FROM ALERTA_NOTOCAR.DBO.movimiento M 
INNER JOIN cuentas C ON (M.cuenta=C.cuenta)
INNER JOIN cuentas C2 ON (C2.cuenta=SUBSTRING(m.cuenta,0,7))
WHERE M.cuenta LIKE '61%' AND fec BETWEEN '01/03/2016' AND '31/03/2016' AND centro=2192
GROUP BY C2.cuenta,C2.descripcion,C.cuenta,C.descripcion) AS S ON (S.CODCUENTA=P.CODCUENTA)