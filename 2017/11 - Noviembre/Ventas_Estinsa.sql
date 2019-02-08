SELECT T.nit,T.nombres,RS2.descripcion,
SUM(CASE WHEN D.descuento_pie=0 THEN ZL.can_ventas - ZL.can_devolu ELSE 0 END) GLS_SIN_DESCUENTO , 
SUM(CASE WHEN D.descuento_pie<>0 THEN ZL.can_ventas - ZL.can_devolu ELSE 0 END) GLS_CON_DESCUENTO

FROM Zeuss_Lin_Ventas ZL 
INNER JOIN documentos D ON (ZL.tipo=D.tipo AND ZL.numero=D.numero)
INNER JOIN terceros T ON (D.nit=T.nit) 
INNER JOIN referencias_sub2 RS2 ON (ZL.subgrupo2=RS2.subgrupo2)
WHERE T.nit_real=900625898  AND ZL.subgrupo2 IN (2,3,4) AND ZL.ano=2017 AND ZL.mes=10
GROUP BY T.nit,T.nombres,RS2.descripcion