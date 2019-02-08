SELECT R.codigo,R.descripcion,L.Codigo,L.Descripcion,R.valor_unitario,L.Precio
FROM lista_precios2018_12 L 
LEFT JOIN referencias_alt RA ON (L.Codigo=RA.alterno)
LEFT JOIN referencias R ON (RA.codigo=R.codigo)
WHERE RA.codigo IS NOT NULL
ORDER BY L.Codigo


SELECT L.*
FROM lista_precios2018_12 L 
LEFT JOIN referencias_alt RA ON (L.Codigo=RA.alterno)
LEFT JOIN referencias R ON (RA.codigo=R.codigo)
WHERE RA.codigo IS NULL
ORDER BY L.Codigo