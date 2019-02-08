SELECT ZL.ano,ZL.mes,T.nit,T.nombres,SUM(ZL.can_ventas-ZL.can_devolu) cantidad
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
WHERE ZL.ano=2018 AND ZL.subgrupo2 IN (39)
GROUP BY ZL.ano,ZL.mes,T.nit,T.nombres