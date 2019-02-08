SELECT T.nit NIT,T.nombres CLIENTE,T2.descripcion TIPO,
T.direccion DIRECCION,T.telefono_1 TELEFONO
FROM zeuss_lin_ventas ZL 
INNER JOIN TERCEROS T ON (ZL.NIT=T.NIT)
LEFT JOIN TERCEROS_2 T2 ON (T.CONCEPTO_2=T2.CONCEPTO_2)
WHERE ZL.ANO>=2016 AND ZL.subgrupo2 IN (2,3,4) AND T.y_dpto='05' AND T.nit<>T.nit_real
GROUP BY T.nit,T.nombres,T2.descripcion,T.direccion,T.telefono_1