SELECT CC2.cuenta,CC2.descripcion,M.cuenta,CC.descripcion,C.centro,C.descripcion,
SUM(CASE WHEN MONTH(M.fec)=1 THEN M.valor ELSE 0 END) VALOR1,
SUM(CASE WHEN MONTH(M.fec)=2 THEN M.valor ELSE 0 END) VALOR2
FROM movimiento M 
INNER JOIN centros C ON (M.centro=C.centro)
INNER JOIN cuentas CC ON (M.cuenta=CC.cuenta)
LEFT JOIN cuentas CC2 ON (CC2.cuenta=SUBSTRING(M.CUENTA,1,6))
WHERE YEAR(M.fec)=2016 AND MONTH(M.fec)IN (1,2) AND M.cuenta LIKE '61%'
GROUP BY CC2.cuenta,CC2.descripcion,M.cuenta,CC.descripcion,C.centro,C.descripcion