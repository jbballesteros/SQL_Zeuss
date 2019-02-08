SELECT M.CUENTA,M.nit,T.nombres,C.centro,C.descripcion,SUM(M.valor),TR.nit,TR.nombres,T2.nit,T2.nombres,SUM(M.valor),
CASE WHEN (M.nit=T2.nit AND  T2.nit<>T2.nit_real) OR (TR.nit=M.nit AND M.nit<>T2.nit) THEN 1 ELSE 0 END
FROM movimiento M 
INNER JOIN terceros T ON (M.nit=T.nit)
INNER JOIN centros C ON (M.centro=C.centro)
INNER JOIN terceros TR ON (T.nit_real=TR.nit)
INNER JOIN terceros T2 ON (TR.nit=T2.nit_real)
WHERE cuenta LIKE '530535%' AND fec BETWEEN '01/01/2016' AND '31/01/2016'
GROUP BY M.nit,T.nombres,C.centro,C.descripcion,M.cuenta,TR.nit,TR.nombres,T2.nit,T2.nombres,T2.nit_real
