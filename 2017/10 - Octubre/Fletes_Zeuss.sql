SELECT ZL.ano AÑO, ZL.mes MES,ZL.fec FECHA,
ZL.tipo  + ' - ' + CAST(ZL.numero AS VARCHAR(10)) NUMERO,
VC.nit CEDULA,VC.nombres CONDUCTOR,V.placa PLACA,
T.nit CODIGO,T.nombres CLIENTE,T.ciudad MUNICIPIO,RS.descripcion PRODUCTO,
SUM(ZL.can_ventas-ZL.can_devolu) CANTIDAD,
P.VALOR/VT.cantidad FLETE,(P.VALOR/VT.cantidad)*SUM(ZL.can_ventas-ZL.can_devolu) FLETE_TOTAL,
T19.DESCRIPCION VEHICULO

FROM Zeuss_Lin_Ventas ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
INNER JOIN ( 
SELECT TIPO,NUMERO,SUM(vlr_ventas-vlr_devolu) VALOR 
FROM Zeuss_Lin_Ventas 
WHERE subgrupo2 IN (11) 
GROUP BY TIPO,NUMERO) AS P ON (ZL.TIPO=P.TIPO AND ZL.NUMERO=P.NUMERO)
INNER JOIN referencias_sub2 RS ON (ZL.subgrupo2=RS.subgrupo2)
LEFT JOIN v_Zeuss_Lin_Ventas_total VT ON (ZL.TIPO=VT.TIPO AND ZL.NUMERO=VT.numero)
LEFT JOIN vehiculos_factura_z V ON (V.tipo=ZL.tipo AND V.numero= ZL.numero)
LEFT JOIN terceros VC ON (VC.nit = V.conductor)
LEFT JOIN terceros_19 T19 ON (T.CONCEPTO_19=T19.CONCEPTO_19)
WHERE 
ZL.subgrupo2 IN (2,3,4) and 
YEAR(ZL.fec)= 2017 AND
MONTH (ZL.fec) =7 AND
ZL.bodega=1 AND ZL.sw=1
GROUP BY ZL.ano ,ZL.mes,ZL.tipo,ZL.numero,ZL.fec,
T.nit,T.nombres,T.ciudad,T19.descripcion,P.VALOR,V.placa,VC.nit ,VC.nombres,RS.descripcion ,VT.cantidad
ORDER BY V.placa, ZL.fec