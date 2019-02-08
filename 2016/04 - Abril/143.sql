SELECT M.*,C.bodega,D.bodega,CI.centro
FROM movimiento M INNER JOIN centros C ON (M.centro=C.centro)
INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero)
INNER JOIN config_inventarios CI ON (M.cuenta=CI.cuenta AND D.bodega=CI.bodega)
WHERE M.cuenta='14350103' AND fec BETWEEN '01/01/2016' AND '31/01/2016'
ORDER BY M.tipo


UPDATE movimiento
SET centro=CI.centro
FROM movimiento M INNER JOIN centros C ON (M.centro=C.centro)
INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero)
INNER JOIN config_inventarios CI ON (M.cuenta=CI.cuenta AND D.bodega=CI.bodega)
WHERE M.cuenta='14350102' AND fec BETWEEN '01/01/2016' AND '31/01/2016'