SELECT NIT_REAL,NOMBRE_NIT,NIT,NOMBRE_COMERCIAL,max(TIPO) TIPO,MAX(ASESOR) ASESOR,MAX(TELEFONO) TELEFONO,MAX(ULTIMA_COMPRA) ULTIMA_COMPRA
FROM (


SELECT T.nit_real NIT_REAL,TR.nombres NOMBRE_NIT,



CASE WHEN NOT(T.concepto_2='14') THEN TR.nit ELSE  T.nit  END NIT,


CASE WHEN NOT(T.concepto_2='14') THEN TR.nombres + ' - INDUSTRIA'  ELSE  T.nombres  END  NOMBRE_COMERCIAL,T2.descripcion TIPO,TV.nombres ASESOR,T.telefono_1 TELEFONO,MAX(ZL.fec) ULTIMA_COMPRA
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
INNER JOIN terceros TR ON (T.nit_real=TR.nit)
LEFT JOIN terceros_2 T2 ON (T.concepto_2=T2.concepto_2)
LEFT JOIN terceros TV ON (T.vendedor=TV.nit)
WHERE ZL.ano>=2016 AND ZL.subgrupo2 IN (2,3,4)
GROUP BY T.nit,T.nit_real,T.nombres,TR.nombres,T2.descripcion,TV.nombres,T.telefono_1,T.concepto_2,TR.nit


) AS P


GROUP BY NIT_REAL,NOMBRE_NIT,NIT,NOMBRE_COMERCIAL

ORDER BY NIT_REAL ASC