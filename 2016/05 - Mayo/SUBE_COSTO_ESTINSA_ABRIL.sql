SELECT D.tipo,D.numero,D.NIT,D.fecha,D.valor_total,D.NOTAS,DL.codigo,DL.valor_unitario,DL.codigo,DL.adicional
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.fecha>='19/03/2016' AND D.tipo='SCP6'  