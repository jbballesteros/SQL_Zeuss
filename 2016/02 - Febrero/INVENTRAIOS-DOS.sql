SELECT D.tipo,D.numero,D.fecha,DL.fec,D.notas,DL.sw
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE  D.fecha BETWEEN '01/04/2015' AND '30/04/2015' AND (D.sw IN (11,12)) AND DL.sw=3
group by D.tipo,D.numero,D.fecha,DL.fec,D.notas,DL.sw
ORDER BY D.fecha DESC 


