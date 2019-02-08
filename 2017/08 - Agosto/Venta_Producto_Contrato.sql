SELECT ZL.nit CODIGO,T.nombres CLIENTE,RS.descripcion PRODUCTO,SUM(ZL.can_ventas-ZL.can_devolu) CANTIDAD
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
INNER JOIN referencias_sub2 RS ON (ZL.subgrupo2=RS.subgrupo2)
WHERE ZL.fec>='01/01/2014' AND ZL.subgrupo2 IN (2,3,4) AND ZL.nit=910055
GROUP BY ZL.nit,T.nombres,RS.descripcion