SELECT B.bodega,B.descripcion,T.NIT,T.codigo_alterno,T.nombres,T2.descripcion,
SUM(CASE WHEN ZL.mes=1 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) ENERO,
SUM(CASE WHEN ZL.mes=2 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) FEBRERO,
SUM(CASE WHEN ZL.mes=3 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) MARZO,
SUM(CASE WHEN ZL.mes=4 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) ABRIL,
SUM(CASE WHEN ZL.mes=5 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) MAYO,
SUM(CASE WHEN ZL.mes=6 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) JUNIO,
SUM(CASE WHEN ZL.mes=7 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) JULIO,
SUM(CASE WHEN ZL.mes=8 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) AGOSTO,
SUM(CASE WHEN ZL.mes=9 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) SEPTIEMBRE,
SUM(CASE WHEN ZL.mes=10 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) OCTUBRE,
SUM(CASE WHEN ZL.mes=11 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) NOVIEMBRE,
SUM(CASE WHEN ZL.mes=12 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) DICIEMBRE
FROM Zeuss_Lin_Ventas ZL  
INNER JOIN terceros T ON (ZL.nit=T.nit)
INNER JOIN terceros_2 T2 ON (T.concepto_2=T2.concepto_2)
INNER JOIN bodegas B ON (ZL.bodega=B.bodega)
WHERE ZL.ano=2014 AND ZL.subgrupo2 IN (2,3,4) AND T.concepto_2='14'
GROUP BY B.bodega,B.descripcion,T.NIT,T.codigo_alterno,T.nombres,T2.descripcion
ORDER BY T2.descripcion