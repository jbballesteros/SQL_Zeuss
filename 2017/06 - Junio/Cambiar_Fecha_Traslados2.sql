SELECT D.tipo,D.numero,D.fecha,D.fecha_hora,P.fecha,P.fecha_hora
FROM documentos D INNER JOIN (
SELECT D.tipo,D.numero,D.fecha,D.fecha_hora
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.sw=12 AND DL.sw=3 AND DL.codigo=610901 AND DL.fec BETWEEN '01/04/2017' AND '30/04/2017'
) AS P ON (D.prefijo=P.tipo AND D.documento=CAST(P.numero AS VARCHAR(10)))
INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)








update documentos
set fecha=P.fecha , fecha_hora=DATEADD(MINUTE,1,P.FECHA_HORA)
FROM documentos D INNER JOIN (
SELECT D.tipo,D.numero,D.fecha,D.fecha_hora
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.sw=12 AND DL.sw=3  AND DL.fec BETWEEN '01/04/2017' AND '30/04/2017'
) AS P ON (D.prefijo=P.tipo AND D.documento=CAST(P.numero AS VARCHAR(10)))


UPDATE documentos_lin
SET fec=D.fecha
FROM documentos D INNER JOIN (
SELECT D.tipo,D.numero,D.fecha,D.fecha_hora
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.sw=12 AND DL.sw=3  AND DL.fec BETWEEN '01/04/2017' AND '30/04/2017'
) AS P ON (D.prefijo=P.tipo AND D.documento=CAST(P.numero AS VARCHAR(10)))
INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)