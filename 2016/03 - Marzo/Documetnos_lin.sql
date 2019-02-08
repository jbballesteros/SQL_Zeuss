SELECT *
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.tipo='FCCG' AND D.numero=325


SELECT *
FROM documentos D INNER JOIN movimiento DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.tipo='FCCG' AND D.numero=325


update documentos_lin
set fec='01/02/2016'
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.tipo='FCBQ' AND D.numero IN (471,472)


update movimiento
set fec='01/02/2016'
FROM documentos D INNER JOIN movimiento DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.tipo='FCCG' AND D.numero IN (471,472)