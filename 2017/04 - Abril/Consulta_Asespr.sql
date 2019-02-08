SELECT T.nit,T.nombres,
SUM(CASE WHEN ZL.mes=4 AND ZL.ano=2015 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) ABRIL,
SUM(CASE WHEN ZL.mes=4 AND ZL.ano=2016 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) ABRIL,

SUM(CASE WHEN ZL.mes=5 AND ZL.ano=2015 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) MAYO,
SUM(CASE WHEN ZL.mes=5 AND ZL.ano=2016 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) MAYO,

SUM(CASE WHEN ZL.mes=6 AND ZL.ano=2015 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) JUNIO,
SUM(CASE WHEN ZL.mes=6 AND ZL.ano=2016 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) JUNIO


FROM Zeuss_Lin_Ventas ZL 

LEFT JOIN terceros_historico TH ON (ZL.nit=TH.nit)
INNER JOIN terceros T ON (TH.nit_Act=T.nit)
WHERE ZL.ano IN (2015,2016) AND ZL.subgrupo2 IN (2,3,4) AND ZL.mes IN (4,5,6) AND T.vendedor=122
GROUP BY T.nit,T.nombres