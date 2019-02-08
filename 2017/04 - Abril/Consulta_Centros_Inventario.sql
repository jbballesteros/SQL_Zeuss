SELECT D.tipo,D.numero,D.fecha,D.bodega,M.cuenta,C.bodega,M.centro,(D.bodega*100)-100+M.centro
FROM documentos D 
INNER JOIN movimiento M ON (D.tipo=M.tipo AND D.numero=M.numero)
INNER JOIN centros C ON (M.centro=C.centro)
WHERE D.fecha BETWEEN '01/09/2017' AND '30/09/2017' AND D.bodega<>C.bodega
AND D.sw=1 AND D.bodega<>1000

UPDATE movimiento
SET centro=4
FROM documentos D 
INNER JOIN movimiento M ON (D.tipo=M.tipo AND D.numero=M.numero)
INNER JOIN centros C ON (M.centro=C.centro)
WHERE D.fecha BETWEEN '01/08/2017' AND '31/08/2017' AND D.bodega<>C.bodega
AND D.sw=1  AND D.bodega<>1000