SELECT codigo,
SUM(CASE WHEN SW IN (1,2) THEN DL.CANTIDAD ELSE 0 END ) VENTAS,
SUM(CASE WHEN SW IN (3,4) THEN DL.CANTIDAD ELSE 0 END ) COMPRAS
FROM documentos_lin DL
WHERE fec BETWEEN '01/02/2016' AND '29/02/2016' AND codigo=900204 AND sw IN (1,2,3,4)
GROUP BY codigo


SELECT *,ROUND((cantidad/T.VENTAS)*T.COMPRAS,2)
FROM documentos_lin DL INNER JOIN (SELECT codigo,
SUM(CASE WHEN SW IN (1) THEN DL.CANTIDAD WHEN SW=2 THEN DL.cantidad*-1 ELSE 0 END ) VENTAS,
SUM(CASE WHEN SW IN (3,4) THEN DL.CANTIDAD ELSE 0 END ) COMPRAS
FROM documentos_lin DL
WHERE fec BETWEEN '01/02/2016' AND '29/02/2016' AND codigo=900201 AND sw IN (1,2,3,4)
GROUP BY codigo) AS T ON (DL.codigo=T.codigo)
WHERE fec BETWEEN '01/02/2016' AND '29/02/2016' AND DL.codigo=900201 AND sw IN (2)


update documentos_lin
set cantidad=ROUND((cantidad/T.VENTAS)*T.COMPRAS,2)
FROM documentos_lin DL INNER JOIN (SELECT codigo,
SUM(CASE WHEN SW IN (1) THEN DL.CANTIDAD WHEN SW=2 THEN DL.cantidad*-1 ELSE 0 END ) VENTAS,
SUM(CASE WHEN SW IN (3,4) THEN DL.CANTIDAD ELSE 0 END ) COMPRAS
FROM documentos_lin DL
WHERE fec BETWEEN '01/02/2016' AND '29/02/2016' AND codigo=900201 AND sw IN (1,2,3,4)
GROUP BY codigo) AS T ON (DL.codigo=T.codigo)
WHERE fec BETWEEN '01/02/2016' AND '29/02/2016' AND DL.codigo=900201 AND sw IN (1)