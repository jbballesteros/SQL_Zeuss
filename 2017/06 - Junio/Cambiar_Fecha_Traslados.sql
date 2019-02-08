SELECT D.tipo,D.numero,D.fecha,D.fecha_hora
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.sw=12 AND DL.sw=3 AND DL.codigo=700102 AND DL.fec BETWEEN '01/04/2017' AND '30/04/2017'


UPDATE documentos
SET fecha_hora=CAST(fecha_hora AS DATE)
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.sw=12 AND DL.sw=3  AND DL.fec BETWEEN '01/05/2017' AND '31/05/2017'

