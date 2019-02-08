SELECT *,CASE WHEN FI.GAL_NIT=0 THEN FI.BONIFICACION ELSE (FI.BONIFICACION/FI.GAL_NIT)*FI.GAL_CODIGO END BONIF

FROM (


SELECT M.nit,T.nombres,TR.nit NIT_REAL,TR.nombres NOMBRE_NIT,T3.nit CODIGO,T3.nombres NOMBRES_CODIGO,
SUM(CASE WHEN MONTH(M.FEC)=5 THEN  M.valor ELSE 0 END) BONIFICACION,
P.MAYO GAL_CODIGO,S.MAYO GAL_NIT
FROM movimiento M INNER JOIN terceros T ON (M.nit=T.nit)
INNER JOIN centros C ON (M.centro=C.centro)
INNER JOIN terceros TR ON (T.nit_real=TR.nit)
INNER JOIN terceros T3 ON (TR.nit=T3.nit_real)
LEFT JOIN (
SELECT ZL.nit,
SUM( CASE WHEN ZL.mes=5 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) MAYO
FROM Zeuss_Lin_Ventas ZL
WHERE ZL.ano=2016 AND ZL.subgrupo2 IN (2,3,4)
GROUP BY ZL.nit) AS P ON (T3.nit=P.nit)

LEFT JOIN (
SELECT ZL.nit_real,
SUM( CASE WHEN ZL.mes=5 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) MAYO
FROM Zeuss_Lin_Ventas ZL 

WHERE ZL.ano=2016 AND ZL.subgrupo2 IN (2,3,4)
GROUP BY ZL.nit_real) AS S ON (TR.nit=S.nit_real)

WHERE cuenta ='53053501' AND fec BETWEEN '01/05/2016' AND '31/05/2016' AND P.MAYO IS NOT NULL AND M.nit=TR.nit 
GROUP BY M.nit,T.nombres,TR.nit,TR.nombres,T3.nit,T3.nombres,P.MAYO,S.MAYO
) AS FI
order by FI.nit



