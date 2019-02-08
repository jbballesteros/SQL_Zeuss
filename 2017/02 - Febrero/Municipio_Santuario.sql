SELECT *
FROM (
SELECT YEAR(D.FECHA) AÑO,MONTH(D.FECHA) MES,  TR.nit,TR.nombres,
SUM(CASE WHEN D.sw=21 THEN  D.valor_total*-1 ELSE D.valor_total END) VALOR 
FROM documentos D INNER JOIN terceros T ON (D.nit=T.nit)
INNER JOIN terceros TR ON (T.nit_real=TR.nit)
WHERE sw IN (21,23)  AND D.fecha BETWEEN '01/01/2014' AND '31/12/2015'
 AND T.nit_real IN (900396172,749519) AND D.concepto IN (51,24,55)
 GROUP BY YEAR(D.FECHA),MONTH(D.FECHA),TR.nit,TR.nombres
) AS P

LEFT JOIN (

SELECT ZL.ano,ZL.mes,T.nit_real,
SUM(CASE WHEN ZL.subgrupo2=2 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) AS CORRIENTE,
SUM(CASE WHEN ZL.subgrupo2=3 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) AS ACPM,
SUM(CASE WHEN ZL.subgrupo2=4 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) AS EXTRA

FROM Zeuss_Lin_Ventas ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
INNER JOIN referencias_sub2 RS ON (ZL.subgrupo2=RS.subgrupo2)
WHERE ZL.ano IN (2014,2015) 
AND T.nit IN (909529,909866)
AND ZL.subgrupo2 IN (2,3,4)
GROUP BY ZL.ano,ZL.mes,T.nit_real) AS S ON (P.nit=S.nit_real AND P.AÑO=S.ano AND P.MES=S.mes)
 
