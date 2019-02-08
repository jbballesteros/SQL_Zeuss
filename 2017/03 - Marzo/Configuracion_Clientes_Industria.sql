SELECT T.nit NIT,T.nombres TERCERO,T.condicion CONDICIONES,TR.cupo_credito CUPO,
ISNULL(T.concepto_7,0) LOGISTICO,ISNULL(T.concepto_8,0) PESOS,ISNULL(T.concepto_9,0) MARGEN
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
INNER JOIN terceros TR ON (T.nit_real=TR.nit)
WHERE ZL.ano>=2016 AND ZL.subgrupo2 IN (2,3,4) AND NOT (T.concepto_2='14')
GROUP BY T.nit,T.nombres,T.concepto_7,T.condicion,T.concepto_8,T.concepto_9,TR.cupo_credito