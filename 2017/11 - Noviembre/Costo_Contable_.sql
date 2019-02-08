SELECT YEAR(M.fec) AÑO,MONTH(M.fec) MES,
 SUM(M.valor) VALOR
FROM movimiento M 
INNER JOIN cuentas C ON (M.cuenta=C.cuenta)
WHERE M.cuenta LIKE '61%' AND YEAR(fec)=2017
GROUP BY YEAR(M.fec),MONTH(M.fec)