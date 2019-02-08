
SELECT B.descripcion SEDE,W.AÑO,W.MES,W.nit NIT,T.nombres NOMBRES,SUM(W.VALOR) VALOR
FROM (

SELECT ROW_NUMBER() OVER (ORDER BY YEAR(M.fec)) ID,YEAR(M.fec) AÑO ,MONTH(M.fec) MES,M.nit,SUM(M.valor) VALOR
FROM movimiento M INNER JOIN terceros T ON (M.nit=T.nit)
WHERE M.cuenta IN ('53053501') AND YEAR(FEC)IN (2014,2015)  AND T.nit<>T.nit_real AND M.tipo<>'Z1'
GROUP BY  M.nit,MONTH(M.fec),YEAR(M.fec)

UNION

SELECT T.ID,T.AÑO,T.MES,T.CODIGO,
(CASE WHEN ZT.GLS IS NULL AND ZL.GLS IS NULL THEN  1.00/Conteo WHEN ISNULL(ZT.GLS,0)=0 THEN 0 ELSE isnull(ZL.GLS,0)/ISNULL(ZT.GLS,0) END)*T.VALOR PR
FROM (
SELECT P.*,TR.nit CODIGO,TC.Conteo
FROM (
SELECT ROW_NUMBER() OVER (ORDER BY YEAR(M.fec))+10000 ID,YEAR(M.fec) AÑO,MONTH(M.fec) MES,M.nit,SUM(M.valor) VALOR
FROM movimiento M 
INNER JOIN terceros T ON (M.nit=T.nit)
WHERE M.cuenta IN ('53053501') AND YEAR(FEC)IN (2014,2015)   AND T.nit=T.nit_real AND M.tipo<>'Z1'
GROUP BY  M.nit,MONTH(M.fec),YEAR(M.fec)) AS P
LEFT JOIN terceros TR ON (P.nit=TR.nit_real AND P.nit<>TR.nit)
LEFT JOIN (SELECT nit_real,COUNT(nit) Conteo FROM terceros where nit<>nit_real GROUP BY nit_real) TC ON (P.nit=TC.nit_real )) AS T

LEFT JOIN (
SELECT ano,mes,nit,SUM(can_ventas-can_devolu) GLS 
FROM Zeuss_Lin_Ventas 
WHERE subgrupo2 IN (2,3,4)
GROUP BY ano,mes,nit ) AS ZL 
ON (T.CODIGO=ZL.nit AND T.AÑO=ZL.ano AND T.MES=ZL.mes)
LEFT JOIN (
SELECT ano,mes,nit_real,SUM(can_ventas-can_devolu) GLS 
FROM Zeuss_Lin_Ventas 
WHERE subgrupo2 IN (2,3,4)
GROUP BY ano,mes,nit_real) AS  ZT ON (T.nit=ZT.nit_real AND T.AÑO=ZT.ano AND T.MES=ZT.mes)

 
 
 ) AS W INNER JOIN terceros T ON (W.nit=T.nit)
 LEFT JOIN Bodegas_Clientes BC ON (W.nit=BC.nit)
 LEFT JOIN bodegas B ON (BC.bodega=B.bodega)
 WHERE W.VALOR<>0 
 GROUP BY W.AÑO,W.MES,W.nit,B.descripcion,T.nombres

ORDER BY W.nit