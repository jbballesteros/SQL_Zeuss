SELECT T.nit,T.nombres,isnull(T.concepto_7,0) COSTO_LOGISTICO,ISNULL(T.concepto_8,0) PESOS,ISNULL(T.concepto_9,0) MARGEN,SUM(ZL.can_ventas-ZL.can_devolu) CANTIDAD_2018
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
WHERE ZL.subgrupo2 IN (2,3,4,39) AND T.concepto_2<>14 AND ZL.ano=2018
GROUP BY T.nit,T.nombres,T.concepto_7,T.concepto_8,T.concepto_9
ORDER BY CANTIDAD_2018 DESC