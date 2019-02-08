SELECT T.nit NIT,T.nombres CLIENTE,

SUM(CASE WHEN ZL.ano=2014 THEN  ZL.can_ventas-ZL.can_devolu ELSE 0 END) CANTIDAD_2014,
SUM(CASE WHEN ZL.ano=2015 THEN  ZL.can_ventas-ZL.can_devolu ELSE 0 END) CANTIDAD_2015,
SUM(CASE WHEN ZL.ano=2014 THEN  ZL.vlr_ventas-ZL.vlr_devolu ELSE 0 END) VALOR_2014,
SUM(CASE WHEN ZL.ano=2015 THEN  ZL.vlr_ventas-ZL.vlr_devolu ELSE 0 END) VALOR_2015,T.ciudad  CIUDAD,T.direccion DIRECCION
FROM Zeuss_Lin_Ventas ZL 
LEFT JOIN terceros_codigos_cambio TC ON (ZL.nit=TC.NIT)
INNER JOIN terceros T ON (ISNULL(TC.NUEVO_NIT,ZL.NIT)=T.nit)
WHERE ZL.ano in (2014,2015) AND ZL.subgrupo2 IN (2,3,4)  AND T.concepto_2='14'
GROUP BY T.nit,T.nombres,T.ciudad,T.direccion
ORDER BY T.ciudad,T.nit


SELECT T.nit NIT,T.nombres CLIENTE,SUM(ZL.can_ventas-ZL.can_devolu) CANTIDAD,SUM(ZL.vlr_ventas-ZL.vlr_devolu) VALOR,T.ciudad  CIUDAD,T.direccion DIRECCION
FROM Zeuss_Lin_Ventas ZL 
LEFT JOIN terceros_codigos_cambio TC ON (ZL.nit=TC.NIT)
INNER JOIN terceros T ON (ISNULL(TC.NUEVO_NIT,ZL.NIT)=T.nit)
WHERE ZL.ano=2015 AND ZL.subgrupo2 IN (2,3,4)  AND T.concepto_2='14'
GROUP BY T.nit,T.nombres,T.ciudad,T.direccion
ORDER BY T.ciudad,T.nit