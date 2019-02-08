SELECT  YC.descripcion CIUDAD,T.nit CODIGO,T.nombres CLIENTE,ISNULL(T.razon_comercial,'') EDS,T2.descripcion TIPO,
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
INNER JOIN y_ciudades YC ON (T.y_ciudad=YC.ciudad AND T.y_dpto=YC.departamento)
INNER JOIN terceros_2 T2 ON (T.concepto_2=T2.concepto_2)
WHERE ZL.fec BETWEEN '01/11/2015' AND '16/03/2016' AND ZL.subgrupo2 IN (2,3,4) AND ZL.bodega IN (4,5) AND T.y_dpto='05'
GROUP BY YC.descripcion,T.nit,T.nombres,T2.descripcion ,T.razon_comercial