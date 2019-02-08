SELECT B.bodega,B.descripcion,T2.DESCRIPCION,
SUM(CASE WHEN ZL.subgrupo2 =3 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) ACPM ,
SUM(CASE WHEN ZL.subgrupo2 =2 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) CORRIENTE,

SUM(CASE WHEN ZL.subgrupo2 =4 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) EXTRA,
SUM(ZL.can_ventas-ZL.can_devolu) CANTIDAD
FROM Zeuss_Lin_Ventas ZL INNER JOIN bodegas B ON (ZL.bodega=B.bodega)
INNER JOIN terceros  T ON (ZL.nit=T.nit)
LEFT JOIN terceros_2 T2 ON (T.concepto_2=T2.concepto_2)
WHERE ZL.subgrupo2 IN (2,3,4) AND ZL.ano=2016 and ZL.MES<=2
GROUP BY B.bodega,B.descripcion,T2.DESCRIPCION