SELECT T.nit NIT,T.nombres CLIENTE,T.codigo_alterno CODIGO_DESPACHO,SUM(ZL.can_ventas-ZL.can_devolu) CANTIDAD
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
WHERE ZL.ano=2017 AND ZL.mes=9 AND subgrupo2 IN (2,3,4) AND T.concepto_10='100'
GROUP BY T.nit,T.nombres,T.codigo_alterno