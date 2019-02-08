USE estinsa

SELECT TT.descripcion,D.tipo,D.numero,B.descripcion,D.fecha,D.valor_total,D.notas
FROM documentos D INNER JOIN terceros T ON (D.nit=T.nit)
INNER JOIN tipo_transacciones TT ON (D.tipo=TT.tipo)
INNER JOIN bodegas B ON (D.bodega=B.bodega)
WHERE T.nit_real=811043174 AND NOT (D.sw IN (0,13,5,14,16)) AND D.anulado=0
ORDER BY D.sw

USE ZEUSS


SELECT TT.descripcion,D.tipo,D.numero,T.nit,T.nombres,D.fecha,D.valor_total,D.notas
FROM documentos D INNER JOIN terceros T ON (D.nit=T.nit)
INNER JOIN tipo_transacciones TT ON (D.tipo=TT.tipo)
INNER JOIN bodegas B ON (D.bodega=B.bodega)
WHERE T.nit_real=900625898 AND NOT (D.sw IN (0)) AND D.anulado=0
ORDER BY D.sw
