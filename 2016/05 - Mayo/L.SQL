SELECT     ZL.ano AS AÑO, ZL.mes CMES,YM.ETIQUETA MES, ZL.nit AS NIT, T.nombres AS CLIENTE,T.razon_comercial RAZON_COMERCIAL,TV.nombres VENDEDOR, R2.descripcion AS PRODUCTO, SUM(ZL.can_ventas - ZL.can_devolu) AS CANTIDAD
FROM         dbo.Zeuss_Lin_Ventas AS ZL LEFT JOIN
                      dbo.terceros AS T ON ZL.nit = T.nit INNER JOIN
                      terceros TV ON (ZL.vendedorter=TV.nit) INNER JOIN
                      dbo.referencias_sub2 AS R2 ON ZL.subgrupo2 = R2.subgrupo2      INNER JOIN y_meses_texto YM ON (ZL.mes=YM.NroMes) 
             
WHERE     (ZL.subgrupo2 IN (2, 3, 4)) AND ZL.fec BETWEEN  CAST(  DATEADD(year,-1,  DATEADD(DAY,(DAY(GETDATE())*-1)+1,GETDATE())) AS DATE    )
 AND  CAST(DATEADD(DAY,DAY(GETDATE())*-1,GETDATE()) AS DATE)
GROUP BY ZL.ano, ZL.mes, ZL.nit, T.nombres, R2.descripcion,YM.ETIQUETA,T.razon_comercial,TV.NOMBRES