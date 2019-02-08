SELECT R.codigo,R.descripcion,DL.tipo,DL.numero,DL.cantidad,D.fecha,prefijo,documento,DL.fec FECHA_2,D.fecha_hora
FROM documentos D 
INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
INNER JOIN referencias R ON (DL.codigo=R.codigo)
WHERE D.sw in (11,12) AND fecha BETWEEN '01/02/2015' AND '28/02/2015' AND concepto=6 AND anulado=0
ORDER BY DL.codigo,D.tipo,D.numero