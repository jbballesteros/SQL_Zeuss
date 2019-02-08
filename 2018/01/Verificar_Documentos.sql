SELECT D.tipo,D.numero,D.fecha,D.nit,DL.nit
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.sw IN (13,14) AND D.fecha>'01/01/2018' AND D.nit<>DL.nit


UPDATE documentos
SET nit=DL.nit
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.sw IN (13,14) AND D.fecha>'01/01/2018' AND D.nit<>DL.nit