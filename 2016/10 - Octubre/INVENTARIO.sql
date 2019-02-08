SELECT (D.bodega*100)-100+3,D.bodega,M.*
FROM movimiento M  INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero)
WHERE fec>='01/07/2016' AND D.tipo LIKE 'FCS%' AND M.cuenta ='14350102'


SELECT (D.bodega*100)-100+5,D.bodega,M.*
FROM movimiento M  INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero)
WHERE fec>='01/07/2016' AND D.tipo LIKE 'FCS%' AND M.cuenta ='14350104'


SELECT (D.bodega*100)-100+6,D.bodega,M.*
FROM movimiento M  INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero)
WHERE fec>='01/07/2016' AND D.tipo LIKE 'FCS%' AND M.cuenta ='14350103'


SELECT (D.bodega*100)-100+1,D.bodega,M.*
FROM movimiento M  INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero)
WHERE fec>='01/07/2016' AND D.tipo LIKE 'FCS%' AND M.cuenta ='14350101'

--------- CAMBIAR TECNICENTRO
UPDATE movimiento
SET centro=(D.bodega*100)-100+3
FROM movimiento M  INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero)
WHERE fec>='01/08/2016' AND D.tipo LIKE 'FCS%' AND M.cuenta ='14350102'

--------- CAMBIAR LAVADO
UPDATE movimiento
SET centro=(D.bodega*100)-100+5
FROM movimiento M  INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero)
WHERE fec>='01/08/2016' AND D.tipo LIKE 'FCS%' AND M.cuenta ='14350104'

--------- CAMBIAR LUBRICANTES
UPDATE movimiento
SET centro=(D.bodega*100)-100+6
FROM movimiento M  INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero)
WHERE fec>='01/08/2016' AND D.tipo LIKE 'FCS%' AND M.cuenta ='14350103'

--------- CAMBIAR TIENDA
UPDATE movimiento
SET centro=(D.bodega*100)-100+1
FROM movimiento M  INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero)
WHERE fec>='01/08/2016' AND D.tipo LIKE 'FCS%' AND M.cuenta ='14350101'


SELECT (D.bodega*100)-100+3,D.bodega,M.*
FROM movimiento M  INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero)
WHERE fec>='01/08/2016' AND D.tipo LIKE 'FCS%' AND M.cuenta  like '1435%'