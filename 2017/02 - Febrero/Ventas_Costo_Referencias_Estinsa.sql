SELECT AÑO,MES,CODIGO,PRODUCTO,CANTIDAD,VENTAS,COSTO,
CASE WHEN COSTO=0 THEN 0 ELSE (VENTAS-COSTO)/COSTO END RENTABILIDAD
 ,COMBO,ULTIMA_VENTA
FROM (

SELECT YEAR(D.fecha) AÑO,MONTH(D.fecha) MES,R.codigo CODIGO,R.descripcion PRODUCTO,
ROUND(SUM(CASE WHEN D.sw=1 THEN DL.cantidad ELSE DL.cantidad*-1 END),2) CANTIDAD,
ROUND(SUM(CASE WHEN D.sw=1 THEN DL.cantidad*DL.valor_unitario ELSE DL.cantidad*DL.valor_unitario*-1 END),2)  VENTAS,
ROUND(SUM(CASE WHEN D.sw=1 THEN DL.cantidad*DL.costo_unitario ELSE DL.cantidad*DL.costo_unitario*-1 END),2)  COSTO,
(CASE WHEN RS.codigo IS NULL THEN 'NO' ELSE 'SI' END) COMBO,UR.FECHA ULTIMA_VENTA
FROM documentos D 
INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
INNER JOIN referencias R ON (DL.codigo=R.codigo)

LEFT JOIN (SELECT codigo
FROM referencias_estruc_simple
GROUP BY codigo) AS RS ON (R.codigo=RS.codigo)

INNER JOIN (SELECT codigo,MAX(fec) FECHA
FROM documentos_lin
WHERE sw=1
GROUP BY codigo) AS UR ON (R.codigo=UR.codigo)

WHERE D.sw IN (1,2) AND D.fecha>='01/11/2016' AND R.clase='02' AND DL.valor_unitario<>0
GROUP BY YEAR(D.fecha),MONTH(D.fecha),R.codigo,R.descripcion,RS.codigo,UR.FECHA

) AS T
