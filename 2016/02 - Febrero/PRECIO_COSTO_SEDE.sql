SELECT P.AÑO,P.MES,P.BODEGA,P.SEDE,P.CODIGO,P.PRODUCTO,P.VALOR VENTA,S.VALOR COMPRAD,P.VALOR-S.VALOR UTILIDAD
FROM (
SELECT YEAR(DL.fec) AÑO,MONTH(DL.fec) MES,B.bodega BODEGA,B.descripcion SEDE,DL.codigo CODIGO,R.descripcion PRODUCTO,MAX(DL.valor_unitario) VALOR
FROM documentos_lin DL 
INNER JOIN referencias R ON (DL.codigo=R.codigo)
INNER JOIN bodegas B ON (DL.bodega=B.bodega)
WHERE DL.sw=1 AND R.clase='01'
GROUP BY YEAR(DL.fec),MONTH(DL.fec),B.bodega,B.descripcion,DL.codigo,R.descripcion
) AS P INNER JOIN (
SELECT YEAR(DL.fec) AÑO,MONTH(DL.fec) MES,B.bodega BODEGA,B.descripcion SEDE,DL.codigo CODIGO,R.descripcion PRODUCTO,MIN(DL.valor_unitario) VALOR
FROM documentos_lin DL 
INNER JOIN referencias R ON (DL.codigo=R.codigo)
INNER JOIN bodegas B ON (DL.bodega=B.bodega)
WHERE DL.sw=3 AND R.clase='01'
GROUP BY YEAR(DL.fec),MONTH(DL.fec),B.bodega,B.descripcion,DL.codigo,R.descripcion
) AS S ON (P.AÑO=S.AÑO AND P.MES=S.MES AND P.CODIGO=S.CODIGO AND P.BODEGA=S.BODEGA)
ORDER BY P.AÑO,P.MES,P.BODEGA,P.SEDE,P.CODIGO