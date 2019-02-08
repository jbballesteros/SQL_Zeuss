SELECT *
FROM Precios_SubeCost



SELECT R.codigo,R.descripcion,RS.valor,RP.VALOR,RS.id_referencia
FROM referencias R 
INNER JOIN referencias_SubeBajaCosto RS ON (R.id=RS.id_referencia)
INNER JOIN Precios_SubeCost RP ON (R.codigo=RP.Codigo)
WHERE R.clase=1

UPDATE referencias_SubeBajaCosto
SET valor=RP.VALOR
FROM referencias R 
INNER JOIN referencias_SubeBajaCosto RS ON (R.id=RS.id_referencia)
INNER JOIN Precios_SubeCost RP ON (R.codigo=RP.Codigo)
WHERE R.clase=1