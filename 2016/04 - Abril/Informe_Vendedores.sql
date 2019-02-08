SELECT TV.nombres VENDEDOR,T.nit,T.nombres,T.razon_comercial,T.direccion,T.y_ciudad,T.y_dpto,UV.FECHA_ULT,
SUM(CASE WHEN ZL.ano=2014 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) A2014,
SUM(CASE WHEN ZL.ano=2015 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) A2015,
SUM(CASE WHEN ZL.ano=2016 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) - SUM(CASE WHEN ZL.ano=2015 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) DIF_GAL, 
SUM(CASE WHEN ZL.ano=2015 AND ZL.MES IN (1,2,3) THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) A20151,
SUM(CASE WHEN ZL.ano=2016 AND ZL.MES IN (1,2,3) THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) A20161,
SUM(CASE WHEN ZL.ano=2016 AND ZL.MES IN (1,2,3) THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END)-SUM(CASE WHEN ZL.ano=2015 AND ZL.MES IN (1,2,3) THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) DIF_GAL_PER
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN  terceros T ON (ZL.nit=T.nit)
INNER JOIN terceros TV ON (TV.nit=T.vendedor)
INNER JOIN referencias_sub2 RS ON (CAST(ZL.subgrupo2 AS INTEGER)=CAST(RS.subgrupo2 AS INTEGER))
LEFT JOIN ultima_venta UV ON (ZL.nit=UV.nit)
WHERE ZL.ano>=2014 AND ZL.subgrupo2 IN (2,3,4) AND T.vendedor in (122,118)
GROUP BY TV.nombres,T.nit,T.nombres,T.razon_comercial,T.direccion,T.y_ciudad,T.y_dpto,UV.FECHA_ULT