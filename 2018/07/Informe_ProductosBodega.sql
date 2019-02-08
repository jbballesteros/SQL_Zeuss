SELECT  P.codigo,COUNT(P.codigo)
FROM (
SELECT DL.codigo,DL.bodega
FROM documentos_lin DL 
WHERE DL.maneja_inventario='S' AND DL.bodega<>2004
GROUP BY DL.codigo,DL.bodega ) AS P
GROUP BY P.codigo
HAVING COUNT(P.codigo)>1