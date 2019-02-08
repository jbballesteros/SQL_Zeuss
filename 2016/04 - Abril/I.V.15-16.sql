SELECT TV.nombres VENDEDOR,T.nit NIT,T.nombres CLIENTE,T.razon_comercial RAZON,
SUM(CASE WHEN ZL.ano=2014 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) A2014,
SUM(CASE WHEN ZL.ano=2015 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) A2015
FROM terceros T 
INNER JOIN zeuss_lin_ventas_historico ZL   ON (ZL.nit_Actual=T.nit )
INNER JOIN terceros TV ON (TV.nit=T.vendedor)

WHERE ZL.ano IN (2014,2015) AND ZL.subgrupo2 IN (2,3,4) 
GROUP BY TV.nombres,T.nit,T.nombres,T.razon_comercial