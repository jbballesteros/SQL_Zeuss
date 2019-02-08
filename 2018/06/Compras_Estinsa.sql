SELECT *
FROM (

SELECT tipo,numero,anulado,fecha
FROM documentos 
WHERE nit=910055 and sw=1 AND fecha>='01/06/2018' ) AS P FULL JOIN 
(
SELECT tipo,numero,anulado,prefijo,documento,fecha
FROM estinsa.dbo.documentos
WHERE SW=3 AND NIT=811043174 AND fecha>='01/06/2018' AND bodega=3) AS S ON (P.tipo=S.prefijo AND CAST(P.numero AS VARCHAR)=S.documento)

WHERE P.fecha<>S.fecha


