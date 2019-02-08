SELECT T2.descripcion TIPO ,ZL.nit NIT,T.nombres CLIENTE,T.codigo_alterno SICOM,RS.descripcion PRODUCTO,SUM(ZL.can_ventas-ZL.can_devolu) CANTIDAD
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
INNER JOIN referencias_sub2 RS ON (RS.subgrupo2=ZL.subgrupo2)
LEFT JOIN terceros_2 T2 ON (T.concepto_2=T2.concepto_2)
WHERE ZL.subgrupo2 IN (2,4) AND ZL.ano=2015 AND ZL.MES=1 AND T.y_dpto='05' AND T.y_ciudad='001'
GROUP BY T2.descripcion,ZL.nit,T.nombres,T.codigo_alterno,RS.descripcion
