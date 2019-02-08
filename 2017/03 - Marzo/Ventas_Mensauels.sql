SELECT ZL.nit NIT,T.nombres CLIENTE,SUM(ZL.can_real) CANTIDAD
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
INNER JOIN referencias_sub2 RS ON (ZL.subgrupo2=RS.subgrupo2)
WHERE  ZL.fec BETWEEN '01/04/2016' AND '31/03/2017'
AND ZL.subgrupo2 IN (2,3,4)
GROUP BY ZL.nit,T.nombres