SELECT *,CASE WHEN (P.UNIDADES-P.SALDO_RECALCULO)>1 OR (P.UNIDADES-P.SALDO_RECALCULO)<-1 THEN 1 ELSE 0 END DIFERENCIA
FROM (
SELECT B.bodega CB,B.descripcion SEDE,DL.CODIGO CODIGO,R.DESCRIPCION PRODUCTO,
SUM(CASE WHEN DL.sw IN (1,4,11,16) THEN DL.cantidad*-1
WHEN DL.sw IN (2,3,12) THEN DL.cantidad ELSE 0 END) AS UNIDADES,
MAX(DL.fec) ULTIMO_USO,
(SELECT ISNULL(can_ini,0)+ISNULL(can_ent,0)-ISNULL(CAN_SAL,0) FROM referencias_sto WHERE codigo=DL.codigo AND ano=YEAR(MAX(DL.fec)) AND mes=MONTH(MAX(DL.fec)) AND bodega=B.bodega) SALDO_RECALCULO
FROM documentos_lin DL 
INNER JOIN bodegas B ON (DL.bodega=B.bodega)
INNER JOIN referencias R ON (DL.CODIGO=R.CODIGO)
WHERE DL.bodega=1 AND R.maneja_inventario=1
GROUP BY B.bodega,B.descripcion,DL.CODIGO,R.DESCRIPCION) AS P
ORDER BY DIFERENCIA DESC

SELECT B.bodega CB,B.descripcion SEDE,DL.CODIGO CODIGO,R.DESCRIPCION PRODUCTO,
SUM(CASE WHEN DL.sw IN (1,4,11,16) THEN DL.cantidad*-1
WHEN DL.sw IN (2,3,12) THEN DL.cantidad ELSE 0 END) AS UNIDADES,
MAX(DL.fec) ULTIMO_USO,
(SELECT ISNULL(can_ini,0)+ISNULL(can_ent,0)-ISNULL(CAN_SAL,0) FROM referencias_sto WHERE codigo=DL.codigo AND ano=YEAR(MAX(DL.fec)) AND mes=MONTH(MAX(DL.fec)) AND bodega=B.bodega) SALDO_RECALCULO
FROM documentos_lin DL 
INNER JOIN bodegas B ON (DL.bodega=B.bodega)
INNER JOIN referencias R ON (DL.CODIGO=R.CODIGO)
WHERE DL.bodega=1 AND R.maneja_inventario=1
GROUP BY B.bodega,B.descripcion,DL.CODIGO,R.DESCRIPCION

SELECT tipo,numero,fec,CASE WHEN DL.sw IN (1,4,11,16) THEN DL.cantidad*-1
WHEN DL.sw IN (2,3,12) THEN DL.cantidad ELSE 0 END CANTIDAD
FROM documentos_lin DL
WHERE codigo='040727'
ORDER BY fec ASC
