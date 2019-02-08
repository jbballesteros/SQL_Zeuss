SELECT P.descripcion SEDE,P.nit NIT,P.nombres CLIENTE,P.TIPO,P.ZONA,P.SICOM,ULTIMA_COMPRA
FROM (
SELECT ano,B.bodega,B.descripcion,T2.descripcion TIPO,T3.descripcion ZONA,ZL.nit,T.nombres,T.codigo_alterno SICOM,SUM(ZL.can_ventas-ZL.can_devolu) CANTIDAD,MAX(fec) ULTIMA_COMPRA
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
LEFT JOIN terceros_2 T2 ON (T.concepto_2=T2.concepto_2)
LEFT JOIN terceros_3 T3 ON (T.concepto_3=T3.concepto_3)
INNER JOIN bodegas  B ON (ZL.bodega=B.bodega)
WHERE ano=2015 and ZL.subgrupo2 in (2,3,4)
GROUP BY ano,B.bodega,B.descripcion,ZL.nit,T.nombres,T2.descripcion,T.codigo_alterno,T3.descripcion
) AS P INNER JOIN (
SELECT  P.ano,P.NIT,P.nombres,MAX(P.CANTIDAD) CANTIDAD
FROM ( 
SELECT ano,B.bodega,B.descripcion,ZL.nit,T.nombres,SUM(ZL.can_ventas-ZL.can_devolu) CANTIDAD
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
INNER JOIN bodegas  B ON (ZL.bodega=B.bodega)
WHERE ano=2015 and ZL.subgrupo2 in (2,3,4)
GROUP BY ano,B.bodega,B.descripcion,ZL.nit,T.nombres
) AS P 
GROUP BY  P.ano,P.NIT,P.nombres) AS S ON (S.nit=P.nit AND S.CANTIDAD=P.CANTIDAD )
